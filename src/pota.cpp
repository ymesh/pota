#include <ai.h>
#include "pota.h"
#include "lens.h"


AI_CAMERA_NODE_EXPORT_METHODS(potaMethods)


enum
{
	p_lensModel,
	p_sensor_width,
	p_wavelength,
	p_dof,
    p_fstop,
    p_focus_distance,
    p_aperture_blades,
    p_backward_samples,
    p_minimum_rgb,
    p_bokeh_exr_path
};


// to switch between lens models in interface dropdown
static const char* LensModelNames[] =
{
    "fisheye",
    "fisheye_aspherical",
    "double_gauss",
    "double_gauss_angenieux",
    "petzval",
    "tessar_anamorphic",
    "wideangle",
    NULL
};


// returns sensor offset in mm
float camera_set_focus(float dist, float aperture_radius, float lambda, MyCameraData *camera_data)
{
    const float target[3] = { 0.0, 0.0, dist};
    float sensor[5] = {0.0f};
    float out[5] = {0.0f};
    sensor[4] = lambda;
    float offset = 0.0f;
    int count = 0;
    float scale_samples = 0.5f;

    // just point through center of aperture
    float aperture[2] = {0.0f, 0.0f};

    const int S = 4;

    // trace a couple of adjoint rays from there to the sensor and
    // see where we need to put the sensor plane.
    for(int s=1; s<=S; s++){
      for(int k=0; k<2; k++){
      	
        // reset aperture
        aperture[0] = 0.0f;
        aperture[1] = 0.0f;

        aperture[k] = aperture_radius * (s/(S+1.0f) * scale_samples); // (1to4)/(4+1) = .2, .4, .6, .8

        lens_lt_sample_aperture(target, aperture, sensor, out, lambda, camera_data);

        if(sensor[2+k] > 0){
            offset += sensor[k]/sensor[2+k];
            AiMsgInfo("\t[POTA] raytraced sensor shift at aperture[%f, %f]: %f", aperture[0], aperture[1], sensor[k]/sensor[2+k]);
            count ++;
        }
      }
    }

    // average guesses
    offset /= count; 
    
    // the focus plane/sensor offset:
    // negative because of reverse direction
    if(offset == offset){ // check NaN cases
		const float limit = 45.0f; // why this hard limit? Where does it come from?
		if(offset > limit){
			AiMsgInfo("[POTA] sensor offset bigger than maxlimit: %f > %f", offset, limit);
          	return limit;
		} else if(offset < -limit){
			AiMsgInfo("[POTA] sensor offset smaller than minlimit: %f < %f", offset, -limit);
        	return -limit;
		} else {
			AiMsgInfo("[POTA] sensor offset inside of limits: %f", offset);
			return offset; // in mm
		}
    }
}


node_parameters
{
    AiParameterEnum("lensModel", petzval, LensModelNames);
    AiParameterFlt("sensor_width", 36.0); // 35mm film
    AiParameterFlt("wavelength", 550.0); // wavelength in nm
    AiParameterBool("dof", true);
    AiParameterFlt("fstop", 0.0);
    AiParameterFlt("focus_distance", 1500.0); // in mm
    AiParameterInt("aperture_blades", 0);
    AiParameterInt("backward_samples", 3);
    AiParameterFlt("minimum_rgb", 3.0f);
    AiParameterStr("bokeh_exr_path", "/Users/zeno/pota/tests/image/pota_bokeh.exr");
}


node_initialize
{
	AiCameraInitialize(node);
	AiNodeSetLocalData(node, new MyCameraData());
}


