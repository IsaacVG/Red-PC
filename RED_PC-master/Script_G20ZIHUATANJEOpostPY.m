clear all
close all
clc

cd ./PYTHON/

CSV_ZIHUATANEJO = csvread('Distance_ZIHUATANEJO_grupo.csv',0,1);

cd ..
%
nodes_ZIHUATANEJO = unique([CSV_ZIHUATANEJO(:,1);CSV_ZIHUATANEJO(:,2)]);
n_ZIHUATANEJO = length(nodes_ZIHUATANEJO);
dist_ZIHUATANEJO = zeros(n_ZIHUATANEJO);

count = 1;

for i=1:n_ZIHUATANEJO
    for j=i:n_ZIHUATANEJO
        if i~=j
            dist_ZIHUATANEJO(i,j) = CSV_ZIHUATANEJO(count,7);
            count=count+1;
        end
    end
end
dist_ZIHUATANEJO = dist_ZIHUATANEJO + dist_ZIHUATANEJO';

ZIHUATANEJO = [17.64033 -101.55781];

clear count i j;

save MAT_ZIHUATANEJO