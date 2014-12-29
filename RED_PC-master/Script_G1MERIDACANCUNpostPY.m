clear all
close all
clc

cd ./PYTHON/

CSV_MERIDA = csvread('Distance_CancunMeridaSINIslaMUJERESyCOZUMEL_grupo.csv',0,1);

cd ..
%
nodes_MERIDA = unique([CSV_MERIDA(:,1);CSV_MERIDA(:,2)]);
n_MERIDA = length(nodes_MERIDA);
dist_MERIDA = zeros(n_MERIDA);

count = 1;

for i=1:n_MERIDA
    for j=i:n_MERIDA
        if i~=j
            dist_MERIDA(i,j) = CSV_MERIDA(count,7);
            count=count+1;
        end
    end
end
dist_MERIDA = dist_MERIDA + dist_MERIDA';

MERIDA = [20.9761 -89.63292];

clear count i j;

save MAT_MERIDA