clear all
close all
clc

cd ./PYTHON/

CSV_TEJUPILCO = csvread('Distance_TEJUPILCO_grupo.csv',0,1);

cd ..
%
nodes_TEJUPILCO = unique([CSV_TEJUPILCO(:,1);CSV_TEJUPILCO(:,2)]);
n_TEJUPILCO = length(nodes_TEJUPILCO);
dist_TEJUPILCO = zeros(n_TEJUPILCO);

count = 1;

for i=1:n_TEJUPILCO
    for j=i:n_TEJUPILCO
        if i~=j
            dist_TEJUPILCO(i,j) = CSV_TEJUPILCO(count,7);
            count=count+1;
        end
    end
end
dist_TEJUPILCO = dist_TEJUPILCO + dist_TEJUPILCO';

TEJUPILCO = [18.90587 -100.14913];

clear count i j;

save MAT_TEJUPILCO