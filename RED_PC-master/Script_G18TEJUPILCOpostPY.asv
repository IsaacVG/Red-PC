clear all
close all
clc

cd ./PYTHON/

CSV_TAPACHULA = csvread('Distance_TAPACHULA_grupo.csv',0,1);

cd ..
%
nodes_TAPACHULA = unique([CSV_TAPACHULA(:,1);CSV_TAPACHULA(:,2)]);
n_TAPACHULA = length(nodes_TAPACHULA);
dist_TAPACHULA = zeros(n_TAPACHULA);

count = 1;

for i=1:n_TAPACHULA
    for j=i:n_TAPACHULA
        if i~=j
            dist_TAPACHULA(i,j) = CSV_TAPACHULA(count,7);
            count=count+1;
        end
    end
end
dist_TAPACHULA = dist_TAPACHULA + dist_TAPACHULA';

TAPACHULA = [14.91136 -92.27796];

clear count i j;

save MAT_TAPACHULA