clear all
close all
clc

cd ./PYTHON/

CSV_ZACATECAS = csvread('Distance_ZACATECAS_grupo.csv',0,1);

cd ..
%
nodes_ZACATECAS = unique([CSV_ZACATECAS(:,1);CSV_ZACATECAS(:,2)]);
n_ZACATECAS = length(nodes_ZACATECAS);
dist_ZACATECAS = zeros(n_ZACATECAS);

count = 1;

for i=1:n_ZACATECAS
    for j=i:n_ZACATECAS
        if i~=j
            dist_ZACATECAS(i,j) = CSV_ZACATECAS(count,7);
            count=count+1;
        end
    end
end
dist_ZACATECAS = dist_ZACATECAS + dist_ZACATECAS';

ZACATECAS = [22.76321 -102.58868];

clear count i j;

save MAT_ZACATECAS