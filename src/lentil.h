#pragma once

#include <iostream>
#include <algorithm>
#include <string>
#include <vector>

#include "../../Eigen/Eigen/Dense"

#include "imagebokeh.h"
#include "lens.h"
#include "global.h"


extern AtCritSec l_critsec;
extern bool l_critsec_active;


///////////////////////////////////////////////
//
//      Crit sec utilities
//
///////////////////////////////////////////////

inline bool lentil_crit_sec_init() {
    // Called in node_plugin_initialize. Returns true as a convenience.
    l_critsec_active = true;
    AiCritSecInit(&l_critsec);
    return true;
}

inline void lentil_crit_sec_close() {
    // Called in node_plugin_cleanup
    l_critsec_active = false;
    AiCritSecClose(&l_critsec);
}

inline void lentil_crit_sec_enter() {
    // If the crit sec has not been inited since last close, we simply do not enter.
    // (Used by Cryptomatte filter.)
    if (l_critsec_active)
        AiCritSecEnter(&l_critsec);
}

inline void lentil_crit_sec_leave() {
    // If the crit sec has not been inited since last close, we simply do not enter.
    // (Used by Cryptomatte filter.)
    if (l_critsec_active)
        AiCritSecLeave(&l_critsec);
}



// enum to switch between lens models in interface dropdown
enum LensModel{
    #include "../include/auto_generated_lens_includes/pota_h_lenses.h"
};

// enum to switch between units in interface dropdown
enum UnitModel{
    mm,
    cm,
    dm,
    m
};

// enum to switch between units in interface dropdown
enum CameraType{
    ThinLens,
    PolynomialOptics
};


struct Camera
{
	LensModel lensModel;
    UnitModel unitModel;
    CameraType cameraType;
    imageData image;

    // lens constants PO
    const char* lens_name;
    double lens_outer_pupil_radius;
    double lens_inner_pupil_radius;
    double lens_length;
    double lens_back_focal_length;
    double lens_effective_focal_length;
    double lens_aperture_pos;
    double lens_aperture_housing_radius;
    double lens_inner_pupil_curvature_radius;
    double lens_outer_pupil_curvature_radius;
    double lens_field_of_view;
    double lens_fstop;
    double lens_aperture_radius_at_fstop;
    std::string lens_inner_pupil_geometry;
    std::string lens_outer_pupil_geometry;

    // parameters global
    double focus_distance;
	double sensor_width;
	double input_fstop;
    bool enable_dof;
    int vignetting_retries;
    int bokeh_aperture_blades;
    bool bokeh_enable_image;
    AtString bokeh_image_path;
    double bidir_min_luminance;
    int bidir_sample_mult;
    float bidir_add_luminance;
    float bidir_add_luminance_transition;
    bool bidir_debug;

    // parameters PO
    double lambda;
    float extra_sensor_shift;

    // parameters TL
    float focal_length;
    float optical_vignetting_distance;
    float optical_vignetting_radius;
    float abb_spherical;
    float abb_coma;
    float abb_distortion;
    float circle_to_square;
    float bokeh_anamorphic;


    // data TL
    float fov;
    double tan_fov;

    // data PO
    double max_fstop;

	double aperture_radius;
	double sensor_shift;
    
    double random1;
    double random2;

    AtNode *filter_node;
    AtNode *camera_node;
    AtNode *imager_node;



    // filter/imager data
    unsigned xres;
    unsigned yres;
    unsigned xres_without_region;
    unsigned yres_without_region;
    int region_min_x;
    int region_min_y;
    int region_max_x;
    int region_max_y;
    int shift_x;
    int shift_y;
    int samples;
    bool redistribution;
    float current_inv_density;
    float filter_width;
    float time_start;
    float time_end;
    std::map<AtString, std::vector<AtRGBA> > aov_buffers;
    std::map<AtString, unsigned int> aov_duplicates;
    std::vector<float> zbuffer;
    std::vector<AtString> aov_list_name;
    std::vector<unsigned int> aov_list_type;
    std::vector<bool> aov_crypto;

    std::map<AtString, std::vector<std::map<float, float>>> crypto_hash_map;
    std::map<AtString, std::vector<float>> crypto_total_weight;
    std::vector<AtString> cryptomatte_aov_names;

    const AtString atstring_rgba = AtString("RGBA");
    const AtString atstring_p = AtString("P");
    const AtString atstring_z = AtString("Z");
    const AtString atstring_transmission = AtString("transmission");
    const AtString atstring_opacity = AtString("opacity");
    const AtString atstring_lentil_ignore = AtString("lentil_ignore");
    const AtString atstring_motionvector = AtString("lentil_object_motion_vector");
    const AtString atstring_time = AtString("lentil_time");

    bool cryptomatte;

    bool imager_print_once_only;



public:

    Camera() {
        if (!l_critsec_active)
            AiMsgError("[Lentil] Critical section was not initialized. ");
    }

    ~Camera() {
        image.invalidate();
        destroy_buffers();
    }

    void setup_all (AtUniverse *universe) {

        lentil_crit_sec_enter();

        destroy_buffers();

        camera_node = AiUniverseGetCamera(universe);
        get_lentil_camera_params();
        
        redistribution = get_bidirectional_status(universe); // this should include AA level test
        if (redistribution) {
            setup_aovs(universe);
            setup_filter(universe);
        }

        camera_model_specific_setup();

        // make probability functions of the bokeh image
        // if (!(po->stored_useImage == AiNodeGetBool(node, "bokeh_enable_imagePO") && po->stored_path == AiNodeGetStr(node, "bokeh_image_pathPO")) {
        image.invalidate();
        if (bokeh_enable_image && !image.read(bokeh_image_path.c_str())){
            AiMsgError("[LENTIL CAMERA PO] Couldn't open bokeh image!");
            AiRenderAbort();
        }

        lentil_crit_sec_leave();
    }


