clear all
close all
clc

cd ./PYTHON/

CSV_ZITACUARO = csvread('Distance_ZITACUARO_grupo.csv',0,1);

cd ..
%
nodes_ZITACUARO = unique([CSV_ZITACUARO(:,1);CSV_ZITACUARO(:,2)]);
n_ZITACUARO = length(nodes_ZITACUARO);
dist_ZITACUARO = zeros(n_ZITACUARO);

count = 1;

for i=1:n_ZITACUARO
    for j=i:n_ZITACUARO
        if i~=j
            dist_ZITACUARO(i,j) = CSV_ZITACUARO(count,7);
            count=count+1;
        end
    end
end
dist_ZITACUARO = dist_ZITACUARO + dist_ZITACUARO';

ZITACUARO = [19.43555 -100.35448];

clear count i j;

save MAT_ZITACUARO