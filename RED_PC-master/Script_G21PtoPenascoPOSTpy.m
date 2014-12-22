clear all
close all
clc

cd ./PYTHON/

CSV_PtoPENASCO = csvread('Distance_PtoPENASCO_grupo.csv',0,1);

cd ..
%
nodes_PtoPENASCO = unique([CSV_PtoPENASCO(:,1);CSV_PtoPENASCO(:,2)]);
n_PtoPENASCO = length(nodes_PtoPENASCO);
dist_PtoPENASCO = zeros(n_PtoPENASCO);

count = 1;

for i=1:n_PtoPENASCO
    for j=i:n_PtoPENASCO
        if i~=j
            dist_PtoPENASCO(i,j) = CSV_PtoPENASCO(count,7);
            count=count+1;
        end
    end
end
dist_PtoPENASCO = dist_PtoPENASCO + dist_PtoPENASCO';

PtoPENASCO = [31.34217 -113.53448];

clear count i j;

save MAT_PtoPENASCO