    inline void trace_ray_fw_po(bool original_ray, int &tries, 
                                const double input_sx, const double input_sy, 
                                const double input_lensx, const double input_lensy, 
                                double &r1, double &r2, 
                                Eigen::Vector3d &weight, Eigen::Vector3d &origin, Eigen::Vector3d &direction)
    {

        tries = 0;
        bool ray_succes = false;

        Eigen::VectorXd sensor(5); sensor.setZero();
        Eigen::VectorXd aperture(5); aperture.setZero();
        Eigen::VectorXd out(5); out.setZero();

        while(!ray_succes && tries <= vignetting_retries){

            // set sensor position coords
            sensor(0) = input_sx * (sensor_width * 0.5);
            sensor(1) = input_sy * (sensor_width * 0.5);
            sensor(2) = sensor(3) = 0.0;
            sensor(4) = lambda;

            aperture.setZero();
            out.setZero();


            if (!enable_dof) aperture(0) = aperture(1) = 0.0; // no dof, all rays through single aperture point
            
            Eigen::Vector2d unit_disk(0.0, 0.0);
            if (tries == 0 && enable_dof) {
                if (bokeh_enable_image) {
                    image.bokehSample(input_lensx, input_lensy, unit_disk, xor128() / 4294967296.0, xor128() / 4294967296.0);
                } else if (bokeh_aperture_blades < 2) {
                    concentric_disk_sample(input_lensx, input_lensy, unit_disk, false);
                } else {
                    lens_sample_triangular_aperture(unit_disk(0), unit_disk(1), input_lensx, input_lensy, 1.0, bokeh_aperture_blades);
                }
            } else if (tries > 0 && enable_dof){
                r1 = xor128() / 4294967296.0;
                r2 = xor128() / 4294967296.0;
                
                if (bokeh_enable_image) {
                image.bokehSample(r1, r2, unit_disk, xor128() / 4294967296.0, xor128() / 4294967296.0);
                } else if (bokeh_aperture_blades < 2) {
                concentric_disk_sample(r1, r2, unit_disk, true);
                } else {
                lens_sample_triangular_aperture(unit_disk(0), unit_disk(1), r1, r2, 1.0, bokeh_aperture_blades);
                }
            }

            aperture(0) = unit_disk(0) * aperture_radius;
            aperture(1) = unit_disk(1) * aperture_radius;
            
            


            // if (empirical_ca_dist > 0.0) {
            //   Eigen::Vector2d sensor_pos(sensor[0], sensor[1]);
            //   Eigen::Vector2d aperture_pos(aperture[0], aperture[1]);
            //   weight = chromatic_abberration_empirical(sensor_pos, empirical_ca_dist, aperture_pos, aperture_radius);
            //   aperture(0) = aperture_pos(0);
            //   aperture(1) = aperture_pos(1);
            // }
            

            if (enable_dof) {
                // aperture sampling, to make sure ray is able to propagate through whole lens system
                lens_pt_sample_aperture(sensor, aperture, sensor_shift);
            }
            

            // move to beginning of polynomial
            sensor(0) += sensor(2) * sensor_shift;
            sensor(1) += sensor(3) * sensor_shift;


            // propagate ray from sensor to outer lens element
            double transmittance = lens_evaluate(sensor, out);
            if(transmittance <= 0.0) {
                ++tries;
                continue;
            }


            // crop out by outgoing pupil
            if( out(0)*out(0) + out(1)*out(1) > lens_outer_pupil_radius*lens_outer_pupil_radius){
                ++tries;
                continue;
            }


            // crop at inward facing pupil
            const double px = sensor(0) + sensor(2) * lens_back_focal_length;
            const double py = sensor(1) + sensor(3) * lens_back_focal_length; //(note that lens_back_focal_length is the back focal length, i.e. the distance unshifted sensor -> pupil)
            if (px*px + py*py > lens_inner_pupil_radius*lens_inner_pupil_radius) {
                ++tries;
                continue;
            }
                
            ray_succes = true;
        }

        if (ray_succes == false) weight.setZero();


        // convert from sphere/sphere space to camera space
        Eigen::Vector2d outpos(out[0], out[1]);
        Eigen::Vector2d outdir(out[2], out[3]);
        Eigen::Vector3d cs_origin(0,0,0);
        Eigen::Vector3d cs_direction(0,0,0);
        if (lens_outer_pupil_geometry == "cyl-y") cylinderToCs(outpos, outdir, cs_origin, cs_direction, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius, true);
        else if (lens_outer_pupil_geometry == "cyl-x") cylinderToCs(outpos, outdir, cs_origin, cs_direction, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius, false);
        else sphereToCs(outpos, outdir, cs_origin, cs_direction, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius);
        
        origin = cs_origin;
        direction = cs_direction;

        //printf("[%f,%f,%f],", origin[0], origin[1], origin[2]);


        switch (unitModel){
            case mm:
            {
                origin *= -1.0; // reverse rays and convert to cm (from mm)
                direction *= -1.0; //reverse rays and convert to cm (from mm)
            } break;
            case cm:
            { 
                origin *= -0.1; // reverse rays and convert to cm (from mm)
                direction *= -0.1; //reverse rays and convert to cm (from mm)
            } break;
            case dm:
            {
                origin *= -0.01; // reverse rays and convert to cm (from mm)
                direction *= -0.01; //reverse rays and convert to cm (from mm)
            } break;
            case m:
            {
                origin *= -0.001; // reverse rays and convert to cm (from mm)
                direction *= -0.001; //reverse rays and convert to cm (from mm)
            }
        }

        direction.normalize();

        // Nan bailout
        if (origin(0) != origin(0) || origin(1) != origin(1) || origin(2) != origin(2) || 
            direction(0) != direction(0) || direction(1) != direction(1) || direction(2) != direction(2))
        {
            weight.setZero();
        }

    }



    inline void trace_ray_fw_thinlens(bool original_ray, int &tries, 
                                    float sx, float sy, float lensx, float lensy, 
                                    AtVector &origin, AtVector &dir, AtRGB &weight,
                                    float &r1, float &r2){
        tries = 0;
        bool ray_succes = false;

        while (!ray_succes && tries <= vignetting_retries){
            
            // distortion
            AtVector s(sx, sy, 0.0);
            if (abb_distortion > 0.0){
                AtVector2 s2 = barrelDistortion(AtVector2(sx, sy), abb_distortion);
                s = {s2.x, s2.y, 0.0};
            }
            

            // create point on sensor (camera space)
            const AtVector p(s.x * (sensor_width*0.5), 
                            s.y * (sensor_width*0.5), 
                            -focal_length);
                

            // calculate direction vector from origin to point on lens
            AtVector dir_from_center = AiV3Normalize(p); // or norm(p-origin)

            // either get uniformly distributed points on the unit disk or bokeh image
            Eigen::Vector2d unit_disk(0, 0);
            if (tries == 0 && enable_dof) { // make use of blue noise sampler in arnold
                if (bokeh_enable_image) {
                    image.bokehSample(lensx, lensy, unit_disk, xor128() / 4294967296.0, xor128() / 4294967296.0);
                } else if (bokeh_aperture_blades < 2) {
                    concentricDiskSample(lensx, lensy, unit_disk, abb_spherical, circle_to_square, bokeh_anamorphic);
                } else {
                    lens_sample_triangular_aperture(unit_disk(0), unit_disk(1), lensx, lensy, 1.0, bokeh_aperture_blades);
                }
            } else if (tries > 0 && enable_dof){
                r1 = xor128() / 4294967296.0;
                r2 = xor128() / 4294967296.0;

                if (bokeh_enable_image) {
                    image.bokehSample(r1, r2, unit_disk, xor128() / 4294967296.0, xor128() / 4294967296.0);
                } else if (bokeh_aperture_blades < 2) {
                    concentricDiskSample(r1, r2, unit_disk, abb_spherical, circle_to_square, bokeh_anamorphic);
                } else {
                    lens_sample_triangular_aperture(unit_disk(0), unit_disk(1), r1, r2, 1.0, bokeh_aperture_blades);
                }
            }

            unit_disk(0) *= bokeh_anamorphic;



            // aberration inputs
            float abb_field_curvature = 0.0;



            AtVector lens(unit_disk(0) * aperture_radius, unit_disk(1) * aperture_radius, 0.0);
            const float intersection = std::abs(focus_distance / linear_interpolate(abb_field_curvature, dir_from_center.z, 1.0));
            const AtVector focusPoint = dir_from_center * intersection;
            AtVector dir_from_lens = AiV3Normalize(focusPoint - lens);
            

            // perturb ray direction to simulate coma aberration
            float abb_coma = abb_coma * abb_coma_multipliers(sensor_width, focal_length, dir_from_center, unit_disk);
            dir_from_lens = abb_coma_perturb(dir_from_lens, dir_from_lens, abb_coma, false);


            if (optical_vignetting_distance > 0.0){
                if (!empericalOpticalVignettingSquare(lens, dir_from_lens, aperture_radius, optical_vignetting_radius, optical_vignetting_distance, lerp_squircle_mapping(circle_to_square))){
                    ++tries;
                    continue;
                }
            }


            // weight = AI_RGB_WHITE;
            // if (emperical_ca_dist > 0.0){
            //     const AtVector2 p2(p.x, p.y);
            //     const float distance_to_center = AiV2Dist(AtVector2(0.0, 0.0), p2);
            //     const int random_aperture = static_cast<int>(std::floor((xor128() / 4294967296.0) * 3.0));
            //     AtVector2 aperture_0_center(0.0, 0.0);
            //     AtVector2 aperture_1_center(- p2 * coc * emperical_ca_dist); //previous: change coc for dist_to_center
            //     AtVector2 aperture_2_center(p2 * coc * emperical_ca_dist);//previous: change coc for dist_to_center
                

            //     if (random_aperture == 1)      lens += aperture_1_center;
            //     else if (random_aperture == 2) lens += aperture_2_center;

            //     if (std::pow(lens.x-aperture_1_center.x, 2) + std::pow(lens.y - aperture_1_center.y, 2) > std::pow(aperture_radius, 2)) {
            //         weight.r = 0.0;
            //     }
            //     if (std::pow(lens.x-aperture_0_center.x, 2) + std::pow(lens.y - aperture_0_center.y, 2) > std::pow(aperture_radius, 2)) {
            //         weight.b = 0.0;
            //     }
            //     if (std::pow(lens.x-aperture_2_center.x, 2) + std::pow(lens.y - aperture_2_center.y, 2) > std::pow(aperture_radius, 2)) {
            //         weight.g = 0.0;
            //     }

            //     if (weight == AI_RGB_ZERO){
            //         ++tries;
            //         continue;
            //     }
            
            // //     //ca, not sure if this should be done, evens out the intensity?
            // //     // float sum = (output.weight.r + output.weight.g + output.weight.b) / 3.0;
            // //     // output.weight.r /= sum;
            // //     // output.weight.g /= sum;
            // //     // output.weight.b /= sum;
            // }

            origin = lens;
            dir = dir_from_lens;

            switch (unitModel){
                case mm:
                {
                    origin *= 10.0; // reverse rays and convert to cm (from mm)
                    dir *= 10.0; //reverse rays and convert to cm (from mm)
                } break;
                case cm:
                { 
                    origin *= 1.0; // reverse rays and convert to cm (from mm)
                    dir *= 1.0; //reverse rays and convert to cm (from mm)
                } break;
                case dm:
                {
                    origin *= 0.1; // reverse rays and convert to cm (from mm)
                    dir *= 0.1; //reverse rays and convert to cm (from mm)
                } break;
                case m:
                {
                    origin *= 0.01; // reverse rays and convert to cm (from mm)
                    dir *= 0.01; //reverse rays and convert to cm (from mm)
                }
            }

            dir = AiV3Normalize(dir);

            // weight = AI_RGB_WHITE;
            ray_succes = true;
        }

        if (!ray_succes) weight = AI_RGB_BLACK;
    }


