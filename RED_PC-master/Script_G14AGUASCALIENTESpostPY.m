clear all
close all
clc

cd ./PYTHON/

CSV_AGUASCALIENTES = csvread('Distance_AGUASCALIENTES_grupo.csv',0,1);

cd ..
%
nodes_AGUASCALIENTES = unique([CSV_AGUASCALIENTES(:,1);CSV_AGUASCALIENTES(:,2)]);
n_AGUASCALIENTES = length(nodes_AGUASCALIENTES);
dist_AGUASCALIENTES = zeros(n_AGUASCALIENTES);

count = 1;

for i=1:n_AGUASCALIENTES
    for j=i:n_AGUASCALIENTES
        if i~=j
            dist_AGUASCALIENTES(i,j) = CSV_AGUASCALIENTES(count,7);
            count=count+1;
        end
    end
end
dist_AGUASCALIENTES = dist_AGUASCALIENTES + dist_AGUASCALIENTES';

AGUASCALIENTES = [21.88319 -102.2913];

clear count i j;

save MAT_AGUASCALIENTES