const float out_x =  + -8.23478 *x + -23.6448 *dx*lambda + 0.209775 *lens_ipow(x, 2)*dx + -0.00567908 *x*lens_ipow(y, 2) + 7.19223 *x*lens_ipow(dy, 2) + -0.0100983 *lens_ipow(x, 3)*lambda + 0.302739 *x*y*dy*lambda + 1207.94 *x*lens_ipow(dx, 4) + 31.3281 *lens_ipow(x, 2)*lens_ipow(dx, 3) + 10503.8 *lens_ipow(dx, 5) + 0.350912 *lens_ipow(x, 3)*lens_ipow(dx, 2) + 8722.78 *lens_ipow(dx, 3)*lens_ipow(dy, 2) + 1038.42 *y*lens_ipow(dx, 3)*dy*lambda + 3375.71 *dx*lens_ipow(dy, 4)*lambda + -0.000607626 *lens_ipow(x, 4)*y*dx*dy + -1941.37 *x*lens_ipow(dx, 6) + 18.8515 *lens_ipow(y, 2)*lens_ipow(dx, 3)*lens_ipow(lambda, 2) + -8484.66 *y*lens_ipow(dx, 5)*dy*lambda + 14101.2 *y*lens_ipow(dx, 7)*dy + -157.75 *lens_ipow(y, 2)*lens_ipow(dx, 5)*lens_ipow(lambda, 3) + 987.563 *x*lens_ipow(dx, 8)*dy + 1.10767e-08 *lens_ipow(x, 3)*lens_ipow(y, 6)*lambda + 56171.5 *x*lens_ipow(dx, 8)*lens_ipow(dy, 2) + 1.62373e-08 *lens_ipow(x, 7)*lens_ipow(y, 2)*lens_ipow(lambda, 2) + 12.4767 *lens_ipow(y, 3)*dx*lens_ipow(dy, 7) + -3.06799 *lens_ipow(x, 4)*lens_ipow(dx, 3)*lens_ipow(dy, 4) + -958.675 *lens_ipow(x, 2)*lens_ipow(dx, 9) + -6.1304 *x*lens_ipow(y, 3)*lens_ipow(dx, 4)*lens_ipow(dy, 3);
const float out_y =  + -8.37596 *y + -14.0792 *dy + 8.14436 *y*lens_ipow(dx, 2) + 0.642083 *lens_ipow(y, 2)*dy + 30.1401 *y*lens_ipow(dy, 2) + 4.61396 *x*dx*dy + 0.213958 *x*y*dx + -0.00395195 *lens_ipow(x, 2)*y + 294.206 *lens_ipow(dy, 3) + -0.00520918 *lens_ipow(y, 3)*lambda + 9648.97 *lens_ipow(dx, 2)*lens_ipow(dy, 3) + 374.136 *x*dx*lens_ipow(dy, 3) + 6.27376 *lens_ipow(x, 2)*lens_ipow(dy, 3) + 2263.15 *lens_ipow(dx, 4)*dy + -1.22252e-05 *lens_ipow(y, 6)*dy + 41765.7 *lens_ipow(dy, 7) + 1.13934 *lens_ipow(x, 2)*y*lens_ipow(dy, 4) + 1751.59 *y*lens_ipow(dy, 6) + -1.31667 *x*lens_ipow(y, 2)*dx*lens_ipow(dy, 3) + 0.555329 *lens_ipow(y, 4)*lens_ipow(dy, 5) + -0.0200994 *lens_ipow(x, 2)*lens_ipow(y, 3)*lens_ipow(dx, 2)*lens_ipow(dy, 2) + 10.3339 *lens_ipow(x, 3)*lens_ipow(dx, 7)*dy + -3.3773 *lens_ipow(x, 3)*y*lens_ipow(dx, 5)*lens_ipow(dy, 2) + -3.27086 *lens_ipow(y, 4)*lens_ipow(dx, 2)*lens_ipow(dy, 5) + -2.40173 *lens_ipow(y, 4)*lens_ipow(dy, 7) + 1.06144e-10 *lens_ipow(x, 4)*lens_ipow(y, 7) + -0.000123388 *x*lens_ipow(y, 6)*dx*lens_ipow(dy, 3) + 0.379743 *x*lens_ipow(y, 4)*lens_ipow(dx, 3)*lens_ipow(dy, 3);
const float out_dx =  + -0.103083 *x + -0.601438 *dx*lambda + 0.234038 *y*dx*dy + 0.00352225 *x*y*dy + 5.38731 *dx*lens_ipow(dy, 2) + 4.57178e-05 *x*lens_ipow(y, 2) + 0.000216091 *lens_ipow(x, 3) + 0.107377 *x*lens_ipow(dy, 2) + 0.852366 *x*lens_ipow(dx, 2)*lambda + 0.0184197 *lens_ipow(x, 2)*dx*lambda + 0.0040717 *lens_ipow(y, 2)*dx*lambda + 17.8917 *lens_ipow(dx, 3)*lens_ipow(lambda, 2) + -0.000423037 *lens_ipow(x, 2)*y*dx*dy + -0.0197977 *lens_ipow(x, 2)*dx*lens_ipow(lambda, 3) + 71.8647 *lens_ipow(dx, 5)*lambda + 9.52493e-05 *lens_ipow(x, 4)*lens_ipow(dx, 3) + -0.00668964 *lens_ipow(y, 3)*dx*lens_ipow(dy, 3) + 0.000421438 *lens_ipow(y, 4)*lens_ipow(dx, 3) + -4.09222e-09 *x*lens_ipow(y, 6) + -1.25617 *x*lens_ipow(dx, 2)*lens_ipow(lambda, 4) + 455.971 *lens_ipow(dx, 5)*lens_ipow(dy, 2) + -0.000581608 *lens_ipow(y, 4)*lens_ipow(dx, 3)*lambda + -492.467 *lens_ipow(dx, 5)*lens_ipow(lambda, 4) + 132.875 *x*lens_ipow(dx, 6)*lens_ipow(dy, 2) + 61.7322 *x*lens_ipow(dx, 8)*lambda + 1828.09 *lens_ipow(dx, 7)*lens_ipow(lambda, 4) + -1.09217e-05 *lens_ipow(y, 6)*dx*lens_ipow(dy, 4) + 0.00256169 *x*lens_ipow(y, 4)*lens_ipow(dx, 4)*lens_ipow(dy, 2);
const float out_dy =  + -0.103601 *y + -0.713373 *dy*lambda + 0.000378384 *lens_ipow(x, 2)*y + 0.000247393 *lens_ipow(y, 3) + 0.129964 *y*lens_ipow(dx, 2)*lambda + 0.00402109 *lens_ipow(x, 2)*dy*lambda + 0.0165033 *lens_ipow(y, 2)*dy*lambda + 0.00729411 *x*y*dx*lambda + 0.693063 *x*dx*dy*lens_ipow(lambda, 2) + 0.409198 *dy*lens_ipow(lambda, 4) + 32.9633 *lens_ipow(dy, 3)*lens_ipow(lambda, 2) + -1.96139e-07 *lens_ipow(y, 5) + 18.4048 *lens_ipow(dx, 2)*dy*lens_ipow(lambda, 2) + 2.80892 *y*lens_ipow(dy, 2)*lens_ipow(lambda, 2) + 0.563506 *y*lens_ipow(dx, 4)*lambda + -0.0130565 *lens_ipow(y, 2)*dy*lens_ipow(lambda, 3) + 7.74914e-07 *lens_ipow(x, 2)*lens_ipow(y, 3)*lambda + -3.11538 *y*lens_ipow(dy, 2)*lens_ipow(lambda, 3) + -44.8493 *lens_ipow(dy, 3)*lens_ipow(lambda, 4) + 0.00454339 *lens_ipow(x, 2)*dy*lens_ipow(lambda, 4) + 0.00015627 *lens_ipow(x, 2)*y*lens_ipow(lambda, 5) + 10.8648 *x*dx*lens_ipow(dy, 5)*lens_ipow(lambda, 2) + -16.3559 *y*lens_ipow(dy, 8) + 0.509567 *x*y*dx*lens_ipow(dy, 2)*lens_ipow(lambda, 6) + -0.000484984 *lens_ipow(y, 5)*lens_ipow(dy, 6) + -0.0186708 *lens_ipow(y, 4)*lens_ipow(dy, 7) + -7.7512e-10 *lens_ipow(x, 6)*lens_ipow(y, 3)*lens_ipow(dx, 2) + 12.1926 *y*lens_ipow(dx, 2)*lens_ipow(dy, 2)*lens_ipow(lambda, 6);
const float out_transmittance =  + 0.196001  + 0.378559 *lambda + 0.128762 *lens_ipow(dy, 2) + -0.267516 *lens_ipow(lambda, 2) + -3.43289 *lens_ipow(dy, 4) + -5.30271e-06 *lens_ipow(x, 2)*lens_ipow(y, 2) + -0.00124765 *x*lens_ipow(y, 2)*dx*lens_ipow(dy, 2) + -1.33218e-08 *lens_ipow(x, 6) + -1.27157e-08 *lens_ipow(y, 6) + -331.504 *lens_ipow(dx, 4)*lens_ipow(dy, 2) + -22.8135 *y*lens_ipow(dy, 7) + -0.435257 *lens_ipow(y, 2)*lens_ipow(dy, 6) + 4657.45 *lens_ipow(dx, 4)*lens_ipow(dy, 4) + -0.644826 *x*lens_ipow(dx, 3)*lens_ipow(lambda, 4) + 4717.32 *lens_ipow(dx, 6)*lens_ipow(dy, 2) + 7.77492 *x*lens_ipow(dx, 5)*lens_ipow(lambda, 2) + 129.97 *lens_ipow(dy, 8)*lambda + -44.8792 *x*lens_ipow(dx, 7)*lambda + -2092.11 *lens_ipow(dy, 10) + -3144.49 *lens_ipow(dx, 2)*lens_ipow(dy, 8) + -20701.6 *lens_ipow(dx, 4)*lens_ipow(dy, 6) + -42660.6 *lens_ipow(dx, 6)*lens_ipow(dy, 4) + -19041.8 *lens_ipow(dx, 8)*lens_ipow(dy, 2) + -1799.27 *lens_ipow(dx, 10) + 31.9804 *x*y*lens_ipow(dx, 5)*lens_ipow(dy, 3)*lambda + 0.0626751 *lens_ipow(x, 3)*lens_ipow(dx, 7)*lambda + 5.56252e-07 *lens_ipow(x, 3)*lens_ipow(y, 4)*dx*lens_ipow(dy, 2)*lambda + -0.0101147 *x*lens_ipow(y, 3)*lens_ipow(dx, 5)*dy*lambda;