    // given camera space scene point, return point on sensor
    inline bool trace_ray_bw_po(Eigen::Vector3d target,
                                Eigen::Vector2d &sensor_position,
                                const int px, 
                                const int py,
                                const int total_samples_taken,
                                AtMatrix cam_to_world,
                                AtVector sample_pos_ws,
                                AtShaderGlobals *sg)
    {
        int tries = 0;
        bool ray_succes = false;

        // initialize 5d light fields
        Eigen::VectorXd sensor(5); sensor << 0,0,0,0, lambda;
        Eigen::VectorXd out(5); out << 0,0,0,0, lambda;//out.setZero();
        Eigen::Vector2d aperture(0,0);
        
        while(ray_succes == false && tries <= vignetting_retries){

            Eigen::Vector2d unit_disk(0.0, 0.0);

            if (!enable_dof) aperture(0) = aperture(1) = 0.0; // no dof, all rays through single aperture point
            else if (enable_dof && bokeh_aperture_blades <= 2) {
                unsigned int seed = tea<8>(px*py+px, total_samples_taken+tries);

                if (bokeh_enable_image) image.bokehSample(rng(seed), rng(seed), unit_disk, rng(seed), rng(seed));
                else concentric_disk_sample(rng(seed), rng(seed), unit_disk, true);

                aperture(0) = unit_disk(0) * aperture_radius;
                aperture(1) = unit_disk(1) * aperture_radius;
            } 
            else if (enable_dof && bokeh_aperture_blades > 2) {
                unsigned int seed = tea<8>(px*py+px, total_samples_taken+tries);
                lens_sample_triangular_aperture(aperture(0), aperture(1), rng(seed), rng(seed), aperture_radius, bokeh_aperture_blades);
            }


            // raytrace for scene/geometrical occlusions along the ray
            AtVector lens_correct_scaled = AtVector(-aperture(0)*0.1, -aperture(1)*0.1, 0.0);
            switch (unitModel){
                case mm: { lens_correct_scaled /= 0.1; } break;
                case cm: { lens_correct_scaled /= 1.0; } break;
                case dm: { lens_correct_scaled /= 10.0;} break;
                case m:  { lens_correct_scaled /= 100.0;}
            }
            AtVector cam_pos_ws = AiM4PointByMatrixMult(cam_to_world, lens_correct_scaled);
            AtVector ws_direction = cam_pos_ws - sample_pos_ws;
            AtRay ray = AiMakeRay(AI_RAY_SHADOW, sample_pos_ws, &ws_direction, AI_BIG, sg);
            if (AiTraceProbe(ray, sg)){
                ++tries;
                continue;
            }

            sensor(0) = sensor(1) = 0.0;

            float transmittance = lens_lt_sample_aperture(target, aperture, sensor, out, lambda);
            if(transmittance <= 0) {
                ++tries;
                continue;
            }

            // crop at inward facing pupil, not needed to crop by outgoing because already done in lens_lt_sample_aperture()
            const double px = sensor(0) + sensor(2) * lens_back_focal_length;
            const double py = sensor(1) + sensor(3) * lens_back_focal_length; //(note that lens_focal_length is the back focal length, i.e. the distance unshifted sensor -> pupil)
            if (px*px + py*py > lens_inner_pupil_radius*lens_inner_pupil_radius) {
                ++tries;
                continue;
            }

            ray_succes = true;
        }

        // need to account for the ray_success==false case
        if (!ray_succes) return false;

        // shift sensor
        sensor(0) += sensor(2) * -sensor_shift;
        sensor(1) += sensor(3) * -sensor_shift;

        sensor_position(0) = sensor(0);
        sensor_position(1) = sensor(1);

        return true;
    }



    inline float get_image_dist_focusdist_thinlens(){
        return (-focal_length * -focus_distance) / (-focal_length + -focus_distance);
    }


    inline float get_coc_thinlens(AtVector camera_space_sample_position){
        // need to account for the differences in setup between the two methods, since the inputs are scaled differently in the camera shader
        float _focus_distance = focus_distance;
        float _aperture_radius = aperture_radius;
        switch (cameraType){
            case PolynomialOptics:
            { 
                _focus_distance /= 10.0;
            } break;
            case ThinLens:
            {
                _aperture_radius *= 10.0;
            } break;
        }
        
        const float image_dist_samplepos = (-focal_length * camera_space_sample_position.z) / (-focal_length + camera_space_sample_position.z);
        const float image_dist_focusdist = (-focal_length * -_focus_distance) / (-focal_length + -_focus_distance);
        return std::abs((_aperture_radius * (image_dist_samplepos - image_dist_focusdist))/image_dist_samplepos); // coc diameter
    }



    AtRGBA filter_closest_complete(AtAOVSampleIterator *iterator, const uint8_t aov_type){
        AtRGBA pixel_energy = AI_RGBA_ZERO;
        float z = 0.0;

        while (AiAOVSampleIteratorGetNext(iterator))
        {
            float depth = AiAOVSampleIteratorGetAOVFlt(iterator, atstring_z);
            if ((std::abs(depth) <= z) || z == 0.0){
                
                z = std::abs(depth);

                switch (aov_type){
                case AI_TYPE_VECTOR: {
                    const AtVector sample_energy = AiAOVSampleIteratorGetVec(iterator);
                    pixel_energy = AtRGBA(sample_energy.x, sample_energy.y, sample_energy.z, 1.0);
                    break;
                }
                case AI_TYPE_FLOAT: {
                    const float sample_energy = AiAOVSampleIteratorGetFlt(iterator);
                    pixel_energy = AtRGBA(sample_energy, sample_energy, sample_energy, 1.0);
                    break;
                }
                // case AI_TYPE_INT: {
                //   const int sample_energy = AiAOVSampleIteratorGetInt(iterator);
                //   pixel_energy = AtRGBA(sample_energy, sample_energy, sample_energy, 1.0);
                //   break;
                // }
                // case AI_TYPE_UINT: {
                //   const unsigned sample_energy = AiAOVSampleIteratorGetUInt(iterator);
                //   pixel_energy = AtRGBA(sample_energy, sample_energy, sample_energy, 1.0);
                //   break;
                // }
                }
            }
        }

        return pixel_energy;
    }


    AtRGBA filter_gaussian_complete(AtAOVSampleIterator *iterator, const uint8_t aov_type){
        float aweight = 0.0f;
        AtRGBA avalue = AI_RGBA_ZERO;

        while (AiAOVSampleIteratorGetNext(iterator))
        {
            // take into account adaptive sampling
            // float inv_density = AiAOVSampleIteratorGetInvDensity(iterator);
            if (current_inv_density <= 0.f) continue;

            // determine distance to filter center
            const AtVector2& offset = AiAOVSampleIteratorGetOffset(iterator);
            const float r = AiSqr(2 / filter_width) * (AiSqr(offset.x) + AiSqr(offset.y));
            if (r > 1.0f) continue;

            // gaussian filter weight
            const float weight = AiFastExp(2 * -r) * current_inv_density;

            // accumulate weights and colors
            AtRGBA sample_energy = AI_RGBA_ZERO;
            switch (aov_type){
                case AI_TYPE_RGBA: {
                    sample_energy = AiAOVSampleIteratorGetRGBA(iterator);
                } break;
                case AI_TYPE_RGB: {
                    AtRGB sample_energy_rgb = AiAOVSampleIteratorGetRGB(iterator);
                    sample_energy = AtRGB(sample_energy_rgb.r, sample_energy_rgb.g, sample_energy_rgb.b);
                } break;
            }
            
            avalue += weight * sample_energy;
            aweight += weight;
        }
        
        // compute final filtered color
        if (aweight != 0.0f) avalue /= aweight;

        return avalue;
    }



