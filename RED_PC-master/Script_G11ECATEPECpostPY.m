clear all
close all
clc

cd ./PYTHON/

CSV_ECATEPEC = csvread('Distance_ECATEPEC_grupo.csv',0,1);

cd ..
%
nodes_ECATEPEC = unique([CSV_ECATEPEC(:,1);CSV_ECATEPEC(:,2)]);
n_ECATEPEC = length(nodes_ECATEPEC);
dist_ECATEPEC = zeros(n_ECATEPEC);

count = 1;

for i=1:n_ECATEPEC
    for j=i:n_ECATEPEC
        if i~=j
            dist_ECATEPEC(i,j) = CSV_ECATEPEC(count,7);
            count=count+1;
        end
    end
end
dist_ECATEPEC = dist_ECATEPEC + dist_ECATEPEC';

ECATEPEC = [19.57186 -99.03862];

clear count i j;

save MAT_ECATEPEC