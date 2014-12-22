clear all
close all
clc

cd ./PYTHON/

CSV_SLP = csvread('Distance_SLP_grupo.csv',0,1);

cd ..
%
nodes_SLP = unique([CSV_SLP(:,1);CSV_SLP(:,2)]);
n_SLP = length(nodes_SLP);
dist_SLP = zeros(n_SLP);

count = 1;

for i=1:n_SLP
    for j=i:n_SLP
        if i~=j
            dist_SLP(i,j) = CSV_SLP(count,7);
            count=count+1;
        end
    end
end
dist_SLP = dist_SLP + dist_SLP';

SLP = [22.12398 -100.95106];

clear count i j;

save MAT_SLP