clear all
close all
clc

cd ./PYTHON/

CSV_ACAPULCO = csvread('Distance_ACAPULCO_grupo.csv',0,1);

cd ..
%
nodes_ACAPULCO = unique([CSV_ACAPULCO(:,1);CSV_ACAPULCO(:,2)]);
n_ACAPULCO = length(nodes_ACAPULCO);
dist_ACAPULCO = zeros(n_ACAPULCO);

count = 1;

for i=1:n_ACAPULCO
    for j=i:n_ACAPULCO
        if i~=j
            dist_ACAPULCO(i,j) = CSV_ACAPULCO(count,7);
            count=count+1;
        end
    end
end
dist_ACAPULCO = dist_ACAPULCO + dist_ACAPULCO';

ACAPULCO = [16.83546 -99.82789];

clear count i j;

save MAT_ACAPULCO