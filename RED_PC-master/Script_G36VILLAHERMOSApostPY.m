clear all
close all
clc

cd ./PYTHON/

CSV_VILLAHERMOSA = csvread('Distance_VILLAHERMOSA_grupo.csv',0,1);

cd ..
%
nodes_VILLAHERMOSA = unique([CSV_VILLAHERMOSA(:,1);CSV_VILLAHERMOSA(:,2)]);
n_VILLAHERMOSA = length(nodes_VILLAHERMOSA);
dist_VILLAHERMOSA = zeros(n_VILLAHERMOSA);

count = 1;

for i=1:n_VILLAHERMOSA
    for j=i:n_VILLAHERMOSA
        if i~=j
            dist_VILLAHERMOSA(i,j) = CSV_VILLAHERMOSA(count,7);
            count=count+1;
        end
    end
end
dist_VILLAHERMOSA = dist_VILLAHERMOSA + dist_VILLAHERMOSA';

VILLAHERMOSA = [17.99253 -92.95312];

clear count i j;

save MAT_VILLAHERMOSA