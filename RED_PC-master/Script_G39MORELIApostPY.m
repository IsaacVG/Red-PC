clear all
close all
clc

cd ./PYTHON/

CSV_MORELIA = csvread('Distance_MORELIA_grupo.csv',0,1);

cd ..
%
nodes_MORELIA = unique([CSV_MORELIA(:,1);CSV_MORELIA(:,2)]);
n_MORELIA = length(nodes_MORELIA);
dist_MORELIA = zeros(n_MORELIA);

count = 1;

for i=1:n_MORELIA
    for j=i:n_MORELIA
        if i~=j
            dist_MORELIA(i,j) = CSV_MORELIA(count,7);
            count=count+1;
        end
    end
end
dist_MORELIA = dist_MORELIA + dist_MORELIA';

MORELIA = [19.70365 -101.20612];

clear count i j;

save MAT_MORELIA