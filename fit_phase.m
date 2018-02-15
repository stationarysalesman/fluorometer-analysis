function [ gof ] = fit_phase(par)

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%loads eperimental data and calls calc_phase determines Goodness of fit
%between calcuated data and measured data

%You must have alpha's and tau's defined in avariables named "a" and "tau"
%wehre a and tau are vectors containing the lifetime preexponential factors
%and (a) and lifetimes (tau). 
%rtot must be defined in a varialbe rtot in current workspace

%par is [r1 r2... rN-1 rtot theta1 theta2...thetaN]
%this determines the rotational model
%
Testdata= evalin('base', 'matrix');
rtot=evalin('base', 'rtot');
f=evalin('base', 'f');
%below is becuase we are caluating the final r to fix the total anisotropy to 
%rtot so need to add element to par size and generate third r from rtot

parsize=length(par)+1;
r=par(1:parsize/2);
r(parsize/2) = rtot - sum(par(1:parsize/2-1));

%the -1 index gets thetas since we added 1

theta=par(parsize/2:parsize -1);

freq = Testdata(:,1);
if freq(1) < 1e4
    

freq = freq*1000000;
end
pdata = Testdata(:,2);
mdata = Testdata(:,3);
a=evalin('base','a');
%r=evalin('base','r')
tau=evalin('base','tau');


length(freq);
[phase, mod] = calc_phase(freq,r,theta);
[phasefit, modfit] = calc_phase(f,r,theta);
length(phase);
%[h , p, st] =chi2gof(fit, 'Expected', data)
phase=phase';
mod=mod';
v=length(pdata)- 1  + length(par);
gof = (1/v)*sum((phase-pdata).^2./0.2) + (1/v)*sum((mod - mdata).^2./0.004);

%yyaxis left
semilogx(f,phasefit, 'b', freq, pdata, 'ro')
ylim([0 15])
 
%yyaxis right
%semilogx(f,modfit, 'b', freq, mdata, 'ro')
%ylim([0.25 1])
%yyaxis left
text(1.1e5,14, num2str(r))
text(1.1e5,12,num2str(1e9*theta))
text(1.1e5,10,num2str(gof))
text(1.1e5,8,num2str(sum(r)))
drawnow
%figure, semilogx(freq,mod, 'b')
r_out=par(1:parsize/2)
theta_out=1e9*par(parsize/2:parsize -1)
end



