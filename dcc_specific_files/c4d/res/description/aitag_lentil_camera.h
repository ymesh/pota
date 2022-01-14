#ifndef _ainode_lentil_camera_h_
#define _ainode_lentil_camera_h_

enum
{
   C4DAI_LENTIL_CAMERA_MAIN_GRP                       = 2001,
   C4DAI_LENTIL_CAMERA_GENERAL_GRP,
   C4DAI_LENTIL_CAMERA_POLYNOMIALOPTICS_GRP,
   C4DAI_LENTIL_CAMERA_THINLENS_GRP,
   C4DAI_LENTIL_CAMERA_BOKEH_IMAGE_GRP,
   C4DAI_LENTIL_CAMERA_BIDIRECTIONAL_GRP,
   C4DAI_LENTIL_CAMERA_ADVANCED_GRP,
   C4DAI_LENTIL_CAMERA_ARNOLDNATIVE_GRP,

   C4DAIP_LENTIL_CAMERA_POSITION                      = 112674648,
   C4DAIP_LENTIL_CAMERA_LOOK_AT                       = 1340373772,
   C4DAIP_LENTIL_CAMERA_UP                            = 563894296,
   C4DAIP_LENTIL_CAMERA_MATRIX                        = 583939640,
   C4DAIP_LENTIL_CAMERA_HANDEDNESS                    = 788599104,
   C4DAIP_LENTIL_CAMERA_NEAR_CLIP                     = 1677446608,
   C4DAIP_LENTIL_CAMERA_FAR_CLIP                      = 1822277661,
   C4DAIP_LENTIL_CAMERA_SCREEN_WINDOW_MIN             = 240966435,
   C4DAIP_LENTIL_CAMERA_SCREEN_WINDOW_MAX             = 240966689,
   C4DAIP_LENTIL_CAMERA_SHUTTER_START                 = 647044895,
   C4DAIP_LENTIL_CAMERA_SHUTTER_END                   = 1089110376,
   C4DAIP_LENTIL_CAMERA_SHUTTER_TYPE                  = 1581455571,
   C4DAIP_LENTIL_CAMERA_SHUTTER_CURVE                 = 628124726,
   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER               = 106227208,
   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER_DURATION      = 958933907,
   C4DAIP_LENTIL_CAMERA_MOTION_START                  = 984683546,
   C4DAIP_LENTIL_CAMERA_MOTION_END                    = 1718644847,
   C4DAIP_LENTIL_CAMERA_EXPOSURE                      = 1910766434,
   C4DAIP_LENTIL_CAMERA_FILTERMAP                     = 989899065,

   C4DAIP_LENTIL_CAMERA_CAMERATYPE                    = 1000531598,
   C4DAIP_LENTIL_CAMERA_UNITS                         = 1013566410,
   C4DAIP_LENTIL_CAMERA_SENSOR_WIDTH                  = 1579967676,
   C4DAIP_LENTIL_CAMERA_ENABLE_DOF                    = 641902050,
   C4DAIP_LENTIL_CAMERA_FSTOP                         = 1031163729,
   C4DAIP_LENTIL_CAMERA_FOCUS_DIST                    = 1036661046,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL                    = 677967269,
   C4DAIP_LENTIL_CAMERA_WAVELENGTH                    = 854814472,
   C4DAIP_LENTIL_CAMERA_EXTRA_SENSOR_SHIFT            = 1602640291,
   C4DAIP_LENTIL_CAMERA_FOCAL_LENGTH_LENTIL           = 353385744,
   C4DAIP_LENTIL_CAMERA_OPTICAL_VIGNETTING_DISTANCE   = 1589399895,
   C4DAIP_LENTIL_CAMERA_OPTICAL_VIGNETTING_RADIUS     = 1967029076,
   C4DAIP_LENTIL_CAMERA_ABB_SPHERICAL                 = 270068030,
   C4DAIP_LENTIL_CAMERA_ABB_DISTORTION                = 602858486,
   C4DAIP_LENTIL_CAMERA_BOKEH_CIRCLE_TO_SQUARE        = 1891183633,
   C4DAIP_LENTIL_CAMERA_BOKEH_ANAMORPHIC              = 915142285,
   C4DAIP_LENTIL_CAMERA_BOKEH_APERTURE_BLADES         = 1694836291,
   C4DAIP_LENTIL_CAMERA_BOKEH_ENABLE_IMAGE            = 154505132,
   C4DAIP_LENTIL_CAMERA_BOKEH_IMAGE_PATH              = 69526054,
   C4DAIP_LENTIL_CAMERA_BIDIR_MIN_LUMINANCE           = 48837163,
   C4DAIP_LENTIL_CAMERA_BIDIR_SAMPLE_MULT             = 1364008881,
   C4DAIP_LENTIL_CAMERA_BIDIR_ADD_LUMINANCE           = 538237104,
   C4DAIP_LENTIL_CAMERA_BIDIR_ADD_LUMINANCE_TRANSITION = 1202707962,
   C4DAIP_LENTIL_CAMERA_VIGNETTING_RETRIES            = 867424095,
   C4DAIP_LENTIL_CAMERA_ABB_COMA                      = 499177319,
   C4DAIP_LENTIL_CAMERA_NAME                          = 99170788,