    // get all depth samples so i can re-use them
    inline void cryptomatte_construct_cache(std::map<AtString, std::map<float, float>> &crypto_hashmap_cache,
                                            std::vector<AtString> &cryptomatte_aov_names,
                                            struct AtAOVSampleIterator* sample_iterator, 
                                            const int sampleid) {

        for (auto &aov : cryptomatte_aov_names) {

            float iterative_transparency_weight = 1.0f;
            float quota = 1.0;
            float sample_value = 0.0f;

            while (AiAOVSampleIteratorGetNextDepth(sample_iterator)) {
                const float sub_sample_opacity = AiColorToGrey(AiAOVSampleIteratorGetAOVRGB(sample_iterator, atstring_opacity));
                sample_value = AiAOVSampleIteratorGetAOVFlt(sample_iterator, aov);
                const float sub_sample_weight = sub_sample_opacity * iterative_transparency_weight;

                // so if the current sub sample is 80% opaque, it means 20% of the weight will remain for the next subsample
                iterative_transparency_weight *= (1.0f - sub_sample_opacity);

                quota -= sub_sample_weight;

                crypto_hashmap_cache[aov][sample_value] += sub_sample_weight;
            }

            // the remaining values gets allocated to the last sample
            if (quota > 0.0) crypto_hashmap_cache[aov][sample_value] += quota;

            // reset is required because AiAOVSampleIteratorGetNextDepth() automatically moves to next sample after final depth sample
            // still need to use the iterator afterwards, so need to do a reset to the current sample id
            reset_iterator_to_id(sample_iterator, sampleid);
        }
    }


    inline void add_to_buffer_cryptomatte(int px, std::map<float, float> &cryptomatte_cache, const AtString aov_name, const float sample_weight) {
        crypto_total_weight[aov_name][px] += sample_weight;
        for (auto const& sample : cryptomatte_cache) {
            crypto_hash_map[aov_name][px][sample.first] += sample.second * sample_weight;
        }
    }


    inline void add_to_buffer(int px, int aov_type, AtString aov_name, AtRGBA aov_value,
                            float inv_samples, float inv_density, float fitted_bidir_add_luminance, float depth,
                            bool transmitted_energy_in_sample, int transmission_layer,
                            struct AtAOVSampleIterator* sample_iterator) {


        const float inv_aov_count = 1.0/(double)aov_duplicates[aov_name];
        
        switch(aov_type){

            case AI_TYPE_RGBA: {
            // RGBA is the only aov with transmission component in, account for that (prob skip something)
            AtRGBA rgba_energy = aov_value;
            if (transmitted_energy_in_sample && transmission_layer == 0) rgba_energy = AiAOVSampleIteratorGetAOVRGBA(sample_iterator, atstring_transmission);
            else if (transmitted_energy_in_sample && transmission_layer == 1) rgba_energy -= AiAOVSampleIteratorGetAOVRGBA(sample_iterator, atstring_transmission);

            aov_buffers[aov_name][px] += (rgba_energy+fitted_bidir_add_luminance) * inv_density * inv_samples * inv_aov_count;

            break;
            }

            case AI_TYPE_RGB: { // could be buggy due to discrepancy between this and RGBA above??? test!
            const AtRGBA rgba_energy = aov_value;
            aov_buffers[aov_name][px] += (rgba_energy+fitted_bidir_add_luminance) * inv_density * inv_samples;
            
            break;
            }

            case AI_TYPE_VECTOR: {
            if ((std::abs(depth) <= zbuffer[px]) || zbuffer[px] == 0.0){
                aov_buffers[aov_name][px] = aov_value;
                zbuffer[px] = std::abs(depth);
            }

            break;
            }

            case AI_TYPE_FLOAT: {
            if ((std::abs(depth) <= zbuffer[px]) || zbuffer[px] == 0.0){
                aov_buffers[aov_name][px] = aov_value;
                zbuffer[px] = std::abs(depth);
            }
        
            break;
            }

            // case AI_TYPE_INT: {
            //   if ((std::abs(depth) <= zbuffer[px]) || zbuffer[px] == 0.0){
            //     const int int_energy = AiAOVSampleIteratorGetAOVInt(sample_iterator, aov_name);
            //     const AtRGBA rgba_energy = AtRGBA(int_energy, int_energy, int_energy, 1.0);
            //     aov_buffers[aov_name][px] = rgba_energy;
            //     zbuffer[px] = std::abs(depth);
            //   }

            //   break;
            // }

            // case AI_TYPE_UINT: {
            //   if ((std::abs(depth) <= zbuffer[px]) || zbuffer[px] == 0.0){
            //     const unsigned uint_energy = AiAOVSampleIteratorGetAOVUInt(sample_iterator, aov_name);
            //     const AtRGBA rgba_energy = AtRGBA(uint_energy, uint_energy, uint_energy, 1.0);
            //     aov_buffers[aov_name][px] = rgba_energy;
            //     zbuffer[px] = std::abs(depth);
            //   }

            //   break;
            // }

            // case AI_TYPE_POINTER: {
            //   if ((std::abs(depth) <= zbuffer[px]) || zbuffer[px] == 0.0){
            //     const void *ptr_energy = AiAOVSampleIteratorGetAOVPtr(sample_iterator, aov_name);
            //     image_ptr_types[aov_name][px] = ptr_energy;
            //     zbuffer[px] = std::abs(depth);
            //   }

            //   break;
            // }
        }
    }

    inline void filter_and_add_to_buffer(int px, int py, float filter_width_half, 
                                        float inv_samples, float inv_density, float depth, 
                                        bool transmitted_energy_in_sample, int transmission_layer, int sampleid,
                                        struct AtAOVSampleIterator* iterator,
                                        std::map<AtString, std::map<float, float>> &cryptomatte_cache, std::vector<AtRGBA> &aov_values){

        // loop over all pixels in filter radius, then compute the filter weight based on the offset not to the original pixel (px, py), but the filter pixel (x, y)
        for (unsigned y = py - filter_width_half; y <= py + filter_width_half; y++) {
            for (unsigned x = px - filter_width_half; x <= px + filter_width_half; x++) {

                if (y < 0 || y >= yres) continue; // edge fix
                if (x < 0 || x >= xres) continue; // edge fix

                const unsigned pixelnumber = static_cast<int>(xres * y + x);
                
                const AtVector2 &subpixel_position = AiAOVSampleIteratorGetOffset(iterator); // offset within original pixel
                AtVector2 subpixel_pos_dist = AtVector2((px+subpixel_position.x) - x, (py+subpixel_position.y) - y);
                float filter_weight = filter_weight_gaussian(subpixel_pos_dist, filter_width);
                if (filter_weight == 0) continue;

                float inv_filter_samples = (1.0 / filter_width_half) / 12.5555; // figure this out so it doesn't break when filter width is not 2


                for (unsigned i=0; i<aov_list_name.size(); i++){
                    if (aov_crypto[i]){
                        add_to_buffer_cryptomatte(pixelnumber, cryptomatte_cache[aov_list_name[i]], aov_list_name[i], filter_weight * inv_samples * inv_filter_samples * inv_density);
                    } else {
                        add_to_buffer(pixelnumber, aov_list_type[i], aov_list_name[i], aov_values[i],
                                    inv_samples * inv_filter_samples, inv_density, 0.0, depth, transmitted_energy_in_sample, transmission_layer, iterator);
                    }
                }
            }
        }
    }


    inline int coords_to_linear_pixel(const int x, const int y) {
        return x + (y * xres);
    }

    inline int coords_to_linear_pixel_region(const int x, const int y) {
        return (x-region_min_x) + ((y-region_min_y) * xres);
    }

    // inline void linear_pixel_to_coords(const int linear_pixel, int &x, int &y, const int xres) {
    //   x = linear_pixel % xres;
    //   y = (int)(linear_pixel / xres);
    // }

    // inline void linear_pixel_region_to_coords(const int linear_pixel, int &x, int &y, const int xres, const int region_min_x, const int region_min_y) {
    //   x = (linear_pixel % xres) + region_min_x;
    //   y = (int)(linear_pixel / xres) + region_min_y;
    // }

    inline Eigen::Vector2d sensor_to_pixel_position(const Eigen::Vector2d sensor_position, const float frame_aspect_ratio){
        // convert sensor position to pixel position
        const Eigen::Vector2d s(sensor_position(0) / (sensor_width * 0.5), sensor_position(1) / (sensor_width * 0.5) * frame_aspect_ratio);
        const Eigen::Vector2d pixel((( s(0) + 1.0) / 2.0) * xres, 
                                    ((-s(1) + 1.0) / 2.0) * yres);
        return pixel;
    }



private:

