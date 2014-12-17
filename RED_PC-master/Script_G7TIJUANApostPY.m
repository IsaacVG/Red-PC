clear all
close all
clc

cd ./PYTHON/

CSV_TIJUANA = csvread('Distance_TIJUANA_grupo.csv',0,1);

cd ..
%
nodes_TIJUANA = unique([CSV_TIJUANA(:,1);CSV_TIJUANA(:,2)]);
n_TIJUANA = length(nodes_TIJUANA);
dist_TIJUANA = zeros(n_TIJUANA);

count = 1;

for i=1:n_TIJUANA
    for j=i:n_TIJUANA
        if i~=j
            dist_TIJUANA(i,j) = CSV_TIJUANA(count,7);
            count=count+1;
        end
    end
end
dist_TIJUANA = dist_TIJUANA + dist_TIJUANA';

TIJUANA = [32.49661 -116.97262];

clear count i j;

save MAT_TIJUANA