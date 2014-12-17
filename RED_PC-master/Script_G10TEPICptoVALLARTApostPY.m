clear all
close all
clc

cd ./PYTHON/

CSV_TEPIC = csvread('Distance_TEPIC_grupo.csv',0,1);

cd ..
%
nodes_TEPIC = unique([CSV_TEPIC(:,1);CSV_TEPIC(:,2)]);
n_TEPIC = length(nodes_TEPIC);
dist_TEPIC = zeros(n_TEPIC);

count = 1;

for i=1:n_TEPIC
    for j=i:n_TEPIC
        if i~=j
            dist_TEPIC(i,j) = CSV_TEPIC(count,7);
            count=count+1;
        end
    end
end
dist_TEPIC = dist_TEPIC + dist_TEPIC';

TEPIC = [21.50099 -104.87697];
PtoVALLARTA = [20.64086 -105.22452];

clear count i j;

save MAT_TEPIC