    // currently destroying ALL data just to be sure, probably only have to do the vectors
    void destroy_buffers() {
        zbuffer.clear();
        aov_list_name.clear();
        aov_list_type.clear();
        aov_crypto.clear();
        aov_duplicates.clear();
        crypto_hash_map.clear();
        crypto_total_weight.clear();
        cryptomatte_aov_names.clear();
        aov_buffers.clear();
        // image_ptr_types.clear();
    }

    void setup_aovs(AtUniverse *universe) {

        // // lentil aov setup
        // const AtNodeEntry *crypto_ne = AiNodeEntryLookUp(AtString("cryptomatte"));
        // if (AiNodeEntryGetCount(crypto_ne) == 0) {
        //     operator_data->cook = true;
        // }


        bool lentil_filter_found = false;
        if (AiNodeEntryGetCount(AiNodeEntryLookUp("lentil_filter")) == 0){
            filter_node = AiNode(universe, "lentil_filter", AtString("lentil_replaced_filter"));
        } else {
            lentil_filter_found = true;
        }

        AtArray* outputs = AiNodeGetArray(AiUniverseGetOptions(universe), "outputs");
        std::vector<std::string> output_strings;
        bool lentil_time_found = false;

        const int elements = AiArrayGetNumElements(outputs);
        for (int i=0; i<elements; i++) {
            
            std::string output_string = AiArrayGetStr(outputs, i).c_str();
            
            auto [filter_index, output_string_split] = find_filter_index_in_aov_string(output_string, universe);
            std::string filter = output_string_split[filter_index];
            std::string type = output_string_split[filter_index-1];
            std::string name = output_string_split[filter_index-2];

            if (name == "lentil_time"){
                lentil_time_found = true;
                output_strings.push_back(output_string);
                continue;
            }

            // lentil unsupported
            if (type != "RGBA" && type != "RGB" && type != "FLOAT" && type != "VECTOR") {
                output_strings.push_back(output_string);
                continue;
            }

            if (name.find("crypto_") != std::string::npos){
                output_strings.push_back(output_string);
                continue;
            }
            
            if (filter != "lentil_replaced_filter") {
                output_string.replace(output_string.find(filter), filter.length(), "lentil_replaced_filter");        
            }
            
            output_strings.push_back(output_string);
        }
        

        if (!lentil_time_found) {
            std::string tmp_first_aov = output_strings[0];
            auto [filter_index, output_string_split] = find_filter_index_in_aov_string(tmp_first_aov, universe);
            std::string type = output_string_split[filter_index-1];
            std::string name = output_string_split[filter_index-2];
            tmp_first_aov.replace(tmp_first_aov.find(name), name.length(), "lentil_time");
            tmp_first_aov.replace(tmp_first_aov.find(type), type.length(), "FLOAT");
            output_strings.push_back(tmp_first_aov);
        }

        AtArray *final_outputs = AiArrayAllocate(output_strings.size(), 1, AI_TYPE_STRING);
        uint32_t i = 0;
        for (auto &output : output_strings){
            AiArraySetStr(final_outputs, i++, output.c_str());
            auto [filter_index, output_string_split] = find_filter_index_in_aov_string(output, universe);
            std::string type = output_string_split[filter_index-1];
            AiAOVRegister(output.c_str(), string_to_arnold_type(type), AI_AOV_BLEND_NONE); // watch out for type here!!
        }
        AiNodeSetArray(AiUniverseGetOptions(universe), "outputs", final_outputs);



        // need to add an entry to the aov_shaders (NODE)
        AtArray* aov_shaders_array = AiNodeGetArray(AiUniverseGetOptions(universe), "aov_shaders");
        int aov_shader_array_size = AiArrayGetNumElements(aov_shaders_array);

        if (!lentil_filter_found){
            AtNode *time_write = AiNode(universe, "aov_write_float", AtString("lentil_time_write"));
            AtNode *time_read = AiNode(universe, "state_float", AtString("lentil_time_read"));

            // set time node params/linking
            AiNodeSetStr(time_read, AtString("variable"), AtString("time"));
            AiNodeSetStr(time_write, AtString("aov_name"), AtString("lentil_time"));
            AiNodeLink(time_read, "aov_input", time_write);

            AiArrayResize(aov_shaders_array, aov_shader_array_size+1, 1);
            AiArraySetPtr(aov_shaders_array, aov_shader_array_size, (void*)time_write);
            AiNodeSetArray(AiUniverseGetOptions(universe), "aov_shaders", aov_shaders_array);
        }
    }



    void get_lentil_camera_params() {
        cameraType = (CameraType) AiNodeGetInt(camera_node, "cameratype");
        unitModel = (UnitModel) AiNodeGetInt(camera_node, "units");
        sensor_width = AiNodeGetFlt(camera_node, "sensor_width");
        enable_dof = AiNodeGetBool(camera_node, "enable_dof");
        input_fstop = clamp_min(AiNodeGetFlt(camera_node, "fstop"), 0.01);
        focus_distance = AiNodeGetFlt(camera_node, "focus_dist"); //converting to mm
        bokeh_aperture_blades = AiNodeGetInt(camera_node, "bokeh_aperture_blades");

        // po-specific params
        lensModel = (LensModel) AiNodeGetInt(camera_node, "lens_model");
        lambda = AiNodeGetFlt(camera_node, "wavelength") * 0.001;
        extra_sensor_shift = AiNodeGetFlt(camera_node, "extra_sensor_shift");

        // tl specific params
        focal_length = clamp_min(AiNodeGetFlt(camera_node, "focal_length_lentil"), 0.01);
        optical_vignetting_distance = AiNodeGetFlt(camera_node, "optical_vignetting_distance");
        optical_vignetting_radius = AiNodeGetFlt(camera_node, "optical_vignetting_radius");
        abb_spherical = AiNodeGetFlt(camera_node, "abb_spherical");
        abb_spherical = clamp(abb_spherical, 0.001, 0.999);
        abb_distortion = AiNodeGetFlt(camera_node, "abb_distortion");
        abb_coma = AiNodeGetFlt(camera_node, "abb_coma");
        circle_to_square = AiNodeGetFlt(camera_node, "bokeh_circle_to_square");
        circle_to_square = clamp(circle_to_square, 0.01, 0.99);
        bokeh_anamorphic = AiNodeGetFlt(camera_node, "bokeh_anamorphic");
        bokeh_anamorphic = clamp(bokeh_anamorphic, 0.01, 99999.0);

        // bidir params
        bidir_min_luminance = AiNodeGetFlt(camera_node, "bidir_min_luminance");
        bokeh_enable_image = AiNodeGetBool(camera_node, "bokeh_enable_image");
        bokeh_image_path = AiNodeGetStr(camera_node, "bokeh_image_path");
        bidir_sample_mult = AiNodeGetInt(camera_node, "bidir_sample_mult");
        bidir_add_luminance = AiNodeGetFlt(camera_node, "bidir_add_luminance");
        bidir_add_luminance_transition = AiNodeGetFlt(camera_node, "bidir_add_luminance_transition");
        bidir_debug = AiNodeGetBool(camera_node, "bidir_debug");
        vignetting_retries = AiNodeGetInt(camera_node, "vignetting_retries");
    }


    // evaluates from sensor (in) to outer pupil (out).
    // input arrays are 5d [x,y,dx,dy,lambda] where dx and dy are the direction in
    // two-plane parametrization (that is the third component of the direction would be 1.0).
    // units are millimeters for lengths and micrometers for the wavelength (so visible light is about 0.4--0.7)
    // returns the transmittance computed from the polynomial.
    inline double lens_evaluate(const Eigen::VectorXd in, Eigen::VectorXd &out)
    {
        const double x = in[0], y = in[1], dx = in[2], dy = in[3], lambda = in[4];
        double out_transmittance = 0.0;
        switch (lensModel){
            #include "../include/auto_generated_lens_includes/load_pt_evaluate.h"
        }

        return std::max(0.0, out_transmittance);
    }

    // solves for the two directions [dx,dy], keeps the two positions [x,y] and the
    // wavelength, such that the path through the lens system will be valid, i.e.
    // lens_evaluate_aperture(in, out) will yield the same out given the solved for in.
    // in: point on sensor. out: point on aperture.
    inline void lens_pt_sample_aperture(Eigen::VectorXd &in, Eigen::VectorXd &out, double dist)
    {
        double out_x = out[0], out_y = out[1], out_dx = out[2], out_dy = out[3], out_transmittance = 1.0f;
        double x = in[0], y = in[1], dx = in[2], dy = in[3], lambda = in[4];

        switch (lensModel){
            #include "../include/auto_generated_lens_includes/load_pt_sample_aperture.h"
        }

        // directions may have changed, copy all to be sure.
        out[0] = out_x; // dont think this is needed
        out[1] = out_y; // dont think this is needed
        out[2] = out_dx;
        out[3] = out_dy;

        in[0] = x; // dont think this is needed
        in[1] = y; // dont think this is needed
        in[2] = dx;
        in[3] = dy;
    }
    

