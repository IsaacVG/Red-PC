clear all
close all
clc

cd ./PYTHON/

CSV_CdCARMEN = csvread('Distance_CdCARMEN_grupo.csv',0,1);

cd ..
%
nodes_CdCARMEN = unique([CSV_CdCARMEN(:,1);CSV_CdCARMEN(:,2)]);
n_CdCARMEN = length(nodes_CdCARMEN);
dist_CdCARMEN = zeros(n_CdCARMEN);

count = 1;

for i=1:n_CdCARMEN
    for j=i:n_CdCARMEN
        if i~=j
            dist_CdCARMEN(i,j) = CSV_CdCARMEN(count,7);
            count=count+1;
        end
    end
end
dist_CdCARMEN = dist_CdCARMEN + dist_CdCARMEN';

CdCARMEN = [18.65045 -91.7984];

clear count i j;

save MAT_CdCARMEN