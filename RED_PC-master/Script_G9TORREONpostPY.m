clear all
close all
clc

cd ./PYTHON/

CSV_TORREON = csvread('Distance_TORREON_grupo.csv',0,1);

cd ..
%
nodes_TORREON = unique([CSV_TORREON(:,1);CSV_TORREON(:,2)]);
n_TORREON = length(nodes_TORREON);
dist_TORREON = zeros(n_TORREON);

count = 1;

for i=1:n_TORREON
    for j=i:n_TORREON
        if i~=j
            dist_TORREON(i,j) = CSV_TORREON(count,7);
            count=count+1;
        end
    end
end
dist_TORREON = dist_TORREON + dist_TORREON';

TORREON = [25.54861 -103.40192];

clear count i j;

save MAT_TORREON