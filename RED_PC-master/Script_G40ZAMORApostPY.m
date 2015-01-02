clear all
close all
clc

cd ./PYTHON/

CSV_ZAMORA = csvread('Distance_ZAMORA_grupo.csv',0,1);

cd ..
%
nodes_ZAMORA = unique([CSV_ZAMORA(:,1);CSV_ZAMORA(:,2)]);
n_ZAMORA = length(nodes_ZAMORA);
dist_ZAMORA = zeros(n_ZAMORA);

count = 1;

for i=1:n_ZAMORA
    for j=i:n_ZAMORA
        if i~=j
            dist_ZAMORA(i,j) = CSV_ZAMORA(count,7);
            count=count+1;
        end
    end
end
dist_ZAMORA = dist_ZAMORA + dist_ZAMORA';

ZAMORA = [19.99255 -102.28609];

clear count i j;

save MAT_ZAMORA