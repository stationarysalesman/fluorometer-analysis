tau = [850e-9, 70e-9];
a = [.336, .335];
r = [.0618, .18-.0618];
theta = [88e-9, 7.8e-9];
lowerlim = 75e3;
upperlim = 6e6;
step = (upperlim - lowerlim) / 20;
freq_vec = lowerlim:step:upperlim;
calc_phase(freq_vec,r,theta)

