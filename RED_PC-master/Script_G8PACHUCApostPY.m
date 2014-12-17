clear all
close all
clc

cd ./PYTHON/

CSV_PACHUCA = csvread('Distance_PACHUCA_grupo.csv',0,1);

cd ..
%
nodes_PACHUCA = unique([CSV_PACHUCA(:,1);CSV_PACHUCA(:,2)]);
n_PACHUCA = length(nodes_PACHUCA);
dist_PACHUCA = zeros(n_PACHUCA);

count = 1;

for i=1:n_PACHUCA
    for j=i:n_PACHUCA
        if i~=j
            dist_PACHUCA(i,j) = CSV_PACHUCA(count,7);
            count=count+1;
        end
    end
end
dist_PACHUCA = dist_PACHUCA + dist_PACHUCA';

PACHUCA = [20.08466 -98.76332];

clear count i j;

save MAT_PACHUCA