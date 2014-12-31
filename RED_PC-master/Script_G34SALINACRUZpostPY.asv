clear all
close all
clc

cd ./PYTHON/

CSV_SALINACRUZ = csvread('Distance_SALINACRUZ_grupo.csv',0,1);

cd ..
%
nodes_SALINACRUZ = unique([CSV_SALINACRUZ(:,1);CSV_SALINACRUZ(:,2)]);
n_SALINACRUZ = length(nodes_SALINACRUZ);
dist_SALINACRUZ = zeros(n_SALINACRUZ);

count = 1;

for i=1:n_SALINACRUZ
    for j=i:n_SALINACRUZ
        if i~=j
            dist_SALINACRUZ(i,j) = CSV_SALINACRUZ(count,7);
            count=count+1;
        end
    end
end
dist_SALINACRUZ = dist_SALINACRUZ + dist_SALINACRUZ';

SALINACRUZ = [16.19652 -95.19678];

clear count i j;

save MAT_SALINACRUZ