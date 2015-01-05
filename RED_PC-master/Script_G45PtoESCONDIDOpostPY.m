clear all
close all
clc

cd ./PYTHON/

CSV_PtoESCONDIDO = csvread('Distance_PtoESCONDIDO_grupo.csv',0,1);

cd ..
%
nodes_PtoESCONDIDO = unique([CSV_PtoESCONDIDO(:,1);CSV_PtoESCONDIDO(:,2)]);
n_PtoESCONDIDO = length(nodes_PtoESCONDIDO);
dist_PtoESCONDIDO = zeros(n_PtoESCONDIDO);

count = 1;

for i=1:n_PtoESCONDIDO
    for j=i:n_PtoESCONDIDO
        if i~=j
            dist_PtoESCONDIDO(i,j) = CSV_PtoESCONDIDO(count,7);
            count=count+1;
        end
    end
end
dist_PtoESCONDIDO = dist_PtoESCONDIDO + dist_PtoESCONDIDO';

PtoESCONDIDO = [15.87493 -97.07704];

clear count i j;

save MAT_PtoESCONDIDO