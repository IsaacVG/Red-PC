clear all
close all
clc

cd ./PYTHON/

CSV_CdVALLES = csvread('Distance_CdVALLES_grupo.csv',0,1);

cd ..
%
nodes_CdVALLES = unique([CSV_CdVALLES(:,1);CSV_CdVALLES(:,2)]);
n_CdVALLES = length(nodes_CdVALLES);
dist_CdVALLES = zeros(n_CdVALLES);

count = 1;

for i=1:n_CdVALLES
    for j=i:n_CdVALLES
        if i~=j
            dist_CdVALLES(i,j) = CSV_CdVALLES(count,7);
            count=count+1;
        end
    end
end
dist_CdVALLES = dist_CdVALLES + dist_CdVALLES';

CdVALLES = [21.98859 -99.0155];

clear count i j;

save MAT_CdVALLES