node_update
{	
	MyCameraData* camera_data = (MyCameraData*)AiNodeGetLocalData(node);

	camera_data->sensor_width = AiNodeGetFlt(node, "sensor_width");
	camera_data->fstop = AiNodeGetFlt(node, "fstop");
	camera_data->focus_distance = AiNodeGetFlt(node, "focus_distance");
	camera_data->lensModel = (LensModel) AiNodeGetInt(node, "lensModel");
	camera_data->aperture_blades = AiNodeGetInt(node, "aperture_blades");
	camera_data->dof = AiNodeGetBool(node, "dof");
	camera_data->backward_samples = AiNodeGetInt(node, "backward_samples");
	camera_data->minimum_rgb = AiNodeGetFlt(node, "minimum_rgb");
	camera_data->bokeh_exr_path = AiNodeGetStr(node, "bokeh_exr_path");

	load_lens_constants(camera_data);

	camera_data->lambda = AiNodeGetFlt(node, "wavelength") * 0.001;
	AiMsgInfo("[POTA] wavelength: %f", camera_data->lambda);

	camera_data->max_fstop = camera_data->lens_focal_length / (camera_data->lens_aperture_housing_radius * 2.0f);
	AiMsgInfo("[POTA] lens wide open f-stop: %f", camera_data->max_fstop);

	if (camera_data->fstop == 0.0f) camera_data->aperture_radius = camera_data->lens_aperture_housing_radius;
	else camera_data->aperture_radius = fminf(camera_data->lens_aperture_housing_radius, camera_data->lens_focal_length / (2.0f * camera_data->fstop));

	AiMsgInfo("[POTA] full aperture radius: %f", camera_data->lens_aperture_housing_radius);
	AiMsgInfo("[POTA] fstop-calculated aperture radius: %f", camera_data->aperture_radius);
	AiMsgInfo("[POTA] --------------------------------------");

	// focus test, calculate sensor shift for correct focusing
    AiMsgInfo("[POTA] calculating sensor shift at infinity focus:");
	float infinity_focus_sensor_shift = camera_set_focus(AI_BIG, camera_data->lens_aperture_housing_radius, camera_data->lambda, camera_data);

    AiMsgInfo("[POTA] calculating sensor shift at focus distance:");
	camera_data->sensor_shift = camera_set_focus(camera_data->focus_distance, camera_data->lens_aperture_housing_radius, camera_data->lambda, camera_data);
	AiMsgInfo("[POTA] sensor_shift to focus at infinity: %f", infinity_focus_sensor_shift);
	AiMsgInfo("[POTA] sensor_shift to focus at %f: %f", camera_data->focus_distance, camera_data->sensor_shift);


	AiCameraUpdate(node, false);
}


node_finish
{

	MyCameraData* camera_data = (MyCameraData*)AiNodeGetLocalData(node);
	delete camera_data;
}


