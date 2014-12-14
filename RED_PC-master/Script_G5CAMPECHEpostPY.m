clear all
close all
clc

cd ./PYTHON/

CSV_CAMPECHE = csvread('Distance_CAMPECHE_grupo.csv',0,1);

cd ..
%
nodes_CAMPECHE = unique([CSV_CAMPECHE(:,1);CSV_CAMPECHE(:,2)]);
n_CAMPECHE = length(nodes_CAMPECHE);
dist_CAMPECHE = zeros(n_CAMPECHE);

count = 1;

for i=1:n_CAMPECHE
    for j=i:n_CAMPECHE
        if i~=j
            dist_CAMPECHE(i,j) = CSV_CAMPECHE(count,7);
            count=count+1;
        end
    end
end
dist_CAMPECHE = dist_CAMPECHE + dist_CAMPECHE';

CAMPECHE = [24.80522 -107.42297];

clear count i j;

save MAT_CAMPECHE