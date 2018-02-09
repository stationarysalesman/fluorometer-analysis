function [ phase, amp  ] = calc_phase(freq_Vector, r, theta)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%You must have alpha's and tau's defined in avariables named "a" and "tau"
%wehre a and tau are vectors containing the lifetime preexponential factors
%and (a) and lifetimes (tau).  
%input r is a vector contiaining the aniostropies
%input theta is a vector containing the rotational correlation times
%the number of elements in a and r determine the fitting model
%this program calls phase_mod, which generates phase and mod data at single
%frequency point, and generates the outputs Delta Phase and Amplitude Ratio as a
%function of input freq_Vector.


alpha=evalin('base','a');
tau=evalin('base','tau');
siz=length(freq_Vector);
dat = zeros(siz,2);
for i=1:siz
    [dat(1,i), dat(2,i)] = phase_mod(freq_Vector(i),r,theta);
end
phase=dat(1,:);
amp = dat(2,:);


%uncomment to generate a plot of the data
figure
title('modulate me captain')
xlabel('Frequency (Hz)')
yyaxis left
semilogx(freq_Vector, amp);
ylabel('Modulation Ratio')
yyaxis right

semilogx(freq_Vector, phase);
ylabel('\Delta \Delta phase')

end

