clear all
close all
clc

cd ./PYTHON/

CSV_GUADALAJARA = csvread('Distance_GUADALAJARA_grupo.csv',0,1);

cd ..
%
nodes_GUADALAJARA = unique([CSV_GUADALAJARA(:,1);CSV_GUADALAJARA(:,2)]);
n_GUADALAJARA = length(nodes_GUADALAJARA);
dist_GUADALAJARA = zeros(n_GUADALAJARA);

count = 1;

for i=1:n_GUADALAJARA
    for j=i:n_GUADALAJARA
        if i~=j
            dist_GUADALAJARA(i,j) = CSV_GUADALAJARA(count,7);
            count=count+1;
        end
    end
end
dist_GUADALAJARA = dist_GUADALAJARA + dist_GUADALAJARA';

GUADALAJARA = [20.67379 -103.33541];

clear count i j;

save MAT_GUADALAJARA