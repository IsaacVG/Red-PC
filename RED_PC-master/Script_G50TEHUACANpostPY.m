clear all
close all
clc

cd ./PYTHON/

CSV_TEHUACAN = csvread('Distance_TEHUACAN_grupo.csv',0,1);

cd ..
%
nodes_TEHUACAN = unique([CSV_TEHUACAN(:,1);CSV_TEHUACAN(:,2)]);
n_TEHUACAN = length(nodes_TEHUACAN);
dist_TEHUACAN = zeros(n_TEHUACAN);

count = 1;

for i=1:n_TEHUACAN
    for j=i:n_TEHUACAN
        if i~=j
            dist_TEHUACAN(i,j) = CSV_TEHUACAN(count,7);
            count=count+1;
        end
    end
end
dist_TEHUACAN = dist_TEHUACAN + dist_TEHUACAN';

TEHUACAN = [18.461 -97.40762];

clear count i j;

save MAT_TEHUACAN