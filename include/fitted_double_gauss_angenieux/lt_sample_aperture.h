//input: scene_[x,y,z] - point in scene, ap_[x,y] - point on aperture
//output: [x,y,dx,dy] point and direction on sensor
#ifndef DEBUG_LOG
#define DEBUG_LOG
#endif
float view[3] =
{
  scene_x,
  scene_y,
  scene_z + lens_outer_pupil_curvature_radius
};
normalise(view);
int error = 0;
if(1 || view[2] >= lens_field_of_view)
{
  const float eps = 1e-8;
  float sqr_err = 1e30, sqr_ap_err = 1e30;
  float prev_sqr_err = 1e32, prev_sqr_ap_err = 1e32;
  for(int k=0;k<100&&(sqr_err>eps||sqr_ap_err>eps)&&error==0;k++)
  {
    prev_sqr_err = sqr_err, prev_sqr_ap_err = sqr_ap_err;
    const float begin_x = x;
    const float begin_y = y;
    const float begin_dx = dx;
    const float begin_dy = dy;
    const float begin_lambda = lambda;
    const float pred_ap[2] = {
       + 0.000133157  + 28.4765 *begin_dx + 3.05366e-05 *begin_y + 0.224951 *begin_x + -15.2543 *begin_dx*lens_ipow(begin_dy, 2) + -14.761 *lens_ipow(begin_dx, 3) + -0.0193266 *begin_y*begin_dx*begin_dy + 0.00177015 *lens_ipow(begin_y, 2)*begin_dx + -0.144064 *begin_x*lens_ipow(begin_dy, 2) + -0.169814 *begin_x*lens_ipow(begin_dx, 2) + 0.000691894 *begin_x*begin_y*begin_dy + -0.000323112 *begin_x*lens_ipow(begin_y, 2) + 0.00197425 *lens_ipow(begin_x, 2)*begin_dx + -0.000442341 *lens_ipow(begin_x, 3) + 0.142358 *begin_x*lens_ipow(begin_lambda, 3) + 5.00587 *begin_dx*lens_ipow(begin_lambda, 4) + 0.0136947 *lens_ipow(begin_y, 2)*begin_dx*lens_ipow(begin_dy, 2) + -0.013911 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 3) + -2.03405e-05 *begin_x*lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2) + -7.21627e-07 *begin_x*lens_ipow(begin_y, 4) + -0.0228744 *lens_ipow(begin_x, 2)*begin_dx*lens_ipow(begin_dy, 2) + -0.000604129 *lens_ipow(begin_x, 2)*begin_y*begin_dx*begin_dy + -1.09384e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2) + 18.3921 *begin_dx*lens_ipow(begin_dy, 6) + 26.916 *lens_ipow(begin_dx, 5)*lens_ipow(begin_dy, 2) + -0.825887 *begin_y*lens_ipow(begin_dx, 5)*begin_dy + 0.626383 *begin_x*lens_ipow(begin_dy, 6) + 9.92971e-05 *begin_x*lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2)*begin_dy + -7.31161e-05 *lens_ipow(begin_x, 3)*begin_y*lens_ipow(begin_dy, 3) + 0.000179574 *lens_ipow(begin_x, 3)*begin_y*lens_ipow(begin_dx, 2)*begin_dy + 2.40165e-08 *lens_ipow(begin_x, 6)*begin_dx + -1.81122e-08 *lens_ipow(begin_x, 5)*lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2) + -3.59711e-12 *lens_ipow(begin_x, 9) + 2.9326e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*lens_ipow(begin_lambda, 5) + 7.15742e-07 *lens_ipow(begin_x, 5)*lens_ipow(begin_lambda, 5) + -24.5286 *begin_dx*lens_ipow(begin_lambda, 10) + 0.416594 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 9) + -0.90552 *begin_x*lens_ipow(begin_lambda, 10) + -9.80561e-11 *lens_ipow(begin_x, 7)*lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 2) + -6.90882e-14 *lens_ipow(begin_x, 7)*lens_ipow(begin_y, 4),
       + -0.000167619  + 28.51 *begin_dy + 0.218098 *begin_y + -15.1993 *lens_ipow(begin_dy, 3) + -14.9868 *lens_ipow(begin_dx, 2)*begin_dy + -0.132441 *begin_y*lens_ipow(begin_dy, 2) + -0.11828 *begin_y*lens_ipow(begin_dx, 2) + 0.0019477 *lens_ipow(begin_y, 2)*begin_dy + -0.000285856 *lens_ipow(begin_y, 3) + -0.0318128 *begin_x*begin_dx*begin_dy + 0.00030524 *begin_x*begin_y*begin_dx + 0.00138375 *lens_ipow(begin_x, 2)*begin_dy + -0.000282321 *lens_ipow(begin_x, 2)*begin_y + 0.138184 *begin_y*lens_ipow(begin_lambda, 3) + 4.95146 *begin_dy*lens_ipow(begin_lambda, 4) + -0.0123286 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*begin_dy + -0.000484739 *lens_ipow(begin_y, 3)*lens_ipow(begin_dy, 2) + -7.28222e-05 *lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2) + -7.69732e-07 *lens_ipow(begin_y, 5) + 0.0277696 *begin_x*begin_y*begin_dx*lens_ipow(begin_dy, 2) + -0.00759787 *lens_ipow(begin_x, 2)*lens_ipow(begin_dy, 3) + 0.010138 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 2)*begin_dy + -0.000136451 *lens_ipow(begin_x, 2)*begin_y*lens_ipow(begin_dy, 2) + -0.00039658 *lens_ipow(begin_x, 2)*begin_y*lens_ipow(begin_dx, 2) + -1.45812e-06 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3) + -7.63511e-07 *lens_ipow(begin_x, 4)*begin_y + 2.29255 *begin_y*lens_ipow(begin_dx, 4)*lens_ipow(begin_dy, 2) + -0.0554697 *begin_x*begin_y*lens_ipow(begin_dx, 5) + -3.57545e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*begin_dx*begin_dy + 34.5878 *lens_ipow(begin_dy, 9) + 473.179 *lens_ipow(begin_dx, 4)*lens_ipow(begin_dy, 5) + 5.80023e-07 *lens_ipow(begin_y, 5)*lens_ipow(begin_lambda, 4) + -8.14549e-08 *lens_ipow(begin_y, 6)*lens_ipow(begin_dx, 2)*begin_dy + 8.97577e-07 *begin_x*lens_ipow(begin_y, 5)*begin_dx*lens_ipow(begin_dy, 2) + 2.90359e-06 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3)*lens_ipow(begin_lambda, 5) + -24.1952 *begin_dy*lens_ipow(begin_lambda, 10) + -0.868843 *begin_y*lens_ipow(begin_lambda, 10) + -9.02247e-12 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 7)*lens_ipow(begin_dx, 2) + 8.33497e-13 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 8)*begin_dy + -4.64228e-14 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 7)
    };
    const float delta_ap[] = {ap_x - pred_ap[0], ap_y - pred_ap[1]};
    sqr_ap_err = delta_ap[0]*delta_ap[0]+delta_ap[1]*delta_ap[1];
    float dx1_domega0[2][2];
    dx1_domega0[0][0] =  + 28.4765  + -15.2543 *lens_ipow(begin_dy, 2) + -44.2829 *lens_ipow(begin_dx, 2) + -0.0193266 *begin_y*begin_dy + 0.00177015 *lens_ipow(begin_y, 2) + -0.339628 *begin_x*begin_dx + 0.00197425 *lens_ipow(begin_x, 2) + 5.00587 *lens_ipow(begin_lambda, 4) + 0.0136947 *lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 2) + -0.041733 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2) + -4.0681e-05 *begin_x*lens_ipow(begin_y, 2)*begin_dx + -0.0228744 *lens_ipow(begin_x, 2)*lens_ipow(begin_dy, 2) + -0.000604129 *lens_ipow(begin_x, 2)*begin_y*begin_dy + 18.3921 *lens_ipow(begin_dy, 6) + 134.58 *lens_ipow(begin_dx, 4)*lens_ipow(begin_dy, 2) + -4.12944 *begin_y*lens_ipow(begin_dx, 4)*begin_dy + 0.000198594 *begin_x*lens_ipow(begin_y, 3)*begin_dx*begin_dy + 0.000359148 *lens_ipow(begin_x, 3)*begin_y*begin_dx*begin_dy + 2.40165e-08 *lens_ipow(begin_x, 6) + -3.62244e-08 *lens_ipow(begin_x, 5)*lens_ipow(begin_y, 2)*begin_dx + -24.5286 *lens_ipow(begin_lambda, 10) + 3.74934 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 8)+0.0f;
    dx1_domega0[0][1] =  + -30.5087 *begin_dx*begin_dy + -0.0193266 *begin_y*begin_dx + -0.288129 *begin_x*begin_dy + 0.000691894 *begin_x*begin_y + 0.0273893 *lens_ipow(begin_y, 2)*begin_dx*begin_dy + -0.0457488 *lens_ipow(begin_x, 2)*begin_dx*begin_dy + -0.000604129 *lens_ipow(begin_x, 2)*begin_y*begin_dx + 110.353 *begin_dx*lens_ipow(begin_dy, 5) + 53.832 *lens_ipow(begin_dx, 5)*begin_dy + -0.825887 *begin_y*lens_ipow(begin_dx, 5) + 3.7583 *begin_x*lens_ipow(begin_dy, 5) + 9.92971e-05 *begin_x*lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2) + -0.000219348 *lens_ipow(begin_x, 3)*begin_y*lens_ipow(begin_dy, 2) + 0.000179574 *lens_ipow(begin_x, 3)*begin_y*lens_ipow(begin_dx, 2) + -1.96112e-10 *lens_ipow(begin_x, 7)*lens_ipow(begin_y, 2)*begin_dy+0.0f;
    dx1_domega0[1][0] =  + -29.9736 *begin_dx*begin_dy + -0.236561 *begin_y*begin_dx + -0.0318128 *begin_x*begin_dy + 0.00030524 *begin_x*begin_y + -0.0246573 *lens_ipow(begin_y, 2)*begin_dx*begin_dy + -0.000145644 *lens_ipow(begin_y, 3)*begin_dx + 0.0277696 *begin_x*begin_y*lens_ipow(begin_dy, 2) + 0.0202759 *lens_ipow(begin_x, 2)*begin_dx*begin_dy + -0.00079316 *lens_ipow(begin_x, 2)*begin_y*begin_dx + 9.17021 *begin_y*lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 2) + -0.277349 *begin_x*begin_y*lens_ipow(begin_dx, 4) + -3.57545e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*begin_dy + 1892.72 *lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 5) + -1.6291e-07 *lens_ipow(begin_y, 6)*begin_dx*begin_dy + 8.97577e-07 *begin_x*lens_ipow(begin_y, 5)*lens_ipow(begin_dy, 2) + -1.80449e-11 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 7)*begin_dx+0.0f;
    dx1_domega0[1][1] =  + 28.51  + -45.5979 *lens_ipow(begin_dy, 2) + -14.9868 *lens_ipow(begin_dx, 2) + -0.264882 *begin_y*begin_dy + 0.0019477 *lens_ipow(begin_y, 2) + -0.0318128 *begin_x*begin_dx + 0.00138375 *lens_ipow(begin_x, 2) + 4.95146 *lens_ipow(begin_lambda, 4) + -0.0123286 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2) + -0.000969477 *lens_ipow(begin_y, 3)*begin_dy + 0.0555393 *begin_x*begin_y*begin_dx*begin_dy + -0.0227936 *lens_ipow(begin_x, 2)*lens_ipow(begin_dy, 2) + 0.010138 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 2) + -0.000272901 *lens_ipow(begin_x, 2)*begin_y*begin_dy + 4.5851 *begin_y*lens_ipow(begin_dx, 4)*begin_dy + -3.57545e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*begin_dx + 311.29 *lens_ipow(begin_dy, 8) + 2365.9 *lens_ipow(begin_dx, 4)*lens_ipow(begin_dy, 4) + -8.14549e-08 *lens_ipow(begin_y, 6)*lens_ipow(begin_dx, 2) + 1.79515e-06 *begin_x*lens_ipow(begin_y, 5)*begin_dx*begin_dy + -24.1952 *lens_ipow(begin_lambda, 10) + 8.33497e-13 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 8)+0.0f;
    float invApJ[2][2];
    const float invdetap = 1.0f/(dx1_domega0[0][0]*dx1_domega0[1][1] - dx1_domega0[0][1]*dx1_domega0[1][0]);
    invApJ[0][0] =  dx1_domega0[1][1]*invdetap;
    invApJ[1][1] =  dx1_domega0[0][0]*invdetap;
    invApJ[0][1] = -dx1_domega0[0][1]*invdetap;
    invApJ[1][0] = -dx1_domega0[1][0]*invdetap;
    for(int i=0;i<2;i++)
    {
      dx += invApJ[0][i]*delta_ap[i];
      dy += invApJ[1][i]*delta_ap[i];
    }
    out[0] =  + 49.7564 *begin_dx + -0.45111 *begin_x + -20.6769 *begin_dx*lens_ipow(begin_dy, 2) + -21.6629 *lens_ipow(begin_dx, 3) + 0.158343 *begin_y*begin_dx*begin_dy + 0.00540493 *lens_ipow(begin_y, 2)*begin_dx + 0.222106 *begin_x*lens_ipow(begin_dy, 2) + 0.325749 *begin_x*lens_ipow(begin_dx, 2) + 0.00588602 *begin_x*begin_y*begin_dy + -0.000925557 *begin_x*lens_ipow(begin_y, 2) + -5.36279e-05 *lens_ipow(begin_x, 2)*begin_dy + 0.00983509 *lens_ipow(begin_x, 2)*begin_dx + -0.00105935 *lens_ipow(begin_x, 3) + 0.327477 *begin_x*lens_ipow(begin_lambda, 3) + 1.70099 *begin_x*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 2) + 0.121221 *begin_x*begin_y*lens_ipow(begin_dx, 2)*begin_dy + 0.0633018 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 3) + -0.000739957 *lens_ipow(begin_x, 2)*begin_y*begin_dx*begin_dy + -2.39731e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2) + 1.18041 *begin_dx*lens_ipow(begin_lambda, 5) + 110.698 *lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 4) + 96.7421 *lens_ipow(begin_dx, 5)*lens_ipow(begin_dy, 2) + 9.06137 *begin_y*lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 3) + 0.000325899 *lens_ipow(begin_y, 4)*begin_dx*lens_ipow(begin_dy, 2) + 4.44504 *begin_x*lens_ipow(begin_dx, 6) + -2.32777e-06 *begin_x*lens_ipow(begin_y, 4)*lens_ipow(begin_dx, 2) + -4.70582e-09 *begin_x*lens_ipow(begin_y, 6) + 0.128425 *lens_ipow(begin_x, 2)*begin_dx*lens_ipow(begin_dy, 4) + -1.07899e-07 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 3)*begin_dy + 135.503 *lens_ipow(begin_dx, 9) + 0.182123 *begin_x*begin_y*lens_ipow(begin_dy, 7) + -1.3638 *begin_x*begin_y*lens_ipow(begin_dx, 6)*begin_dy + 2.81701e-08 *lens_ipow(begin_x, 6)*begin_y*begin_dx*begin_dy + -8.89742e-12 *lens_ipow(begin_x, 9) + 5.31624e-06 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*lens_ipow(begin_lambda, 5) + 2.12111e-06 *lens_ipow(begin_x, 5)*lens_ipow(begin_lambda, 5) + -2.09036 *begin_x*lens_ipow(begin_lambda, 10) + 7.36594e-09 *begin_x*lens_ipow(begin_y, 6)*lens_ipow(begin_lambda, 4) + 0.0427966 *lens_ipow(begin_x, 3)*lens_ipow(begin_dy, 8) + -1.69755e-13 *lens_ipow(begin_x, 7)*lens_ipow(begin_y, 4);
    out[1] =  + -0.000255802  + 49.7076 *begin_dy + -0.450998 *begin_y + -21.7135 *lens_ipow(begin_dy, 3) + -20.4721 *lens_ipow(begin_dx, 2)*begin_dy + 0.302858 *begin_y*lens_ipow(begin_dy, 2) + 0.213691 *begin_y*lens_ipow(begin_dx, 2) + 0.0108702 *lens_ipow(begin_y, 2)*begin_dy + -0.00104189 *lens_ipow(begin_y, 3) + 0.0158971 *begin_x*begin_dx*begin_dy + 0.00801017 *begin_x*begin_y*begin_dx + 0.0057819 *lens_ipow(begin_x, 2)*begin_dy + -0.000902568 *lens_ipow(begin_x, 2)*begin_y + 0.324103 *begin_y*lens_ipow(begin_lambda, 3) + 2.21888 *begin_y*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 2) + 0.069591 *lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 3) + 0.0258352 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*begin_dy + 1.55084 *begin_x*begin_dx*lens_ipow(begin_dy, 3) + 0.908836 *begin_x*lens_ipow(begin_dx, 3)*begin_dy + 0.120407 *begin_x*begin_y*begin_dx*lens_ipow(begin_dy, 2) + -2.19662e-05 *begin_x*lens_ipow(begin_y, 3)*begin_dx + -1.73416e-05 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 2)*begin_dy + -2.89843e-06 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3) + 1.24163 *begin_dy*lens_ipow(begin_lambda, 5) + 107.925 *lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 5) + 6.00745 *begin_y*lens_ipow(begin_dy, 6) + 0.259704 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 3) + 0.000217323 *lens_ipow(begin_x, 4)*lens_ipow(begin_dx, 2)*begin_dy + -2.49484e-06 *lens_ipow(begin_x, 4)*begin_y*lens_ipow(begin_dy, 2) + -4.30423e-09 *lens_ipow(begin_x, 6)*begin_y + -7.24966e-08 *lens_ipow(begin_y, 6)*begin_dy*begin_lambda + -1.60675e-07 *lens_ipow(begin_x, 5)*begin_y*begin_dx*begin_lambda + 180.736 *lens_ipow(begin_dy, 9) + 559.35 *lens_ipow(begin_dx, 6)*lens_ipow(begin_dy, 3) + 0.00652112 *lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 6) + -9.80956e-12 *lens_ipow(begin_y, 9) + 1.55747e-06 *lens_ipow(begin_y, 5)*lens_ipow(begin_lambda, 5) + 7.243e-06 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3)*lens_ipow(begin_lambda, 5) + -2.0189 *begin_y*lens_ipow(begin_lambda, 10) + -1.44756e-13 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 7);
    out[2] =  + -0.606975 *begin_dx + -0.0145462 *begin_x + 0.139927 *begin_dx*lens_ipow(begin_dy, 2) + 0.230118 *lens_ipow(begin_dx, 3) + -2.07784e-05 *lens_ipow(begin_y, 2)*begin_dx + -0.0020595 *begin_x*lens_ipow(begin_dy, 2) + -7.26888e-05 *begin_x*begin_y*begin_dy + 1.41104e-05 *begin_x*lens_ipow(begin_y, 2) + 8.55316e-07 *lens_ipow(begin_x, 2)*begin_dy + -0.000173851 *lens_ipow(begin_x, 2)*begin_dx + 1.48755e-05 *lens_ipow(begin_x, 3) + 0.0083638 *begin_dx*lens_ipow(begin_lambda, 3) + -0.00396336 *begin_x*lens_ipow(begin_lambda, 3) + -0.00373201 *begin_y*begin_dx*lens_ipow(begin_dy, 3) + 0.00050211 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 3) + 9.26117e-06 *lens_ipow(begin_y, 3)*begin_dx*begin_dy + 9.97076e-06 *begin_x*lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 2) + 0.000797341 *lens_ipow(begin_x, 2)*begin_dx*lens_ipow(begin_dy, 2) + 0.0010059 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 3) + 4.51109e-05 *lens_ipow(begin_x, 2)*begin_y*begin_dx*begin_dy + 0.000397735 *lens_ipow(begin_y, 2)*begin_dx*lens_ipow(begin_dy, 2)*begin_lambda + 0.00300323 *begin_x*begin_y*lens_ipow(begin_dx, 4)*begin_dy + 5.05886e-11 *begin_x*lens_ipow(begin_y, 6) + -1.96346e-09 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 3)*begin_dy + 1.1502e-08 *lens_ipow(begin_x, 5)*lens_ipow(begin_dy, 2) + 1.40362e-10 *lens_ipow(begin_x, 5)*lens_ipow(begin_y, 2) + 0.0197079 *begin_x*begin_y*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 5) + -3.53467e-08 *begin_x*lens_ipow(begin_y, 4)*lens_ipow(begin_lambda, 4) + 1.18601e-05 *lens_ipow(begin_x, 3)*begin_y*lens_ipow(begin_dy, 5) + -3.43286e-08 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2)*begin_dy + -1.33799e-09 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 3)*begin_dx*begin_dy + -1.23413e-11 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 4)*begin_dx + -2.34649e-08 *lens_ipow(begin_x, 5)*lens_ipow(begin_lambda, 4) + 6.38443e-07 *lens_ipow(begin_x, 5)*lens_ipow(begin_dx, 4) + -8.8726e-14 *lens_ipow(begin_x, 8)*begin_dx + 1.06211e-13 *lens_ipow(begin_x, 9) + -0.0100528 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 9) + 0.0267101 *begin_x*lens_ipow(begin_lambda, 10) + -2.41145e-10 *lens_ipow(begin_x, 5)*lens_ipow(begin_y, 2)*lens_ipow(begin_lambda, 4) + 1.90932e-15 *lens_ipow(begin_x, 5)*lens_ipow(begin_y, 6);
    out[3] =  + -0.60801 *begin_dy + -0.0145595 *begin_y + 0.245273 *lens_ipow(begin_dy, 3) + 0.34091 *lens_ipow(begin_dx, 2)*begin_dy + -0.00316615 *begin_y*lens_ipow(begin_dx, 2) + -0.000146289 *lens_ipow(begin_y, 2)*begin_dy + 1.46753e-05 *lens_ipow(begin_y, 3) + 0.00366859 *begin_x*begin_dx*begin_dy + 1.2712e-06 *begin_x*begin_y*begin_dy + -0.000104641 *begin_x*begin_y*begin_dx + -7.15017e-05 *lens_ipow(begin_x, 2)*begin_dy + 1.44672e-05 *lens_ipow(begin_x, 2)*begin_y + 0.009071 *begin_dy*lens_ipow(begin_lambda, 3) + -0.00396411 *begin_y*lens_ipow(begin_lambda, 3) + -0.00494903 *begin_y*lens_ipow(begin_dy, 4) + 0.000699537 *lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 3) + 0.000640116 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*begin_dy + 1.61631e-05 *lens_ipow(begin_y, 3)*lens_ipow(begin_dy, 2) + -5.75467e-06 *lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2) + 1.98884e-05 *begin_x*lens_ipow(begin_y, 2)*begin_dx*begin_dy + 0.000390292 *lens_ipow(begin_x, 2)*lens_ipow(begin_dy, 3) + 0.000513268 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 2)*begin_dy + -1.26958 *lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 5) + -0.552503 *lens_ipow(begin_dx, 6)*begin_dy + -5.22359e-05 *lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 2) + 0.000773699 *begin_x*begin_y*lens_ipow(begin_dx, 5) + -4.78816e-07 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*begin_dy + 1.30194e-10 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 5) + -5.98885e-10 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 2)*begin_dy + 1.05778e-10 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 3) + 4.31431e-11 *lens_ipow(begin_x, 6)*begin_y + -0.943972 *lens_ipow(begin_dy, 9) + 1.3409e-13 *lens_ipow(begin_y, 8)*begin_dy + 1.12021e-13 *lens_ipow(begin_y, 9) + 0.0370831 *begin_x*begin_y*lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 4) + 6.01526e-08 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 3)*lens_ipow(begin_lambda, 2) + -2.28646e-08 *lens_ipow(begin_x, 4)*begin_y*lens_ipow(begin_lambda, 4) + -3.25636e-08 *lens_ipow(begin_y, 5)*lens_ipow(begin_lambda, 5) + -7.83459e-08 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3)*lens_ipow(begin_lambda, 5) + 0.0273723 *begin_y*lens_ipow(begin_lambda, 10);
    float pred_out_cs[7] = {0.0f};
    lens_sphereToCs(out, out+2, pred_out_cs, pred_out_cs+3, - lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius);
    float view[3] =
    {
      scene_x - pred_out_cs[0],
      scene_y - pred_out_cs[1],
      scene_z - pred_out_cs[2]
    };
    normalise(view);
    float out_new[5];
    lens_csToSphere(pred_out_cs, view, out_new, out_new+2, - lens_outer_pupil_curvature_radius, lens_outer_pupil_curvature_radius);
    const float delta_out[] = {out_new[2] - out[2], out_new[3] - out[3]};
    sqr_err = delta_out[0]*delta_out[0]+delta_out[1]*delta_out[1];
    float domega2_dx0[2][2];
    domega2_dx0[0][0] =  + -0.0145462  + -0.0020595 *lens_ipow(begin_dy, 2) + -7.26888e-05 *begin_y*begin_dy + 1.41104e-05 *lens_ipow(begin_y, 2) + 1.71063e-06 *begin_x*begin_dy + -0.000347702 *begin_x*begin_dx + 4.46265e-05 *lens_ipow(begin_x, 2) + -0.00396336 *lens_ipow(begin_lambda, 3) + 9.97076e-06 *lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 2) + 0.00159468 *begin_x*begin_dx*lens_ipow(begin_dy, 2) + 0.0020118 *begin_x*lens_ipow(begin_dx, 3) + 9.02219e-05 *begin_x*begin_y*begin_dx*begin_dy + 0.00300323 *begin_y*lens_ipow(begin_dx, 4)*begin_dy + 5.05886e-11 *lens_ipow(begin_y, 6) + -5.89038e-09 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3)*begin_dy + 5.751e-08 *lens_ipow(begin_x, 4)*lens_ipow(begin_dy, 2) + 7.01811e-10 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 2) + 0.0197079 *begin_y*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 5) + -3.53467e-08 *lens_ipow(begin_y, 4)*lens_ipow(begin_lambda, 4) + 3.55804e-05 *lens_ipow(begin_x, 2)*begin_y*lens_ipow(begin_dy, 5) + -1.02986e-07 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3)*lens_ipow(begin_dx, 2)*begin_dy + -5.35194e-09 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 3)*begin_dx*begin_dy + -4.93652e-11 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 4)*begin_dx + -1.17325e-07 *lens_ipow(begin_x, 4)*lens_ipow(begin_lambda, 4) + 3.19222e-06 *lens_ipow(begin_x, 4)*lens_ipow(begin_dx, 4) + -7.09808e-13 *lens_ipow(begin_x, 7)*begin_dx + 9.55899e-13 *lens_ipow(begin_x, 8) + 0.0267101 *lens_ipow(begin_lambda, 10) + -1.20572e-09 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 2)*lens_ipow(begin_lambda, 4) + 9.54661e-15 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 6)+0.0f;
    domega2_dx0[0][1] =  + -4.15568e-05 *begin_y*begin_dx + -7.26888e-05 *begin_x*begin_dy + 2.82208e-05 *begin_x*begin_y + -0.00373201 *begin_dx*lens_ipow(begin_dy, 3) + 0.00100422 *begin_y*lens_ipow(begin_dx, 3) + 2.77835e-05 *lens_ipow(begin_y, 2)*begin_dx*begin_dy + 1.99415e-05 *begin_x*begin_y*lens_ipow(begin_dy, 2) + 4.51109e-05 *lens_ipow(begin_x, 2)*begin_dx*begin_dy + 0.00079547 *begin_y*begin_dx*lens_ipow(begin_dy, 2)*begin_lambda + 0.00300323 *begin_x*lens_ipow(begin_dx, 4)*begin_dy + 3.03532e-10 *begin_x*lens_ipow(begin_y, 5) + -5.89038e-09 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*begin_dy + 2.80724e-10 *lens_ipow(begin_x, 5)*begin_y + 0.0197079 *begin_x*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 5) + -1.41387e-07 *begin_x*lens_ipow(begin_y, 3)*lens_ipow(begin_lambda, 4) + 1.18601e-05 *lens_ipow(begin_x, 3)*lens_ipow(begin_dy, 5) + -1.02986e-07 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*begin_dy + -4.01396e-09 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 2)*begin_dx*begin_dy + -4.93652e-11 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 3)*begin_dx + -0.0201057 *begin_y*lens_ipow(begin_dx, 9) + -4.8229e-10 *lens_ipow(begin_x, 5)*begin_y*lens_ipow(begin_lambda, 4) + 1.14559e-14 *lens_ipow(begin_x, 5)*lens_ipow(begin_y, 5)+0.0f;
    domega2_dx0[1][0] =  + 0.00366859 *begin_dx*begin_dy + 1.2712e-06 *begin_y*begin_dy + -0.000104641 *begin_y*begin_dx + -0.000143003 *begin_x*begin_dy + 2.89344e-05 *begin_x*begin_y + 1.98884e-05 *lens_ipow(begin_y, 2)*begin_dx*begin_dy + 0.000780584 *begin_x*lens_ipow(begin_dy, 3) + 0.00102654 *begin_x*lens_ipow(begin_dx, 2)*begin_dy + 0.000773699 *begin_y*lens_ipow(begin_dx, 5) + -9.57632e-07 *begin_x*lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*begin_dy + 2.60389e-10 *begin_x*lens_ipow(begin_y, 5) + -2.39554e-09 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*begin_dy + 4.23112e-10 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 3) + 2.58859e-10 *lens_ipow(begin_x, 5)*begin_y + 0.0370831 *begin_y*lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 4) + 1.20305e-07 *begin_x*lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 3)*lens_ipow(begin_lambda, 2) + -9.14582e-08 *lens_ipow(begin_x, 3)*begin_y*lens_ipow(begin_lambda, 4) + -1.56692e-07 *begin_x*lens_ipow(begin_y, 3)*lens_ipow(begin_lambda, 5)+0.0f;
    domega2_dx0[1][1] =  + -0.0145595  + -0.00316615 *lens_ipow(begin_dx, 2) + -0.000292578 *begin_y*begin_dy + 4.40258e-05 *lens_ipow(begin_y, 2) + 1.2712e-06 *begin_x*begin_dy + -0.000104641 *begin_x*begin_dx + 1.44672e-05 *lens_ipow(begin_x, 2) + -0.00396411 *lens_ipow(begin_lambda, 3) + -0.00494903 *lens_ipow(begin_dy, 4) + 0.00139907 *begin_y*lens_ipow(begin_dy, 3) + 0.00128023 *begin_y*lens_ipow(begin_dx, 2)*begin_dy + 4.84893e-05 *lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 2) + -1.7264e-05 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2) + 3.97767e-05 *begin_x*begin_y*begin_dx*begin_dy + -0.000156708 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 2) + 0.000773699 *begin_x*lens_ipow(begin_dx, 5) + -9.57632e-07 *lens_ipow(begin_x, 2)*begin_y*lens_ipow(begin_dx, 2)*begin_dy + 6.50972e-10 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 4) + -1.19777e-09 *lens_ipow(begin_x, 4)*begin_y*begin_dy + 3.17334e-10 *lens_ipow(begin_x, 4)*lens_ipow(begin_y, 2) + 4.31431e-11 *lens_ipow(begin_x, 6) + 1.07272e-12 *lens_ipow(begin_y, 7)*begin_dy + 1.00819e-12 *lens_ipow(begin_y, 8) + 0.0370831 *begin_x*lens_ipow(begin_dx, 3)*lens_ipow(begin_dy, 4) + 1.20305e-07 *lens_ipow(begin_x, 2)*begin_y*lens_ipow(begin_dy, 3)*lens_ipow(begin_lambda, 2) + -2.28646e-08 *lens_ipow(begin_x, 4)*lens_ipow(begin_lambda, 4) + -1.62818e-07 *lens_ipow(begin_y, 4)*lens_ipow(begin_lambda, 5) + -2.35038e-07 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 2)*lens_ipow(begin_lambda, 5) + 0.0273723 *lens_ipow(begin_lambda, 10)+0.0f;
    float invJ[2][2];
    const float invdet = 1.0f/(domega2_dx0[0][0]*domega2_dx0[1][1] - domega2_dx0[0][1]*domega2_dx0[1][0]);
    invJ[0][0] =  domega2_dx0[1][1]*invdet;
    invJ[1][1] =  domega2_dx0[0][0]*invdet;
    invJ[0][1] = -domega2_dx0[0][1]*invdet;
    invJ[1][0] = -domega2_dx0[1][0]*invdet;
    for(int i=0;i<2;i++)
    {
      x += invJ[0][i]*delta_out[i];
      y += invJ[1][i]*delta_out[i];
    }
    if(sqr_err>prev_sqr_err) error |= 1;
    if(sqr_ap_err>prev_sqr_ap_err) error |= 2;
    if(out[0]!=out[0]) error |= 4;
    if(out[1]!=out[1]) error |= 8;
    DEBUG_LOG;
    // reset error code for first few iterations.
    if(k<10) error = 0;
  }
}
else
  error = 128;