    // solves for a sensor position given a scene point and an aperture point
    // returns transmittance from sensor to outer pupil
    inline double lens_lt_sample_aperture(
        const Eigen::Vector3d scene,    // 3d point in scene in camera space
        const Eigen::Vector2d ap,       // 2d point on aperture (in camera space, z is known)
        Eigen::VectorXd &sensor,        // output point and direction on sensor plane/plane
        Eigen::VectorXd &out,           // output point and direction on outer pupil
        const double lambda)            // wavelength   
    {
        const double scene_x = scene[0], scene_y = scene[1], scene_z = scene[2];
        const double ap_x = ap[0], ap_y = ap[1];
        double x = 0, y = 0, dx = 0, dy = 0;

        switch (lensModel){
            #include "../include/auto_generated_lens_includes/load_lt_sample_aperture.h"    
        }

        sensor[0] = x; sensor[1] = y; sensor[2] = dx; sensor[3] = dy; sensor[4] = lambda;
        return std::max(0.0, out[4]);
    }


    inline bool trace_ray_focus_check(double sensor_shift, double &test_focus_distance)
    {
        Eigen::VectorXd sensor(5); sensor.setZero();
        Eigen::VectorXd aperture(5); aperture.setZero();
        Eigen::VectorXd out(5); out.setZero();
        sensor(4) = lambda;
        aperture(1) = lens_aperture_housing_radius * 0.25;

        lens_pt_sample_aperture(sensor, aperture, sensor_shift);

        // move to beginning of polynomial
        sensor(0) += sensor(2) * sensor_shift;
        sensor(1) += sensor(3) * sensor_shift;

            // propagate ray from sensor to outer lens element
        double transmittance = lens_evaluate(sensor, out);
        if(transmittance <= 0.0) return false;

        // crop out by outgoing pupil
        if( out(0)*out(0) + out(1)*out(1) > lens_outer_pupil_radius*lens_outer_pupil_radius){
            return false;
        }

        // crop at inward facing pupil
        const double px = sensor(0) + sensor(2) * lens_back_focal_length;
        const double py = sensor(1) + sensor(3) * lens_back_focal_length;
        if (px*px + py*py > lens_inner_pupil_radius*lens_inner_pupil_radius){
            return false;
        }

            // convert from sphere/sphere space to camera space
        Eigen::Vector2d outpos(out(0), out(1));
        Eigen::Vector2d outdir(out(2), out(3));
        Eigen::Vector3d camera_space_pos(0,0,0);
        Eigen::Vector3d camera_space_omega(0,0,0);
        if (lens_outer_pupil_geometry == "cyl-y") cylinderToCs(outpos, outdir, camera_space_pos, camera_space_omega, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius, true);
            else if (lens_outer_pupil_geometry == "cyl-x") cylinderToCs(outpos, outdir, camera_space_pos, camera_space_omega, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius, false);
        else sphereToCs(outpos, outdir, camera_space_pos, camera_space_omega, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius);

        test_focus_distance = line_plane_intersection(camera_space_pos, camera_space_omega)(2);
        return true;
    }



    inline double camera_get_y0_intersection_distance(double sensor_shift, double intersection_distance)
    {
        Eigen::VectorXd sensor(5); sensor.setZero();
        Eigen::VectorXd aperture(5); aperture.setZero();
        Eigen::VectorXd out(5); out.setZero();
        sensor(4) = lambda;
        aperture(1) = lens_aperture_housing_radius * 0.25;

        lens_pt_sample_aperture(sensor, aperture, sensor_shift);

        sensor(0) += sensor(2) * sensor_shift;
            sensor(1) += sensor(3) * sensor_shift;

            double transmittance = lens_evaluate(sensor, out);

            // convert from sphere/sphere space to camera space
        Eigen::Vector2d outpos(out(0), out(1));
        Eigen::Vector2d outdir(out(2), out(3));
            Eigen::Vector3d camera_space_pos(0,0,0);
            Eigen::Vector3d camera_space_omega(0,0,0);
        if (lens_outer_pupil_geometry == "cyl-y") cylinderToCs(outpos, outdir, camera_space_pos, camera_space_omega, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius, true);
            else if (lens_outer_pupil_geometry == "cyl-x") cylinderToCs(outpos, outdir, camera_space_pos, camera_space_omega, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius, false);
        else sphereToCs(outpos, outdir, camera_space_pos, camera_space_omega, -lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius);
        
        return line_plane_intersection(camera_space_pos, camera_space_omega)(2);
    }


    // note that this is all with an unshifted sensor
    inline void trace_backwards_for_fstop(const double fstop_target, double &calculated_fstop, double &calculated_aperture_radius) {
        const int maxrays = 1000;
        double best_valid_fstop = 0.0;
        double best_valid_aperture_radius = 0.0;

        for (int i = 1; i < maxrays; i++)
        {
            const double parallel_ray_height = (static_cast<double>(i)/static_cast<double>(maxrays)) * lens_outer_pupil_radius;
            const Eigen::Vector3d target(0, parallel_ray_height, AI_BIG);
            Eigen::VectorXd sensor(5); sensor << 0,0,0,0, lambda;
            Eigen::VectorXd out(5); out.setZero();

            // just point through center of aperture
            Eigen::Vector2d aperture(0.01, parallel_ray_height);

            // if (!lens_lt_sample_aperture(target, aperture, sensor, out, lambda, camera)) continue;
            if(lens_lt_sample_aperture(target, aperture, sensor, out, lambda) <= 0.0) continue;

            // crop at inner pupil
            const double px = sensor(0) + (sensor(2) * lens_back_focal_length);
            const double py = sensor(1) + (sensor(3) * lens_back_focal_length);
            if (px*px + py*py > lens_inner_pupil_radius*lens_inner_pupil_radius) continue;

            // somehow need to get last vertex positiondata.. don't think what i currently have is correct
            Eigen::Vector3d out_cs_pos(0,0,0);
            Eigen::Vector3d out_cs_dir(0,0,0);
            Eigen::Vector2d outpos(out(0), out(1));
            Eigen::Vector2d outdir(out(2), out(3)); 
            if (lens_inner_pupil_geometry == "cyl-y") {
                cylinderToCs(outpos, outdir, out_cs_pos, out_cs_dir, - lens_inner_pupil_curvature_radius + lens_back_focal_length, lens_inner_pupil_curvature_radius, true);
            }
            else if (lens_inner_pupil_geometry == "cyl-x") {
                cylinderToCs(outpos, outdir, out_cs_pos, out_cs_dir, - lens_inner_pupil_curvature_radius + lens_back_focal_length, lens_inner_pupil_curvature_radius, false);
            }
            else sphereToCs(outpos, outdir, out_cs_pos, out_cs_dir, - lens_inner_pupil_curvature_radius + lens_back_focal_length, lens_inner_pupil_curvature_radius);

            const double theta = std::atan(out_cs_pos(1) / out_cs_pos(2));
            const double fstop = 1.0 / (std::sin(theta)* 2.0);

            if (fstop < fstop_target) {
                calculated_fstop = best_valid_fstop;
                calculated_aperture_radius = best_valid_aperture_radius;
                return;
            } else {
                best_valid_fstop = fstop;
                best_valid_aperture_radius = parallel_ray_height;
            }
        }

        calculated_fstop = best_valid_fstop;
        calculated_aperture_radius = best_valid_aperture_radius;
    }


    // focal_distance is in mm
    inline double logarithmic_focus_search(const double focal_distance){
        double closest_distance = 999999999.0;
        double best_sensor_shift = 0.0;
        for (double sensorshift : logarithmic_values()){
            double intersection_distance = 0.0;
            intersection_distance = camera_get_y0_intersection_distance(sensorshift, intersection_distance);
            double new_distance = focal_distance - intersection_distance;

            if (new_distance < closest_distance && new_distance > 0.0){
                closest_distance = new_distance;
                best_sensor_shift = sensorshift;
            }
        }

        return best_sensor_shift;
    }



