taus=[857 72.1; 860 105; 851 81]';
alphas=[.114 .0319; .113 .0238; .115 .0259]';
thetas=[88.2 6.21; 98.7 7.53; 91.4 7.58]';
rs=[.0737 .106; .0698 .11; .0678 .112]';
lowerlim = 75e3;
upperlim = 30e6;
step = (upperlim - lowerlim) / 50;
freq_vec = lowerlim:step:upperlim;
size=length(freq_vec);
phase_vectors = zeros(51,3);
amplitude_vectors = zeros(51,3);
xvec = [freq_vec; freq_vec; freq_vec;]';


for i = 1:3
    tau=taus(:,i)';
    a=alphas(:,i)';
    r=rs(:,i)';
    theta=thetas(:,i)';
    [p,m]=calc_phase(freq_vec,r,theta);
    disp(m)
    phase_vectors(:,i)=p(:);
    amplitude_vectors(:,i)=m(:);
    
end

disp(amplitude_vectors)
% Plotting
fig = figure;
left_color = [1.0 0.0 0.0];
right_color = [0.0 0.0 1.0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
title('modulate me captain')
xlabel('Frequency (Hz)')
yyaxis left
semilogx(xvec(:,1), amplitude_vectors(:,1));
ylabel('Modulation Ratio', 'Color', 'r')
ylim([0.0,1.0])
yyaxis right
semilogx(xvec(:,1), phase_vectors(:,1));
ylabel('\Delta \Delta phase', 'Color', 'b')
ylim([0.0,25.0])