camera_create_ray
{
	MyCameraData* camera_data = (MyCameraData*)AiNodeGetLocalData(node);

    float sensor[5] = {0.0f};
    float aperture[5] = {0.0f};
    float out[5] = {0.0f};
    sensor[4] = camera_data->lambda;

    // set sensor position coords
    sensor[0] = input.sx * (camera_data->sensor_width * 0.5f);
    sensor[1] = input.sy * (camera_data->sensor_width * 0.5f);

    AtVector2 sensor_position_original(sensor[0], sensor[1]);
    bool ray_succes = false;
    int tries = 0;
    int max_tries = 15;

    while(ray_succes == false && tries <= max_tries){

    	//reset the initial sensor coords
    	sensor[0] = sensor_position_original.x; 
    	sensor[1] = sensor_position_original.y; 
    	sensor[2] = 0.0f;
    	sensor[3] = 0.0f; 
    	sensor[4] = camera_data->lambda;
	    aperture[0] = 0.0f; aperture[1] = 0.0f; aperture[2] = 0.0f; aperture[3] = 0.0f; aperture[4] = 0.0f;
	    out[0] = 0.0f; out[1] = 0.0f; out[2] = 0.0f; out[3] = 0.0f; out[4] = 0.0f;
	    
	    if (!camera_data->dof) // no dof, all rays through single aperture point
	    { 
	    	aperture[0] = 0.0;
	    	aperture[1] = 0.0;

	    } 
	    else if (camera_data->dof && camera_data->aperture_blades < 2)
	    {
			// transform unit square to unit disk
		    AtVector2 unit_disk(0.0f, 0.0f);
		    if (tries == 0) concentric_disk_sample(input.lensx, input.lensy, unit_disk, false);
		    else concentric_disk_sample(xor128() / 4294967296.0f, xor128() / 4294967296.0f, unit_disk, true);

		    aperture[0] = unit_disk.x * camera_data->aperture_radius;
		    aperture[1] = unit_disk.y * camera_data->aperture_radius;
	    } 
	    else if (camera_data->dof && camera_data->aperture_blades > 2)
	    {
	    	if (tries == 0) lens_sample_aperture(&aperture[0], &aperture[1], input.lensx, input.lensy, camera_data->aperture_radius, camera_data->aperture_blades);
	    	else lens_sample_aperture(&aperture[0], &aperture[1], xor128() / 4294967296.0f, xor128() / 4294967296.0f, camera_data->aperture_radius, camera_data->aperture_blades);
	    }


	    if (camera_data->dof)
	    {
	    	// aperture sampling, to make sure ray is able to propagate through whole lens system
	    	lens_pt_sample_aperture(sensor, aperture, camera_data->sensor_shift, camera_data);
	    }
	    

	    // move to beginning of polynomial
		sensor[0] += sensor[2] * camera_data->sensor_shift;
		sensor[1] += sensor[3] * camera_data->sensor_shift;


		// propagate ray from sensor to outer lens element
	    float transmittance = lens_evaluate(sensor, out, camera_data);
		if(transmittance <= 0.0f){
			++tries;
			continue;
		}

		// crop out by outgoing pupil
		if( out[0]*out[0] + out[1]*out[1] > camera_data->lens_outer_pupil_radius*camera_data->lens_outer_pupil_radius){
			++tries;
			continue;
		}

		// crop at inward facing pupil
		const float px = sensor[0] + sensor[2] * camera_data->lens_focal_length;
		const float py = sensor[1] + sensor[3] * camera_data->lens_focal_length; //(note that lens_focal_length is the back focal length, i.e. the distance unshifted sensor -> pupil)
		if (px*px + py*py > camera_data->lens_inner_pupil_radius*camera_data->lens_inner_pupil_radius){
			++tries;
			continue;
		}	
		
		ray_succes = true;
	}

	if (ray_succes == false) output.weight = 0.0f;

	// convert from sphere/sphere space to camera space
	float camera_space_pos[3];
	float camera_space_omega[3];
	lens_sphereToCs(out, out+2, camera_space_pos, camera_space_omega, -camera_data->lens_outer_pupil_curvature_radius, camera_data->lens_outer_pupil_curvature_radius);


    output.origin.x = camera_space_pos[0];
    output.origin.y = camera_space_pos[1];
    output.origin.z = camera_space_pos[2];
    output.dir.x = camera_space_omega[0];
    output.dir.y = camera_space_omega[1];
    output.dir.z = camera_space_omega[2];

	output.origin *= -0.1; //reverse rays and convert to cm
    output.dir *= -0.1; //reverse rays and convert to cm


    // EXPERIMENTAL, I KNOW IT IS INCORRECT BUT AT LEAST THE VISUAL PROBLEM IS RESOLVED
    // HAVE TO DO THIS BECAUSE OF SHOOTING MULTIPLE RAYS
    // NOT CALCULATING THE DERIVATIVES PROBS AFFECTS TEXTURE I/O
    if (tries > 0){
        output.dOdy = output.origin;
        output.dDdy = output.dir; 
    }



	/* NOT NEEDED FOR ARNOLD, GOOD INFO THOUGH FOR OTHER RENDER ENGINES
		// now let's go world space:
		// initialise an ONB/a frame around the first vertex at the camera position along n=camera lookat direction:

		view_cam_init_frame(p, &p->v[0].hit);
		
		for(int k=0;k<3;k++)
		{
			//this is the world space position of the outgoing ray:
		    p->v[0].hit.x[k] +=   camera_space_pos[0] * p->v[0].hit.a[k] 
		                        + camera_space_pos[1] * p->v[0].hit.b[k] 
		                        + camera_space_pos[2] * p->v[0].hit.n[k];

			//this is the world space direction of the outgoing ray:
		    p->e[1].omega[k] =   camera_space_omega[0] * p->v[0].hit.a[k] 
		                       + camera_space_omega[1] * p->v[0].hit.b[k]
		                       + camera_space_omega[2] * p->v[0].hit.n[k];
		}

		// now need to rotate the normal of the frame, in case you need any cosines later in light transport. if not, leave out:
		const float R = camera_data->lens_outer_pupil_curvature_radius;
		// recompute full frame:
		float n[3] = {0.0f};
		for(int k=0;k<3;k++)
		    n[k] +=   p->v[0].hit.a[k] * out[0]/R 
		            + p->v[0].hit.b[k] * out[1]/R 
		            + p->v[0].hit.n[k] * (out[2] + R)/fabsf(R);

		for(int k=0;k<3;k++) p->v[0].hit.n[k] = n[k];

		// also clip to valid pixel range.
		if(p->sensor.pixel_i < 0.0f || p->sensor.pixel_i >= view_width() ||
			p->sensor.pixel_j < 0.0f || p->sensor.pixel_j >= view_height())
			return 0.0f;
	*/
} 


camera_reverse_ray
{
	// const MyCameraData* data = (MyCameraData*)AiNodeGetLocalData(node);
	return false;
}

node_loader
{
	if (i != 0) return false;
	node->methods = potaMethods;
	node->output_type = AI_TYPE_UNDEFINED;
	node->name = "pota";
	node->node_type = AI_NODE_CAMERA;
	strcpy(node->version, AI_VERSION);
	return true;
}