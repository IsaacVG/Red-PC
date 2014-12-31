clear all
close all
clc

cd ./PYTHON/

CSV_DURANGO = csvread('Distance_DURANGO_grupo.csv',0,1);

cd ..
%
nodes_DURANGO = unique([CSV_DURANGO(:,1);CSV_DURANGO(:,2)]);
n_DURANGO = length(nodes_DURANGO);
dist_DURANGO = zeros(n_DURANGO);

count = 1;

for i=1:n_DURANGO
    for j=i:n_DURANGO
        if i~=j
            dist_DURANGO(i,j) = CSV_DURANGO(count,7);
            count=count+1;
        end
    end
end
dist_DURANGO = dist_DURANGO + dist_DURANGO';

DURANGO = [24.02273 -104.64828];

clear count i j;

save MAT_DURANGO