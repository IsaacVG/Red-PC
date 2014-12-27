clear all
close all
clc

cd ./PYTHON/

CSV_LEON = csvread('Distance_LEON_grupo.csv',0,1);

cd ..
%
nodes_LEON = unique([CSV_LEON(:,1);CSV_LEON(:,2)]);
n_LEON = length(nodes_LEON);
dist_LEON = zeros(n_LEON);

count = 1;

for i=1:n_LEON
    for j=i:n_LEON
        if i~=j
            dist_LEON(i,j) = CSV_LEON(count,7);
            count=count+1;
        end
    end
end
dist_LEON = dist_LEON + dist_LEON';

LEON = [21.12192 -101.66601];

clear count i j;

save MAT_LEON