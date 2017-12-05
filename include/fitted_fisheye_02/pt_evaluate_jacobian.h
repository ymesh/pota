const float dx00 =  + -8.23478  + 0.419551 *x*dx + -0.00567908 *lens_ipow(y, 2) + 7.19223 *lens_ipow(dy, 2) + -0.0302949 *lens_ipow(x, 2)*lambda + 0.302739 *y*dy*lambda + 1207.94 *lens_ipow(dx, 4) + 62.6563 *x*lens_ipow(dx, 3) + 1.05274 *lens_ipow(x, 2)*lens_ipow(dx, 2) + -0.0024305 *lens_ipow(x, 3)*y*dx*dy + -1941.37 *lens_ipow(dx, 6) + 987.563 *lens_ipow(dx, 8)*dy + 3.323e-08 *lens_ipow(x, 2)*lens_ipow(y, 6)*lambda + 56171.5 *lens_ipow(dx, 8)*lens_ipow(dy, 2) + 1.13661e-07 *lens_ipow(x, 6)*lens_ipow(y, 2)*lens_ipow(lambda, 2) + -12.2719 *lens_ipow(x, 3)*lens_ipow(dx, 3)*lens_ipow(dy, 4) + -1917.35 *x*lens_ipow(dx, 9) + -6.1304 *lens_ipow(y, 3)*lens_ipow(dx, 4)*lens_ipow(dy, 3)+0.0f;
const float dx01 =  + -0.0113582 *x*y + 0.302739 *x*dy*lambda + 1038.42 *lens_ipow(dx, 3)*dy*lambda + -0.000607626 *lens_ipow(x, 4)*dx*dy + 37.7031 *y*lens_ipow(dx, 3)*lens_ipow(lambda, 2) + -8484.66 *lens_ipow(dx, 5)*dy*lambda + 14101.2 *lens_ipow(dx, 7)*dy + -315.5 *y*lens_ipow(dx, 5)*lens_ipow(lambda, 3) + 6.64601e-08 *lens_ipow(x, 3)*lens_ipow(y, 5)*lambda + 3.24746e-08 *lens_ipow(x, 7)*y*lens_ipow(lambda, 2) + 37.43 *lens_ipow(y, 2)*dx*lens_ipow(dy, 7) + -18.3912 *x*lens_ipow(y, 2)*lens_ipow(dx, 4)*lens_ipow(dy, 3)+0.0f;
const float dx02 =  + -23.6448 *lambda + 0.209775 *lens_ipow(x, 2) + 4831.74 *x*lens_ipow(dx, 3) + 93.9844 *lens_ipow(x, 2)*lens_ipow(dx, 2) + 52519.2 *lens_ipow(dx, 4) + 0.701825 *lens_ipow(x, 3)*dx + 26168.4 *lens_ipow(dx, 2)*lens_ipow(dy, 2) + 3115.25 *y*lens_ipow(dx, 2)*dy*lambda + 3375.71 *lens_ipow(dy, 4)*lambda + -0.000607626 *lens_ipow(x, 4)*y*dy + -11648.2 *x*lens_ipow(dx, 5) + 56.5546 *lens_ipow(y, 2)*lens_ipow(dx, 2)*lens_ipow(lambda, 2) + -42423.3 *y*lens_ipow(dx, 4)*dy*lambda + 98708.7 *y*lens_ipow(dx, 6)*dy + -788.75 *lens_ipow(y, 2)*lens_ipow(dx, 4)*lens_ipow(lambda, 3) + 7900.5 *x*lens_ipow(dx, 7)*dy + 449372 *x*lens_ipow(dx, 7)*lens_ipow(dy, 2) + 12.4767 *lens_ipow(y, 3)*lens_ipow(dy, 7) + -9.20396 *lens_ipow(x, 4)*lens_ipow(dx, 2)*lens_ipow(dy, 4) + -8628.08 *lens_ipow(x, 2)*lens_ipow(dx, 8) + -24.5216 *x*lens_ipow(y, 3)*lens_ipow(dx, 3)*lens_ipow(dy, 3)+0.0f;
const float dx03 =  + 14.3845 *x*dy + 0.302739 *x*y*lambda + 17445.6 *lens_ipow(dx, 3)*dy + 1038.42 *y*lens_ipow(dx, 3)*lambda + 13502.8 *dx*lens_ipow(dy, 3)*lambda + -0.000607626 *lens_ipow(x, 4)*y*dx + -8484.66 *y*lens_ipow(dx, 5)*lambda + 14101.2 *y*lens_ipow(dx, 7) + 987.563 *x*lens_ipow(dx, 8) + 112343 *x*lens_ipow(dx, 8)*dy + 87.3366 *lens_ipow(y, 3)*dx*lens_ipow(dy, 6) + -12.2719 *lens_ipow(x, 4)*lens_ipow(dx, 3)*lens_ipow(dy, 3) + -18.3912 *x*lens_ipow(y, 3)*lens_ipow(dx, 4)*lens_ipow(dy, 2)+0.0f;
const float dx04 =  + -23.6448 *dx + -0.0100983 *lens_ipow(x, 3) + 0.302739 *x*y*dy + 1038.42 *y*lens_ipow(dx, 3)*dy + 3375.71 *dx*lens_ipow(dy, 4) + 37.7031 *lens_ipow(y, 2)*lens_ipow(dx, 3)*lambda + -8484.66 *y*lens_ipow(dx, 5)*dy + -473.25 *lens_ipow(y, 2)*lens_ipow(dx, 5)*lens_ipow(lambda, 2) + 1.10767e-08 *lens_ipow(x, 3)*lens_ipow(y, 6) + 3.24746e-08 *lens_ipow(x, 7)*lens_ipow(y, 2)*lambda+0.0f;
const float dx10 =  + 4.61396 *dx*dy + 0.213958 *y*dx + -0.0079039 *x*y + 374.136 *dx*lens_ipow(dy, 3) + 12.5475 *x*lens_ipow(dy, 3) + 2.27868 *x*y*lens_ipow(dy, 4) + -1.31667 *lens_ipow(y, 2)*dx*lens_ipow(dy, 3) + -0.0401988 *x*lens_ipow(y, 3)*lens_ipow(dx, 2)*lens_ipow(dy, 2) + 31.0017 *lens_ipow(x, 2)*lens_ipow(dx, 7)*dy + -10.1319 *lens_ipow(x, 2)*y*lens_ipow(dx, 5)*lens_ipow(dy, 2) + 4.24577e-10 *lens_ipow(x, 3)*lens_ipow(y, 7) + -0.000123388 *lens_ipow(y, 6)*dx*lens_ipow(dy, 3) + 0.379743 *lens_ipow(y, 4)*lens_ipow(dx, 3)*lens_ipow(dy, 3)+0.0f;
const float dx11 =  + -8.37596  + 8.14436 *lens_ipow(dx, 2) + 1.28417 *y*dy + 30.1401 *lens_ipow(dy, 2) + 0.213958 *x*dx + -0.00395195 *lens_ipow(x, 2) + -0.0156275 *lens_ipow(y, 2)*lambda + -7.3351e-05 *lens_ipow(y, 5)*dy + 1.13934 *lens_ipow(x, 2)*lens_ipow(dy, 4) + 1751.59 *lens_ipow(dy, 6) + -2.63334 *x*y*dx*lens_ipow(dy, 3) + 2.22132 *lens_ipow(y, 3)*lens_ipow(dy, 5) + -0.0602983 *lens_ipow(x, 2)*lens_ipow(y, 2)*lens_ipow(dx, 2)*lens_ipow(dy, 2) + -3.3773 *lens_ipow(x, 3)*lens_ipow(dx, 5)*lens_ipow(dy, 2) + -13.0834 *lens_ipow(y, 3)*lens_ipow(dx, 2)*lens_ipow(dy, 5) + -9.60692 *lens_ipow(y, 3)*lens_ipow(dy, 7) + 7.43009e-10 *lens_ipow(x, 4)*lens_ipow(y, 6) + -0.00074033 *x*lens_ipow(y, 5)*dx*lens_ipow(dy, 3) + 1.51897 *x*lens_ipow(y, 3)*lens_ipow(dx, 3)*lens_ipow(dy, 3)+0.0f;
const float dx12 =  + 16.2887 *y*dx + 4.61396 *x*dy + 0.213958 *x*y + 19297.9 *dx*lens_ipow(dy, 3) + 374.136 *x*lens_ipow(dy, 3) + 9052.61 *lens_ipow(dx, 3)*dy + -1.31667 *x*lens_ipow(y, 2)*lens_ipow(dy, 3) + -0.0401988 *lens_ipow(x, 2)*lens_ipow(y, 3)*dx*lens_ipow(dy, 2) + 72.3373 *lens_ipow(x, 3)*lens_ipow(dx, 6)*dy + -16.8865 *lens_ipow(x, 3)*y*lens_ipow(dx, 4)*lens_ipow(dy, 2) + -6.54172 *lens_ipow(y, 4)*dx*lens_ipow(dy, 5) + -0.000123388 *x*lens_ipow(y, 6)*lens_ipow(dy, 3) + 1.13923 *x*lens_ipow(y, 4)*lens_ipow(dx, 2)*lens_ipow(dy, 3)+0.0f;
const float dx13 =  + -14.0792  + 0.642083 *lens_ipow(y, 2) + 60.2803 *y*dy + 4.61396 *x*dx + 882.619 *lens_ipow(dy, 2) + 28946.9 *lens_ipow(dx, 2)*lens_ipow(dy, 2) + 1122.41 *x*dx*lens_ipow(dy, 2) + 18.8213 *lens_ipow(x, 2)*lens_ipow(dy, 2) + 2263.15 *lens_ipow(dx, 4) + -1.22252e-05 *lens_ipow(y, 6) + 292360 *lens_ipow(dy, 6) + 4.55735 *lens_ipow(x, 2)*y*lens_ipow(dy, 3) + 10509.5 *y*lens_ipow(dy, 5) + -3.95001 *x*lens_ipow(y, 2)*dx*lens_ipow(dy, 2) + 2.77665 *lens_ipow(y, 4)*lens_ipow(dy, 4) + -0.0401988 *lens_ipow(x, 2)*lens_ipow(y, 3)*lens_ipow(dx, 2)*dy + 10.3339 *lens_ipow(x, 3)*lens_ipow(dx, 7) + -6.75459 *lens_ipow(x, 3)*y*lens_ipow(dx, 5)*dy + -16.3543 *lens_ipow(y, 4)*lens_ipow(dx, 2)*lens_ipow(dy, 4) + -16.8121 *lens_ipow(y, 4)*lens_ipow(dy, 6) + -0.000370165 *x*lens_ipow(y, 6)*dx*lens_ipow(dy, 2) + 1.13923 *x*lens_ipow(y, 4)*lens_ipow(dx, 3)*lens_ipow(dy, 2)+0.0f;
const float dx14 =  + -0.00520918 *lens_ipow(y, 3)+0.0f;
const float dx20 =  + -0.103083  + 0.00352225 *y*dy + 4.57178e-05 *lens_ipow(y, 2) + 0.000648272 *lens_ipow(x, 2) + 0.107377 *lens_ipow(dy, 2) + 0.852366 *lens_ipow(dx, 2)*lambda + 0.0368395 *x*dx*lambda + -0.000846074 *x*y*dx*dy + -0.0395955 *x*dx*lens_ipow(lambda, 3) + 0.000380997 *lens_ipow(x, 3)*lens_ipow(dx, 3) + -4.09222e-09 *lens_ipow(y, 6) + -1.25617 *lens_ipow(dx, 2)*lens_ipow(lambda, 4) + 132.875 *lens_ipow(dx, 6)*lens_ipow(dy, 2) + 61.7322 *lens_ipow(dx, 8)*lambda + 0.00256169 *lens_ipow(y, 4)*lens_ipow(dx, 4)*lens_ipow(dy, 2)+0.0f;
const float dx21 =  + 0.234038 *dx*dy + 0.00352225 *x*dy + 9.14357e-05 *x*y + 0.00814339 *y*dx*lambda + -0.000423037 *lens_ipow(x, 2)*dx*dy + -0.0200689 *lens_ipow(y, 2)*dx*lens_ipow(dy, 3) + 0.00168575 *lens_ipow(y, 3)*lens_ipow(dx, 3) + -2.45533e-08 *x*lens_ipow(y, 5) + -0.00232643 *lens_ipow(y, 3)*lens_ipow(dx, 3)*lambda + -6.55305e-05 *lens_ipow(y, 5)*dx*lens_ipow(dy, 4) + 0.0102467 *x*lens_ipow(y, 3)*lens_ipow(dx, 4)*lens_ipow(dy, 2)+0.0f;
const float dx22 =  + -0.601438 *lambda + 0.234038 *y*dy + 5.38731 *lens_ipow(dy, 2) + 1.70473 *x*dx*lambda + 0.0184197 *lens_ipow(x, 2)*lambda + 0.0040717 *lens_ipow(y, 2)*lambda + 53.675 *lens_ipow(dx, 2)*lens_ipow(lambda, 2) + -0.000423037 *lens_ipow(x, 2)*y*dy + -0.0197977 *lens_ipow(x, 2)*lens_ipow(lambda, 3) + 359.324 *lens_ipow(dx, 4)*lambda + 0.000285748 *lens_ipow(x, 4)*lens_ipow(dx, 2) + -0.00668964 *lens_ipow(y, 3)*lens_ipow(dy, 3) + 0.00126431 *lens_ipow(y, 4)*lens_ipow(dx, 2) + -2.51235 *x*dx*lens_ipow(lambda, 4) + 2279.86 *lens_ipow(dx, 4)*lens_ipow(dy, 2) + -0.00174482 *lens_ipow(y, 4)*lens_ipow(dx, 2)*lambda + -2462.33 *lens_ipow(dx, 4)*lens_ipow(lambda, 4) + 797.25 *x*lens_ipow(dx, 5)*lens_ipow(dy, 2) + 493.857 *x*lens_ipow(dx, 7)*lambda + 12796.6 *lens_ipow(dx, 6)*lens_ipow(lambda, 4) + -1.09217e-05 *lens_ipow(y, 6)*lens_ipow(dy, 4) + 0.0102467 *x*lens_ipow(y, 4)*lens_ipow(dx, 3)*lens_ipow(dy, 2)+0.0f;
const float dx23 =  + 0.234038 *y*dx + 0.00352225 *x*y + 10.7746 *dx*dy + 0.214753 *x*dy + -0.000423037 *lens_ipow(x, 2)*y*dx + -0.0200689 *lens_ipow(y, 3)*dx*lens_ipow(dy, 2) + 911.942 *lens_ipow(dx, 5)*dy + 265.75 *x*lens_ipow(dx, 6)*dy + -4.3687e-05 *lens_ipow(y, 6)*dx*lens_ipow(dy, 3) + 0.00512337 *x*lens_ipow(y, 4)*lens_ipow(dx, 4)*dy+0.0f;
const float dx24 =  + -0.601438 *dx + 0.852366 *x*lens_ipow(dx, 2) + 0.0184197 *lens_ipow(x, 2)*dx + 0.0040717 *lens_ipow(y, 2)*dx + 35.7833 *lens_ipow(dx, 3)*lambda + -0.0593932 *lens_ipow(x, 2)*dx*lens_ipow(lambda, 2) + 71.8647 *lens_ipow(dx, 5) + -5.02469 *x*lens_ipow(dx, 2)*lens_ipow(lambda, 3) + -0.000581608 *lens_ipow(y, 4)*lens_ipow(dx, 3) + -1969.87 *lens_ipow(dx, 5)*lens_ipow(lambda, 3) + 61.7322 *x*lens_ipow(dx, 8) + 7312.35 *lens_ipow(dx, 7)*lens_ipow(lambda, 3)+0.0f;
const float dx30 =  + 0.000756768 *x*y + 0.00804217 *x*dy*lambda + 0.00729411 *y*dx*lambda + 0.693063 *dx*dy*lens_ipow(lambda, 2) + 1.54983e-06 *x*lens_ipow(y, 3)*lambda + 0.00908677 *x*dy*lens_ipow(lambda, 4) + 0.00031254 *x*y*lens_ipow(lambda, 5) + 10.8648 *dx*lens_ipow(dy, 5)*lens_ipow(lambda, 2) + 0.509567 *y*dx*lens_ipow(dy, 2)*lens_ipow(lambda, 6) + -4.65072e-09 *lens_ipow(x, 5)*lens_ipow(y, 3)*lens_ipow(dx, 2)+0.0f;
const float dx31 =  + -0.103601  + 0.000378384 *lens_ipow(x, 2) + 0.000742179 *lens_ipow(y, 2) + 0.129964 *lens_ipow(dx, 2)*lambda + 0.0330067 *y*dy*lambda + 0.00729411 *x*dx*lambda + -9.80694e-07 *lens_ipow(y, 4) + 2.80892 *lens_ipow(dy, 2)*lens_ipow(lambda, 2) + 0.563506 *lens_ipow(dx, 4)*lambda + -0.026113 *y*dy*lens_ipow(lambda, 3) + 2.32474e-06 *lens_ipow(x, 2)*lens_ipow(y, 2)*lambda + -3.11538 *lens_ipow(dy, 2)*lens_ipow(lambda, 3) + 0.00015627 *lens_ipow(x, 2)*lens_ipow(lambda, 5) + -16.3559 *lens_ipow(dy, 8) + 0.509567 *x*dx*lens_ipow(dy, 2)*lens_ipow(lambda, 6) + -0.00242492 *lens_ipow(y, 4)*lens_ipow(dy, 6) + -0.0746833 *lens_ipow(y, 3)*lens_ipow(dy, 7) + -2.32536e-09 *lens_ipow(x, 6)*lens_ipow(y, 2)*lens_ipow(dx, 2) + 12.1926 *lens_ipow(dx, 2)*lens_ipow(dy, 2)*lens_ipow(lambda, 6)+0.0f;
const float dx32 =  + 0.259928 *y*dx*lambda + 0.00729411 *x*y*lambda + 0.693063 *x*dy*lens_ipow(lambda, 2) + 36.8096 *dx*dy*lens_ipow(lambda, 2) + 2.25403 *y*lens_ipow(dx, 3)*lambda + 10.8648 *x*lens_ipow(dy, 5)*lens_ipow(lambda, 2) + 0.509567 *x*y*lens_ipow(dy, 2)*lens_ipow(lambda, 6) + -1.55024e-09 *lens_ipow(x, 6)*lens_ipow(y, 3)*dx + 24.3852 *y*dx*lens_ipow(dy, 2)*lens_ipow(lambda, 6)+0.0f;
const float dx33 =  + -0.713373 *lambda + 0.00402109 *lens_ipow(x, 2)*lambda + 0.0165033 *lens_ipow(y, 2)*lambda + 0.693063 *x*dx*lens_ipow(lambda, 2) + 0.409198 *lens_ipow(lambda, 4) + 98.8898 *lens_ipow(dy, 2)*lens_ipow(lambda, 2) + 18.4048 *lens_ipow(dx, 2)*lens_ipow(lambda, 2) + 5.61783 *y*dy*lens_ipow(lambda, 2) + -0.0130565 *lens_ipow(y, 2)*lens_ipow(lambda, 3) + -6.23077 *y*dy*lens_ipow(lambda, 3) + -134.548 *lens_ipow(dy, 2)*lens_ipow(lambda, 4) + 0.00454339 *lens_ipow(x, 2)*lens_ipow(lambda, 4) + 54.3241 *x*dx*lens_ipow(dy, 4)*lens_ipow(lambda, 2) + -130.847 *y*lens_ipow(dy, 7) + 1.01913 *x*y*dx*dy*lens_ipow(lambda, 6) + -0.0029099 *lens_ipow(y, 5)*lens_ipow(dy, 5) + -0.130696 *lens_ipow(y, 4)*lens_ipow(dy, 6) + 24.3852 *y*lens_ipow(dx, 2)*dy*lens_ipow(lambda, 6)+0.0f;
const float dx34 =  + -0.713373 *dy + 0.129964 *y*lens_ipow(dx, 2) + 0.00402109 *lens_ipow(x, 2)*dy + 0.0165033 *lens_ipow(y, 2)*dy + 0.00729411 *x*y*dx + 1.38613 *x*dx*dy*lambda + 1.63679 *dy*lens_ipow(lambda, 3) + 65.9265 *lens_ipow(dy, 3)*lambda + 36.8096 *lens_ipow(dx, 2)*dy*lambda + 5.61783 *y*lens_ipow(dy, 2)*lambda + 0.563506 *y*lens_ipow(dx, 4) + -0.0391695 *lens_ipow(y, 2)*dy*lens_ipow(lambda, 2) + 7.74914e-07 *lens_ipow(x, 2)*lens_ipow(y, 3) + -9.34615 *y*lens_ipow(dy, 2)*lens_ipow(lambda, 2) + -179.397 *lens_ipow(dy, 3)*lens_ipow(lambda, 3) + 0.0181735 *lens_ipow(x, 2)*dy*lens_ipow(lambda, 3) + 0.00078135 *lens_ipow(x, 2)*y*lens_ipow(lambda, 4) + 21.7296 *x*dx*lens_ipow(dy, 5)*lambda + 3.0574 *x*y*dx*lens_ipow(dy, 2)*lens_ipow(lambda, 5) + 73.1557 *y*lens_ipow(dx, 2)*lens_ipow(dy, 2)*lens_ipow(lambda, 5)+0.0f;
const float dx40 =  + -1.06054e-05 *x*lens_ipow(y, 2) + -0.00124765 *lens_ipow(y, 2)*dx*lens_ipow(dy, 2) + -7.99307e-08 *lens_ipow(x, 5) + -0.644826 *lens_ipow(dx, 3)*lens_ipow(lambda, 4) + 7.77492 *lens_ipow(dx, 5)*lens_ipow(lambda, 2) + -44.8792 *lens_ipow(dx, 7)*lambda + 31.9804 *y*lens_ipow(dx, 5)*lens_ipow(dy, 3)*lambda + 0.188025 *lens_ipow(x, 2)*lens_ipow(dx, 7)*lambda + 1.66876e-06 *lens_ipow(x, 2)*lens_ipow(y, 4)*dx*lens_ipow(dy, 2)*lambda + -0.0101147 *lens_ipow(y, 3)*lens_ipow(dx, 5)*dy*lambda+0.0f;
const float dx41 =  + -1.06054e-05 *lens_ipow(x, 2)*y + -0.0024953 *x*y*dx*lens_ipow(dy, 2) + -7.62943e-08 *lens_ipow(y, 5) + -22.8135 *lens_ipow(dy, 7) + -0.870514 *y*lens_ipow(dy, 6) + 31.9804 *x*lens_ipow(dx, 5)*lens_ipow(dy, 3)*lambda + 2.22501e-06 *lens_ipow(x, 3)*lens_ipow(y, 3)*dx*lens_ipow(dy, 2)*lambda + -0.0303442 *x*lens_ipow(y, 2)*lens_ipow(dx, 5)*dy*lambda+0.0f;
const float dx42 =  + -0.00124765 *x*lens_ipow(y, 2)*lens_ipow(dy, 2) + -1326.01 *lens_ipow(dx, 3)*lens_ipow(dy, 2) + 18629.8 *lens_ipow(dx, 3)*lens_ipow(dy, 4) + -1.93448 *x*lens_ipow(dx, 2)*lens_ipow(lambda, 4) + 28303.9 *lens_ipow(dx, 5)*lens_ipow(dy, 2) + 38.8746 *x*lens_ipow(dx, 4)*lens_ipow(lambda, 2) + -314.154 *x*lens_ipow(dx, 6)*lambda + -6288.98 *dx*lens_ipow(dy, 8) + -82806.5 *lens_ipow(dx, 3)*lens_ipow(dy, 6) + -255964 *lens_ipow(dx, 5)*lens_ipow(dy, 4) + -152335 *lens_ipow(dx, 7)*lens_ipow(dy, 2) + -17992.7 *lens_ipow(dx, 9) + 159.902 *x*y*lens_ipow(dx, 4)*lens_ipow(dy, 3)*lambda + 0.438726 *lens_ipow(x, 3)*lens_ipow(dx, 6)*lambda + 5.56252e-07 *lens_ipow(x, 3)*lens_ipow(y, 4)*lens_ipow(dy, 2)*lambda + -0.0505736 *x*lens_ipow(y, 3)*lens_ipow(dx, 4)*dy*lambda+0.0f;
const float dx43 =  + 0.257524 *dy + -13.7316 *lens_ipow(dy, 3) + -0.0024953 *x*lens_ipow(y, 2)*dx*dy + -663.007 *lens_ipow(dx, 4)*dy + -159.695 *y*lens_ipow(dy, 6) + -2.61154 *lens_ipow(y, 2)*lens_ipow(dy, 5) + 18629.8 *lens_ipow(dx, 4)*lens_ipow(dy, 3) + 9434.64 *lens_ipow(dx, 6)*dy + 1039.76 *lens_ipow(dy, 7)*lambda + -20921.1 *lens_ipow(dy, 9) + -25155.9 *lens_ipow(dx, 2)*lens_ipow(dy, 7) + -124210 *lens_ipow(dx, 4)*lens_ipow(dy, 5) + -170642 *lens_ipow(dx, 6)*lens_ipow(dy, 3) + -38083.7 *lens_ipow(dx, 8)*dy + 95.9413 *x*y*lens_ipow(dx, 5)*lens_ipow(dy, 2)*lambda + 1.1125e-06 *lens_ipow(x, 3)*lens_ipow(y, 4)*dx*dy*lambda + -0.0101147 *x*lens_ipow(y, 3)*lens_ipow(dx, 5)*lambda+0.0f;
const float dx44 =  + 0.378559  + -0.535031 *lambda + -2.5793 *x*lens_ipow(dx, 3)*lens_ipow(lambda, 3) + 15.5498 *x*lens_ipow(dx, 5)*lambda + 129.97 *lens_ipow(dy, 8) + -44.8792 *x*lens_ipow(dx, 7) + 31.9804 *x*y*lens_ipow(dx, 5)*lens_ipow(dy, 3) + 0.0626751 *lens_ipow(x, 3)*lens_ipow(dx, 7) + 5.56252e-07 *lens_ipow(x, 3)*lens_ipow(y, 4)*dx*lens_ipow(dy, 2) + -0.0101147 *x*lens_ipow(y, 3)*lens_ipow(dx, 5)*dy+0.0f;