    // returns sensor offset in mm
    // traces rays backwards through the lens
    inline double camera_set_focus(double dist)
    {
        const Eigen::Vector3d target(0, 0, dist);
        Eigen::VectorXd sensor(5); sensor.setZero();
        Eigen::VectorXd out(5); out.setZero();
        sensor(4) = lambda;
        double offset = 0.0;
        int count = 0;
        const double scale_samples = 0.1;
        Eigen::Vector2d aperture(0,0);

        const int S = 4;

        // trace a couple of adjoint rays from there to the sensor and
        // see where we need to put the sensor plane.
        for(int s=1; s<=S; s++){
            for(int k=0; k<2; k++){
            
                // reset aperture
                aperture.setZero();

                aperture[k] = lens_aperture_housing_radius * (s/(S+1.0) * scale_samples); // (1to4)/(4+1) = (.2, .4, .6, .8) * scale_samples

                lens_lt_sample_aperture(target, aperture, sensor, out, lambda);

                if(sensor(2+k) > 0){
                    offset += sensor(k)/sensor(2+k);
                    printf("\t[LENTIL] raytraced sensor shift at aperture[%f, %f]: %f", aperture(0), aperture(1), sensor(k)/sensor(2+k));
                    count ++;
                }
            }
        }

        // average guesses
        offset /= count; 
        
        // the focus plane/sensor offset:
        // negative because of reverse direction
        if(offset == offset){ // check NaN cases
            const double limit = 45.0;
            if(offset > limit){
                printf("[LENTIL] sensor offset bigger than maxlimit: %f > %f", offset, limit);
                return limit;
            } else if(offset < -limit){
                printf("[LENTIL] sensor offset smaller than minlimit: %f < %f", offset, -limit);
                return -limit;
            } else {
                return offset; // in mm
            }
        } else {
            return 0.0;
        }

    }



    // returns sensor offset in mm
    inline double camera_set_focus_infinity()
    {
        double parallel_ray_height = lens_aperture_housing_radius * 0.1;
        const Eigen::Vector3d target(0.0, parallel_ray_height, AI_BIG);
        Eigen::VectorXd sensor(5); sensor.setZero();
        Eigen::VectorXd out(5); out.setZero();
        sensor[4] = lambda;
        double offset = 0.0;
        int count = 0;

        // just point through center of aperture
        Eigen::Vector2d aperture(0, parallel_ray_height);

        const int S = 4;

        // trace a couple of adjoint rays from there to the sensor and
        // see where we need to put the sensor plane.
        for(int s=1; s<=S; s++){
            for(int k=0; k<2; k++){
            
            // reset aperture
            aperture(0) = 0.0f;
            aperture(1) = parallel_ray_height;

            lens_lt_sample_aperture(target, aperture, sensor, out, lambda);

            if(sensor(2+k) > 0){
                offset += sensor(k)/sensor(2+k);
                count ++;
            }
            }
        }

        offset /= count; 
        
        // check NaN cases
        if(offset == offset){
            return offset;
        } else {return 0.0;}
    }





    void camera_model_specific_setup () {

        switch (cameraType){
            case PolynomialOptics:
            {
                focus_distance *= 10.0;
                
                switch (lensModel){
                    #include "../include/auto_generated_lens_includes/load_lens_constants.h"
                }

                AiMsgInfo("[LENTIL CAMERA PO] ----------  LENS CONSTANTS  -----------");
                AiMsgInfo("[LENTIL CAMERA PO] Lens Name: %s", lens_name);
                AiMsgInfo("[LENTIL CAMERA PO] Lens F-Stop: %f", lens_fstop);
                #ifdef DEBUG_LOG
                AiMsgInfo("[LENTIL CAMERA PO] lens_outer_pupil_radius: %f", lens_outer_pupil_radius);
                AiMsgInfo("[LENTIL CAMERA PO] lens_inner_pupil_radius: %f", lens_inner_pupil_radius);
                AiMsgInfo("[LENTIL CAMERA PO] lens_length: %f", lens_length);
                AiMsgInfo("[LENTIL CAMERA PO] lens_back_focal_length: %f", lens_back_focal_length);
                AiMsgInfo("[LENTIL CAMERA PO] lens_effective_focal_length: %f", lens_effective_focal_length);
                AiMsgInfo("[LENTIL CAMERA PO] lens_aperture_pos: %f", lens_aperture_pos);
                AiMsgInfo("[LENTIL CAMERA PO] lens_aperture_housing_radius: %f", lens_aperture_housing_radius);
                AiMsgInfo("[LENTIL CAMERA PO] lens_inner_pupil_curvature_radius: %f", lens_inner_pupil_curvature_radius);
                AiMsgInfo("[LENTIL CAMERA PO] lens_outer_pupil_curvature_radius: %f", lens_outer_pupil_curvature_radius);
                AiMsgInfo("[LENTIL CAMERA PO] lens_inner_pupil_geometry: %s", lens_inner_pupil_geometry.c_str());
                AiMsgInfo("[LENTIL CAMERA PO] lens_outer_pupil_geometry: %s", lens_outer_pupil_geometry.c_str());
                AiMsgInfo("[LENTIL CAMERA PO] lens_field_of_view: %f", lens_field_of_view);
                AiMsgInfo("[LENTIL CAMERA PO] lens_aperture_radius_at_fstop: %f", lens_aperture_radius_at_fstop);
                #endif
                AiMsgInfo("[LENTIL CAMERA PO] --------------------------------------");


                
                AiMsgInfo("[LENTIL CAMERA PO] wavelength: %f nm", lambda);


                if (input_fstop == 0.0) {
                    aperture_radius = lens_aperture_radius_at_fstop;
                } else {
                    double calculated_fstop = 0.0;
                    double calculated_aperture_radius = 0.0;
                    trace_backwards_for_fstop(input_fstop, calculated_fstop, calculated_aperture_radius);
                    
                    AiMsgInfo("[LENTIL CAMERA PO] calculated fstop: %f", calculated_fstop);
                    AiMsgInfo("[LENTIL CAMERA PO] calculated aperture radius: %f mm", calculated_aperture_radius);
                    
                    aperture_radius = std::min(lens_aperture_radius_at_fstop, calculated_aperture_radius);
                }

                AiMsgInfo("[LENTIL CAMERA PO] lens wide open f-stop: %f", lens_fstop);
                AiMsgInfo("[LENTIL CAMERA PO] lens wide open aperture radius: %f mm", lens_aperture_radius_at_fstop);
                AiMsgInfo("[LENTIL CAMERA PO] fstop-calculated aperture radius: %f mm", aperture_radius);
                AiMsgInfo("[LENTIL CAMERA PO] --------------------------------------");


                AiMsgInfo("[LENTIL CAMERA PO] user supplied focus distance: %f mm", focus_distance);

                /*
                AiMsgInfo("[LENTIL CAMERA PO] calculating sensor shift at focus distance:");
                sensor_shift = camera_set_focus(focus_distance, po);
                AiMsgInfo("[LENTIL CAMERA PO] sensor_shift to focus at %f: %f", focus_distance, sensor_shift);
                */

                // logartihmic focus search
                double best_sensor_shift = logarithmic_focus_search(focus_distance);
                AiMsgInfo("[LENTIL CAMERA PO] sensor_shift using logarithmic search: %f mm", best_sensor_shift);
                sensor_shift = best_sensor_shift + extra_sensor_shift;

                /*
                // average guesses infinity focus search
                double infinity_focus_sensor_shift = camera_set_focus(AI_BIG, po);
                AiMsgInfo("[LENTIL CAMERA PO] sensor_shift [average guesses backwards light tracing] to focus at infinity: %f", infinity_focus_sensor_shift);
                */

                // logarithmic infinity focus search
                double best_sensor_shift_infinity = logarithmic_focus_search(999999999.0);
                AiMsgInfo("[LENTIL CAMERA PO] sensor_shift [logarithmic forward tracing] to focus at infinity: %f mm", best_sensor_shift_infinity);
                    
                // bidirectional parallel infinity focus search
                double infinity_focus_parallel_light_tracing = camera_set_focus_infinity();
                AiMsgInfo("[LENTIL CAMERA PO] sensor_shift [parallel backwards light tracing] to focus at infinity: %f mm", infinity_focus_parallel_light_tracing);

                // double check where y=0 intersection point is, should be the same as focus distance
                double test_focus_distance = 0.0;
                bool focus_test = trace_ray_focus_check(sensor_shift, test_focus_distance);
                AiMsgInfo("[LENTIL CAMERA PO] focus test ray: %f mm", test_focus_distance);
                if(!focus_test){
                    AiMsgWarning("[LENTIL CAMERA PO] focus check failed. Either the lens system is not correct, or the sensor is placed at a wrong distance.");
                }

                tan_fov = std::tan(lens_field_of_view / 2.0);

                AiMsgInfo("[LENTIL CAMERA PO] --------------------------------------");

            } break;
            case ThinLens:
            {
                fov = 2.0 * std::atan(sensor_width / (2.0*focal_length));
                tan_fov = std::tan(fov/2.0);
                aperture_radius = (focal_length / (2.0 * input_fstop)) / 10.0;
            } break;
        }
    }

    

    
    // bool bokehChanged(const Camera &rhs){
    //     return (useImage != rhs.useImage ||
    //             (useImage && bokehPath != rhs.bokehPath));
    // }


