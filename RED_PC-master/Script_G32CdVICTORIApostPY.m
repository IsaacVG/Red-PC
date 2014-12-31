clear all
close all
clc

cd ./PYTHON/

CSV_CdVICTORIA = csvread('Distance_CdVICTORIA_grupo.csv',0,1);

cd ..
%
nodes_CdVICTORIA = unique([CSV_CdVICTORIA(:,1);CSV_CdVICTORIA(:,2)]);
n_CdVICTORIA = length(nodes_CdVICTORIA);
dist_CdVICTORIA = zeros(n_CdVICTORIA);

count = 1;

for i=1:n_CdVICTORIA
    for j=i:n_CdVICTORIA
        if i~=j
            dist_CdVICTORIA(i,j) = CSV_CdVICTORIA(count,7);
            count=count+1;
        end
    end
end
dist_CdVICTORIA = dist_CdVICTORIA + dist_CdVICTORIA';

CdVICTORIA = [23.741 -99.14332];

clear count i j;

save MAT_CdVICTORIA