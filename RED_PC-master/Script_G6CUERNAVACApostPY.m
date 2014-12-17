clear all
close all
clc

cd ./PYTHON/

CSV_CUERNAVACA = csvread('Distance_CUERNAVACA_grupo.csv',0,1);

cd ..
%
nodes_CUERNAVACA = unique([CSV_CUERNAVACA(:,1);CSV_CUERNAVACA(:,2)]);
n_CUERNAVACA = length(nodes_CUERNAVACA);
dist_CUERNAVACA = zeros(n_CUERNAVACA);

count = 1;

for i=1:n_CUERNAVACA
    for j=i:n_CUERNAVACA
        if i~=j
            dist_CUERNAVACA(i,j) = CSV_CUERNAVACA(count,7);
            count=count+1;
        end
    end
end
dist_CUERNAVACA = dist_CUERNAVACA + dist_CUERNAVACA';

CUERNAVACA = [18.93188 -99.24057];

clear count i j;

save MAT_CUERNAVACA