    // AtNode* get_lentil_imager(AtUniverse *uni) {
    //     AtNode* options = AiUniverseGetOptions(uni);
    //     AtArray* outputs = AiNodeGetArray(options, "outputs");
    //     std::string output_string = AiArrayGetStr(outputs, 0).c_str(); // only considering first output string, should be the same for all of them
    //     std::string driver = split_str(output_string, std::string(" ")).back();
    //     AtString driver_as = AtString(driver.c_str());
    //     AtNode *driver_node = AiNodeLookUpByName(uni, driver_as);
    //     AtNode *imager_node = (AtNode*)AiNodeGetPtr(driver_node, "input");
        
        
    //     if (imager_node == nullptr){
    //         AiMsgError("[LENTIL FILTER] Couldn't find imager input. Is your imager connected?");
    //         return nullptr;
    //     }
        
    //     for (int i=0; i<16; i++){ // test, only considering depth of 16 for now, ideally should be arbitrary
    //         const AtNodeEntry* imager_ne = AiNodeGetNodeEntry(imager_node);
    //         if ( AiNodeEntryGetNameAtString(imager_ne) == AtString("imager_lentil")) {
    //             return imager_node;
    //         } else {
    //             imager_node = (AtNode*)AiNodeGetPtr(imager_node, "input");
    //         }
    //     }

    //     AiMsgError("[LENTIL FILTER] Couldn't find lentil_imager in the imager chain. Is your imager connected?");
    //     AiRenderAbort();
    //     return nullptr;
    // }




    
    bool get_bidirectional_status(AtUniverse *universe) {

        // // disable for non-lentil cameras
        // if (!AiNodeIs(camera_node, AtString("lentil_camera"))) {
        //     AiMsgError("[LENTIL FILTER] Camera is not of type lentil. A full scene update is required.");
        //     AiRenderAbort();
        //     return false;
        // }

        // if progressive rendering is on, don't redistribute
        if (AiNodeGetBool(AiUniverseGetOptions(universe), "enable_progressive_render")) {
            AiMsgError("[LENTIL BIDIRECTIONAL] Progressive rendering is not supported.");
            AiRenderAbort();
            return false;
        }

        if (!enable_dof) {
            AiMsgWarning("[LENTIL BIDIRECTIONAL] Depth of field is disabled, therefore disabling bidirectional sampling.");
            return false;
        }

        if (bidir_sample_mult == 0){
            AiMsgWarning("[LENTIL BIDIRECTIONAL] Bidirectional samples are set to 0, filter will not execute.");
            return false;
        }

        // should include an AA sample level test, if not final sample level, skip!

        return true;
    }

    void setup_filter(AtUniverse *universe) {

        // xres_without_region = AiNodeGetInt(AiUniverseGetOptions(universe), "xres");
        // yres_without_region = AiNodeGetInt(AiUniverseGetOptions(universe), "yres");
        // region_min_x = AiNodeGetInt(AiUniverseGetOptions(universe), "region_min_x");
        // region_min_y = AiNodeGetInt(AiUniverseGetOptions(universe), "region_min_y");
        // region_max_x = AiNodeGetInt(AiUniverseGetOptions(universe), "region_max_x");
        // region_max_y = AiNodeGetInt(AiUniverseGetOptions(universe), "region_max_y");

        // need to check if the render region option is used, if not, set it to default
        // if (region_min_x == INT32_MIN || region_min_x == INT32_MAX ||
        //     region_max_x == INT32_MIN || region_max_x == INT32_MAX ||
        //     region_min_y == INT32_MIN || region_min_y == INT32_MAX ||
        //     region_max_y == INT32_MIN || region_max_y == INT32_MAX ) {
        //       region_min_x = 0;
        //       region_min_y = 0;
        //       region_max_x = xres_without_region;
        //       region_max_y = yres_without_region;
        // }

        // xres = region_max_x - region_min_x;
        // yres = region_max_y - region_min_y;
        xres = AiNodeGetInt(AiUniverseGetOptions(universe), "xres");
        yres = AiNodeGetInt(AiUniverseGetOptions(universe), "yres");


        filter_width = 2.0;
        time_start = AiCameraGetShutterStart();
        time_end = AiCameraGetShutterEnd();
        imager_print_once_only = false;
        current_inv_density = 0.0;


        zbuffer.resize(xres * yres);


        // creates buffers for each AOV with lentil_filter (lentil_replaced_filter)
        std::string driver_first_aov;
        AtNode* options = AiUniverseGetOptions(universe);
        AtArray* outputs = AiNodeGetArray(options, "outputs");
        for (size_t i=0; i<AiArrayGetNumElements(outputs); ++i) {
            std::string output_string = AiArrayGetStr(outputs, i).c_str();
            std::string lentil_str = "lentil_replaced_filter";
            auto [filter_index, output_string_split] = find_filter_index_in_aov_string(output_string, universe);

            if (output_string_split[filter_index] == lentil_str){
            std::string name = output_string_split[filter_index-2];
            std::string type = output_string_split[filter_index-1];
            std::string driver = output_string_split[filter_index+1];

            if (i == 0) driver_first_aov = driver;

            AtString name_as = AtString(name.c_str());

            aov_list_name.push_back(name_as);
            aov_list_type.push_back(string_to_arnold_type(type));

            ++aov_duplicates[name_as];

            aov_buffers[name_as].clear();
            aov_buffers[name_as].resize(xres * yres);
            
            aov_crypto.push_back(false);

            AiMsgInfo("[LENTIL IMAGER] Driver '%s' -- Adding aov %s of type %s", driver.c_str(), name.c_str(), type.c_str());
            }
        }



        // check if a cryptomatte aovshader is present
        bool cryptomatte_auto_detected = false;
        AtArray* aov_shaders_array = AiNodeGetArray(options, "aov_shaders");
        for (size_t i=0; i<AiArrayGetNumElements(aov_shaders_array); ++i) {
            AtNode* aov_node = static_cast<AtNode*>(AiArrayGetPtr(aov_shaders_array, i));
            if (AiNodeEntryGetNameAtString(AiNodeGetNodeEntry(aov_node)) == AtString("cryptomatte")) {
            cryptomatte_auto_detected = true;
            }
        }
        
        if (cryptomatte_auto_detected == false) {
            AiMsgInfo("[LENTIL IMAGER] Could not find a cryptomatte AOV shader, disabling cryptomatte.");
        }


        // crypto does this check to avoid "actually" doing the work unless we're writing an exr to disk
        // this speeds up the IPR sessions.
        bool driver_is_exr = false;
        AtNode *driver_node = AiNodeLookUpByName(universe, driver_first_aov.c_str());
        if (driver_node && AiNodeIs(driver_node, AtString("driver_exr"))){
            driver_is_exr = true;
        }

        // setup ranked crypto aov's
        if (driver_is_exr && cryptomatte_auto_detected) {
            std::vector<std::string> crypto_types{"crypto_asset", "crypto_material", "crypto_object"};
            std::vector<std::string> crypto_ranks{"00", "01", "02"};
            for (const auto& crypto_type: crypto_types) {
                for (const auto& crypto_rank : crypto_ranks) {
                    std::string name_as_s = crypto_type+crypto_rank;
                    AtString name_as = AtString(name_as_s.c_str());

                    aov_list_name.push_back(name_as);
                    aov_list_type.push_back(AI_TYPE_FLOAT);
                    crypto_hash_map[name_as].clear();
                    crypto_hash_map[name_as].resize(xres * yres);
                    crypto_total_weight[name_as].clear();
                    crypto_total_weight[name_as].resize(xres * yres);

                    cryptomatte_aov_names.push_back(name_as);
                    aov_crypto.push_back(true);
                    AiMsgInfo("[LENTIL IMAGER] Adding cryptomatte aov %s of type %s", name_as.c_str(), "AI_TYPE_FLOAT");
                }
            }
        }

        
        
    }


};









