clear all
close all
clc

cd ./PYTHON/

CSV_COLIMA = csvread('Distance_COLIMA_grupo.csv',0,1);

cd ..
%
nodes_COLIMA = unique([CSV_COLIMA(:,1);CSV_COLIMA(:,2)]);
n_COLIMA = length(nodes_COLIMA);
dist_COLIMA = zeros(n_COLIMA);

count = 1;

for i=1:n_COLIMA
    for j=i:n_COLIMA
        if i~=j
            dist_COLIMA(i,j) = CSV_COLIMA(count,7);
            count=count+1;
        end
    end
end
dist_COLIMA = dist_COLIMA + dist_COLIMA';

COLIMA = [19.2418 -103.72861];

clear count i j;

save MAT_COLIMA