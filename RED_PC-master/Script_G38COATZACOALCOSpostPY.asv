clear all
close all
clc

cd ./PYTHON/

CSV_COATZACOALCOS = csvread('Distance_COATZACOALCOS_grupo.csv',0,1);

cd ..
%
nodes_COATZACOALCOS = unique([CSV_COATZACOALCOS(:,1);CSV_COATZACOALCOS(:,2)]);
n_COATZACOALCOS = length(nodes_COATZACOALCOS);
dist_COATZACOALCOS = zeros(n_COATZACOALCOS);

count = 1;

for i=1:n_COATZACOALCOS
    for j=i:n_COATZACOALCOS
        if i~=j
            dist_COATZACOALCOS(i,j) = CSV_COATZACOALCOS(count,7);
            count=count+1;
        end
    end
end
dist_COATZACOALCOS = dist_COATZACOALCOS + dist_COATZACOALCOS';

COATZACOALCOS = [21.12192 -101.66601];

clear count i j;

save MAT_COATZACOALCOS