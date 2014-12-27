clear all
close all
clc

cd ./PYTHON/

CSV_TOLUCA = csvread('Distance_TOLUCA_grupo.csv',0,1);

cd ..
%
nodes_TOLUCA = unique([CSV_TOLUCA(:,1);CSV_TOLUCA(:,2)]);
n_TOLUCA = length(nodes_TOLUCA);
dist_TOLUCA = zeros(n_TOLUCA);

count = 1;

for i=1:n_TOLUCA
    for j=i:n_TOLUCA
        if i~=j
            dist_TOLUCA(i,j) = CSV_TOLUCA(count,7);
            count=count+1;
        end
    end
end
dist_TOLUCA = dist_TOLUCA + dist_TOLUCA';

TOLUCA = [19.29411 -99.63121];

clear count i j;

save MAT_TOLUCA