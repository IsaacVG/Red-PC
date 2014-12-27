clear all
close all
clc

cd ./PYTHON/

CSV_IZTAPALAPA = csvread('Distance_IZTAPALAPA_grupo.csv',0,1);

cd ..
%
nodes_IZTAPALAPA = unique([CSV_IZTAPALAPA(:,1);CSV_IZTAPALAPA(:,2)]);
n_IZTAPALAPA = length(nodes_IZTAPALAPA);
dist_IZTAPALAPA = zeros(n_IZTAPALAPA);

count = 1;

for i=1:n_IZTAPALAPA
    for j=i:n_IZTAPALAPA
        if i~=j
            dist_IZTAPALAPA(i,j) = CSV_IZTAPALAPA(count,7);
            count=count+1;
        end
    end
end
dist_IZTAPALAPA = dist_IZTAPALAPA + dist_IZTAPALAPA';

IZTAPALAPA = [19.34285 -99.05017];

clear count i j;

save MAT_IZTAPALAPA