if(out[0]*out[0]+out[1]*out[1] > lens_outer_pupil_radius*lens_outer_pupil_radius) error |= 16;
const float begin_x = x;
const float begin_y = y;
const float begin_dx = dx;
const float begin_dy = dy;
const float begin_lambda = lambda;
if(error==0)
  out[4] =  + 0.333512  + 0.280781 *begin_lambda + -2.84557e-06 *begin_dy + -1.76181e-06 *begin_dx + -0.027121 *lens_ipow(begin_dy, 2) + -0.0321791 *lens_ipow(begin_dx, 2) + -0.000337426 *begin_y*begin_dy + -6.6444e-06 *lens_ipow(begin_y, 2) + -0.000388471 *begin_x*begin_dx + -1.35534e-05 *lens_ipow(begin_x, 2) + -0.232101 *lens_ipow(begin_lambda, 3) + -0.00688131 *begin_y*lens_ipow(begin_dy, 3) + -0.00592774 *begin_y*lens_ipow(begin_dx, 2)*begin_dy + -0.000324578 *lens_ipow(begin_y, 2)*lens_ipow(begin_dy, 2) + -7.56015e-07 *lens_ipow(begin_y, 3)*begin_dy + -0.00595614 *begin_x*begin_dx*lens_ipow(begin_dy, 2) + -0.00731767 *begin_x*lens_ipow(begin_dx, 3) + -0.000428209 *begin_x*begin_y*begin_dx*begin_dy + 1.60803e-06 *lens_ipow(begin_x, 3)*begin_dx + -0.554329 *lens_ipow(begin_dy, 6) + -1.60078 *lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 4) + -1.40849 *lens_ipow(begin_dx, 4)*lens_ipow(begin_dy, 2) + -0.435074 *lens_ipow(begin_dx, 6) + -0.000536006 *lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 4) + -1.00769e-10 *lens_ipow(begin_y, 6) + -1.10345e-09 *begin_x*lens_ipow(begin_y, 4)*begin_dx + -0.000422883 *lens_ipow(begin_x, 2)*lens_ipow(begin_dy, 4) + -0.00174843 *lens_ipow(begin_x, 2)*lens_ipow(begin_dx, 4) + 1.33591e-05 *lens_ipow(begin_x, 2)*begin_y*lens_ipow(begin_dy, 3) + -1.19873e-08 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 3)*begin_dy + -6.00716e-09 *lens_ipow(begin_x, 3)*lens_ipow(begin_y, 2)*begin_dx + -6.69677e-10 *lens_ipow(begin_y, 6)*lens_ipow(begin_dx, 2) + -1.9219e-05 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 2)*lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 2) + -2.16786e-12 *lens_ipow(begin_x, 2)*lens_ipow(begin_y, 6) + 7.41756e-06 *lens_ipow(begin_x, 3)*begin_y*begin_dx*lens_ipow(begin_dy, 3) + 4.20375e-12 *lens_ipow(begin_x, 6)*begin_y*begin_dy + -2.30144e-12 *lens_ipow(begin_x, 6)*lens_ipow(begin_y, 2) + -0.749089 *lens_ipow(begin_dx, 2)*lens_ipow(begin_dy, 2)*lens_ipow(begin_lambda, 5) + 4.60505e-10 *lens_ipow(begin_x, 7)*begin_dx*lens_ipow(begin_dy, 2) + 0.420019 *lens_ipow(begin_lambda, 11);
else
  out[4] = 0.0f;
