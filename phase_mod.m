function [ phase, amp ] = phase_mod( f, r, theta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%You must have alpha's and tau's defined in avariables named "a" and "tau"
%wehre a and tau are vectors containing the lifetime preexponential factors
%and (a) and lifetimes (tau).
%f is a single frequency, output is  Delta Phase and Amplitude Ratio at frequency F

a=evalin('base','a');
%r=evalin('base','r');
tau=evalin('base','tau');

w = 2*pi*f; %convert Hz to angular frequency in radians /s
R = 1./(6*theta); %convert theta to Aniosotropy decay rate
g = 1./tau; %convert tau to intensity deacay rate

siz = length(a);
siz2 = length(r);
d=siz*siz2;
AA=zeros(siz,1);
BB=zeros(d,1);
CC=zeros(siz,1);
DD=zeros(d,1);


k=1;
%the loop below generates the complex sum based on the size of a (number of
%lifetimes) and r (number of rotations. see J. Fluoresc 1993 ,3(2) 103-16 

for i=1:siz
AA(i)= a(i)*w/(w^2 + g(i)^2);
CC(i) = a(i)*g(i)/(w^2 + g(i)^2);
for j=1:siz2
P = (g(i) + 6*R(j)); 
BB(k)= a(i)*w*sum(r(j)/(w^2 + P^2));
DD(k) = a(i)*sum(r(j)*P/(w^2 + P^2));
k= k+1;
end
end


A=sum(AA);
B=sum(BB);
C=sum(CC);
D=sum(DD);

Npar=(A + 2*B)/3;

Nperp = (A - B)/3;

Dpar = (C + 2*D)/3;

Dperp = (C - D)/3;

tan_phase = (Dpar*Nperp - Npar*Dperp)/(Npar*Nperp + Dpar*Dperp);

phase = atand(tan_phase);

mod = sqrt(Npar^2 +Dpar^2)/sqrt(Nperp^2 + Dperp^2) ;

amp=1./mod;

%m=(1+2*r)*(1 - r);
%tan_phase2 = 3*w*tau*r*6*R*tau/(m*(1 + w^2*tau^2) + (2 + r)*(6*R*tau) + (6*R*tau)^2)
%phase2 = atand(tan_phase2)
end

