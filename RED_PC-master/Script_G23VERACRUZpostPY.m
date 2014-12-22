clear all
close all
clc

cd ./PYTHON/

CSV_VERACRUZ = csvread('Distance_VERACRUZ_grupo.csv',0,1);

cd ..
%
nodes_VERACRUZ = unique([CSV_VERACRUZ(:,1);CSV_VERACRUZ(:,2)]);
n_VERACRUZ = length(nodes_VERACRUZ);
dist_VERACRUZ = zeros(n_VERACRUZ);

count = 1;

for i=1:n_VERACRUZ
    for j=i:n_VERACRUZ
        if i~=j
            dist_VERACRUZ(i,j) = CSV_VERACRUZ(count,7);
            count=count+1;
        end
    end
end
dist_VERACRUZ = dist_VERACRUZ + dist_VERACRUZ';

VERACRUZ = [19.1411 -96.1176];

clear count i j;

save MAT_VERACRUZ