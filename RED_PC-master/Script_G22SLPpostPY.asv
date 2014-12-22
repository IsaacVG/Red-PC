clear all
close all
clc

cd ./PYTHON/

CSV_QUERETARO = csvread('Distance_QUERETARO_grupo.csv',0,1);

cd ..
%
nodes_QUERETARO = unique([CSV_QUERETARO(:,1);CSV_QUERETARO(:,2)]);
n_QUERETARO = length(nodes_QUERETARO);
dist_QUERETARO = zeros(n_QUERETARO);

count = 1;

for i=1:n_QUERETARO
    for j=i:n_QUERETARO
        if i~=j
            dist_QUERETARO(i,j) = CSV_QUERETARO(count,7);
            count=count+1;
        end
    end
end
dist_QUERETARO = dist_QUERETARO + dist_QUERETARO';

QUERETARO = [20.61214 -100.40699];

clear count i j;

save MAT_QUERETARO