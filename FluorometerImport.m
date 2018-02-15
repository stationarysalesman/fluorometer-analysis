% part of the Cruise Director API
% FluorometeImport.m - import lifetime/anisotropy decay data from ASCII
% files
function [data] = FluorometerImport(dir)
stem = 'ls -m ';
arg = [stem dir];
[status, cmdout] = system(arg);
if status ~= 0
    disp('your directory is bad and you should feel bad!')
    return
end

flist = strsplit(cmdout, ',');
len = length(flist);
data = zeros(len, 20, 5);
for i = 1:len
    fname = strip(flist(i));
    path = char(fullfile(dir,fname));
    %data(i,:,:) = ReadDataFile(path);
    matrix = ReadDataFile('/Users/tyler/Downloads/2-12-18/E3_S1_AD.txt');
end


 