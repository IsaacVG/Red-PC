clear all
close all
clc

cd ./PYTHON/

CSV_HUAJUAPAN = csvread('Distance_HUAJUAPAN_grupo.csv',0,1);

cd ..
%
nodes_HUAJUAPAN = unique([CSV_HUAJUAPAN(:,1);CSV_HUAJUAPAN(:,2)]);
n_HUAJUAPAN = length(nodes_HUAJUAPAN);
dist_HUAJUAPAN = zeros(n_HUAJUAPAN);

count = 1;

for i=1:n_HUAJUAPAN
    for j=i:n_HUAJUAPAN
        if i~=j
            dist_HUAJUAPAN(i,j) = CSV_HUAJUAPAN(count,7);
            count=count+1;
        end
    end
end
dist_HUAJUAPAN = dist_HUAJUAPAN + dist_HUAJUAPAN';

HUAJUAPAN = [17.8047 -97.7827];

clear count i j;

save MAT_HUAJUAPAN