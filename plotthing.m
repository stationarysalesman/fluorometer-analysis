% Generate a list of filenames
%{
stem = 'ls -m ';
dir = '/Users/tyler/Downloads/2-12-18/';
arg = [stem dir];
[status, cmdout] = system(arg);
if status ~= 0
    disp('your directory is bad and you should feel bad!')
    return
end
flist = strsplit(cmdout, ',');
len = length(flist);
fname_list = zeros(len);
%}
%for i = 1:len
tmp = strip(flist(i));
fname = char(fullfile(dir,tmp));

matrix1 = ReadDataFile('/Users/tyler/Downloads/2-12-18/D1_S1_AD.txt');
matrix2 = ReadDataFile('/Users/tyler/Downloads/2-12-18/D1_S2_AD.txt');
matrix3 = ReadDataFile('/Users/tyler/Downloads/2-12-18/D1_S3_AD.txt');
matrix4 = ReadDataFile('/Users/tyler/Downloads/2-12-18/E3_S1_AD.txt');
matrix5 = ReadDataFile('/Users/tyler/Downloads/2-12-18/E3_S1_AD.txt');
matrix6 = ReadDataFile('/Users/tyler/Downloads/2-12-18/E3_S1_AD.txt');

rtot = 0.18; % define total anisotropy
lowerlim = 75e3;
upperlim = 30e6;
step = (upperlim - lowerlim) / 50;
f = lowerlim:step:upperlim;
par = [.06 100e-9 7e-9];
a = [.114 .0321];
tau = [857e-9 72.1e-9];
fminsearch(@fit_phase,par);

%end



return

function [] = dothething(matrix, v1, v2)
    a = v1;
    tau = v2;
    p = [0.06 100e-9 8e-9];
    fminsearch(@fit_phase,p)
return
