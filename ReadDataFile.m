% part of the Cruise Director API
% read data from fluorometer export file into a matrix
function [matrix] = ReadDataFile(fname)
disp(fname)
fid = fopen(fname);
matrix = zeros(20, 5);
fgetl(fid); % skip the first line
tline = fgetl(fid);
row_num = 1;
while tline(1) ~= 'E'
   row = strsplit(tline, ',');
   for i=1:5 % number of columns in fluorometer data file
       item = str2double(strip(row(i)));
       matrix(row_num,i) = item;
   end
   row_num = row_num + 1;
   tline = fgetl(fid);
end
fclose(fid);