clear all
close all
clc

cd ./PYTHON/

CSV_APATZINGAN = csvread('Distance_APATZINGAN_grupo.csv',0,1);

cd ..
%
nodes_APATZINGAN = unique([CSV_APATZINGAN(:,1);CSV_APATZINGAN(:,2)]);
n_APATZINGAN = length(nodes_APATZINGAN);
dist_APATZINGAN = zeros(n_APATZINGAN);

count = 1;

for i=1:n_APATZINGAN
    for j=i:n_APATZINGAN
        if i~=j
            dist_APATZINGAN(i,j) = CSV_APATZINGAN(count,7);
            count=count+1;
        end
    end
end
dist_APATZINGAN = dist_APATZINGAN + dist_APATZINGAN';

APATZINGAN = [19.08895 -102.34886];

clear count i j;

save MAT_APATZINGAN