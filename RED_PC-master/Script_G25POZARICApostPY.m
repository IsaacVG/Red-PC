clear all
close all
clc

cd ./PYTHON/

CSV_POZARICA = csvread('Distance_POZARICA_grupo.csv',0,1);

cd ..
%
nodes_POZARICA = unique([CSV_POZARICA(:,1);CSV_POZARICA(:,2)]);
n_POZARICA = length(nodes_POZARICA);
dist_POZARICA = zeros(n_POZARICA);

count = 1;

for i=1:n_POZARICA
    for j=i:n_POZARICA
        if i~=j
            dist_POZARICA(i,j) = CSV_POZARICA(count,7);
            count=count+1;
        end
    end
end
dist_POZARICA = dist_POZARICA + dist_POZARICA';

POZARICA = [20.53432 -97.44458];

clear count i j;

save MAT_POZARICA