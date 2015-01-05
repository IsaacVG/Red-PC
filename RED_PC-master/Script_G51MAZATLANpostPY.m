clear all
close all
clc

cd ./PYTHON/

CSV_MAZATLAN = csvread('Distance_MAZATLAN_grupo.csv',0,1);

cd ..
%
nodes_MAZATLAN = unique([CSV_MAZATLAN(:,1);CSV_MAZATLAN(:,2)]);
n_MAZATLAN = length(nodes_MAZATLAN);
dist_MAZATLAN = zeros(n_MAZATLAN);

count = 1;

for i=1:n_MAZATLAN
    for j=i:n_MAZATLAN
        if i~=j
            dist_MAZATLAN(i,j) = CSV_MAZATLAN(count,7);
            count=count+1;
        end
    end
end
dist_MAZATLAN = dist_MAZATLAN + dist_MAZATLAN';

MAZATLAN = [23.24674 -106.42226];

clear count i j;

save MAT_MAZATLAN