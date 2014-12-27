clear all
close all
clc

cd ./PYTHON/

CSV_PINOTEPA = csvread('Distance_PINOTEPA_grupo.csv',0,1);

cd ..
%
nodes_PINOTEPA = unique([CSV_PINOTEPA(:,1);CSV_PINOTEPA(:,2)]);
n_PINOTEPA = length(nodes_PINOTEPA);
dist_PINOTEPA = zeros(n_PINOTEPA);

count = 1;

for i=1:n_PINOTEPA
    for j=i:n_PINOTEPA
        if i~=j
            dist_PINOTEPA(i,j) = CSV_PINOTEPA(count,7);
            count=count+1;
        end
    end
end
dist_PINOTEPA = dist_PINOTEPA + dist_PINOTEPA';

PINOTEPA = [16.34353 -98.05992];

clear count i j;

save MAT_PINOTEPA