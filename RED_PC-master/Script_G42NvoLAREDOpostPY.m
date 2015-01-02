clear all
close all
clc

cd ./PYTHON/

CSV_NvoLAREDO = csvread('Distance_NvoLAREDO_grupo.csv',0,1);

cd ..
%
nodes_NvoLAREDO = unique([CSV_NvoLAREDO(:,1);CSV_NvoLAREDO(:,2)]);
n_NvoLAREDO = length(nodes_NvoLAREDO);
dist_NvoLAREDO = zeros(n_NvoLAREDO);

count = 1;

for i=1:n_NvoLAREDO
    for j=i:n_NvoLAREDO
        if i~=j
            dist_NvoLAREDO(i,j) = CSV_NvoLAREDO(count,7);
            count=count+1;
        end
    end
end
dist_NvoLAREDO = dist_NvoLAREDO + dist_NvoLAREDO';

NvoLAREDO = [27.45226 -99.54459];

clear count i j;

save MAT_NvoLAREDO