   C4DAIP_LENTIL_CAMERA_HANDEDNESS__RIGHT             = 0,
   C4DAIP_LENTIL_CAMERA_HANDEDNESS__LEFT              = 1,

   C4DAIP_LENTIL_CAMERA_SHUTTER_TYPE__BOX             = 0,
   C4DAIP_LENTIL_CAMERA_SHUTTER_TYPE__TRIANGLE        = 1,
   C4DAIP_LENTIL_CAMERA_SHUTTER_TYPE__CURVE           = 2,

   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER__OFF          = 0,
   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER__TOP          = 1,
   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER__BOTTOM       = 2,
   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER__LEFT         = 3,
   C4DAIP_LENTIL_CAMERA_ROLLING_SHUTTER__RIGHT        = 4,

   C4DAIP_LENTIL_CAMERA_CAMERATYPE__THINLENS          = 0,
   C4DAIP_LENTIL_CAMERA_CAMERATYPE__POLYNOMIALOPTICS  = 1,

   C4DAIP_LENTIL_CAMERA_UNITS__MM                     = 0,
   C4DAIP_LENTIL_CAMERA_UNITS__CM                     = 1,
   C4DAIP_LENTIL_CAMERA_UNITS__DM                     = 2,
   C4DAIP_LENTIL_CAMERA_UNITS__M                      = 3,

   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ANGENIEUX__DOUBLE_GAUSS__1953__49MM = 0,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ANGENIEUX__DOUBLE_GAUSS__1953__85MM = 1,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ANGENIEUX__DOUBLE_GAUSS__1953__105MM = 2,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ANGENIEUX__DOUBLE_GAUSS__1953__55MM = 3,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1969__45MM = 4,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1969__50MM = 5,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1969__65MM = 6,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1969__75MM = 7,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1969__58MM = 8,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1969__85MM = 9,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1970__28MM = 10,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1970__50MM = 11,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ASAHI__TAKUMAR__1970__35MM = 12,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__CANON__RETROFOCUS_WIDEANGLE__1982__22MM = 13,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__CANON__UNKNOWN__1956__35MM = 14,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__CANON__UNKNOWN__1956__52MM = 15,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__COOKE__SPEED_PANCHRO__1920__40MM = 16,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__COOKE__SPEED_PANCHRO__1920__75MM = 17,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__COOKE__SPEED_PANCHRO__1920__100MM = 18,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__COOKE__SPEED_PANCHRO__1920__50MM = 19,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__KODAK__PETZVAL__1948__150MM = 20,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__KODAK__PETZVAL__1948__105MM = 21,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__KODAK__PETZVAL__1948__85MM = 22,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__KODAK__PETZVAL__1948__65MM = 23,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__KODAK__PETZVAL__1948__75MM = 24,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__KODAK__PETZVAL__1948__58MM = 25,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__MEYER_OPTIK_GOERLITZ__PRIMOPLAN__1936__58MM = 26,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__MEYER_OPTIK_GOERLITZ__PRIMOPLAN__1936__75MM = 27,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__MINOLTA__FISHEYE__1978__16MM = 28,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__MINOLTA__FISHEYE__1978__22MM = 29,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__MINOLTA__FISHEYE__1978__28MM = 30,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__NIKON__RETROFOCUS_WIDEANGLE__1971__28MM = 31,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__NIKON__RETROFOCUS_WIDEANGLE__1971__35MM = 32,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__NIKON__UNKNOWN__2014__65MM = 33,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__NIKON__UNKNOWN__2014__40MM = 34,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__NIKON__UNKNOWN__2014__50MM = 35,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__UNKNOWN__PETZVAL__1900__85MM = 36,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__UNKNOWN__PETZVAL__1900__100MM = 37,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__UNKNOWN__PETZVAL__1900__75MM = 38,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__UNKNOWN__PETZVAL__1900__65MM = 39,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ZEISS__BIOTAR__1927__65MM = 40,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ZEISS__BIOTAR__1927__58MM = 41,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ZEISS__BIOTAR__1927__85MM = 42,
   C4DAIP_LENTIL_CAMERA_LENS_MODEL__ZEISS__BIOTAR__1927__45MM = 43,
};

#endif

