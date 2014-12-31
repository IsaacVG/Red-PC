clear all
close all
clc

cd ./PYTHON/

CSV_OAXACA = csvread('Distance_OAXACA_grupo.csv',0,1);

cd ..
%
nodes_OAXACA = unique([CSV_OAXACA(:,1);CSV_OAXACA(:,2)]);
n_OAXACA = length(nodes_OAXACA);
dist_OAXACA = zeros(n_OAXACA);

count = 1;

for i=1:n_OAXACA
    for j=i:n_OAXACA
        if i~=j
            dist_OAXACA(i,j) = CSV_OAXACA(count,7);
            count=count+1;
        end
    end
end
dist_OAXACA = dist_OAXACA + dist_OAXACA';

OAXACA = [17.0813 -96.73564];

clear count i j;

save MAT_OAXACA