clear all
close all
clc

cd ./PYTHON/

CSV_IXMIQUILPAN = csvread('Distance_IXMIQUILPAN_grupo.csv',0,1);

cd ..
%
nodes_IXMIQUILPAN = unique([CSV_IXMIQUILPAN(:,1);CSV_IXMIQUILPAN(:,2)]);
n_IXMIQUILPAN = length(nodes_IXMIQUILPAN);
dist_IXMIQUILPAN = zeros(n_IXMIQUILPAN);

count = 1;

for i=1:n_IXMIQUILPAN
    for j=i:n_IXMIQUILPAN
        if i~=j
            dist_IXMIQUILPAN(i,j) = CSV_IXMIQUILPAN(count,7);
            count=count+1;
        end
    end
end
dist_IXMIQUILPAN = dist_IXMIQUILPAN + dist_IXMIQUILPAN';

IXMIQUILPAN = [20.49026 -99.2231];

clear count i j;

save MAT_IXMIQUILPAN