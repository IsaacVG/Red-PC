clear all
close all
clc

cd ./PYTHON/

CSV_MERIDACANCUN = csvread('Distance_CancunMeridaSINIslaMUJERESyCOZUMEL_grupo.csv',0,1);

cd ..
%
nodes_MERIDACANCUN = unique([CSV_MERIDACANCUN(:,1);CSV_MERIDACANCUN(:,2)]);
n_MERIDACANCUN = length(nodes_MERIDACANCUN);
dist_MERIDACANCUN = zeros(n_MERIDACANCUN);

count = 1;

for i=1:n_MERIDACANCUN
    for j=i:n_MERIDACANCUN
        if i~=j
            dist_MERIDACANCUN(i,j) = CSV_MERIDACANCUN(count,7);
            count=count+1;
        end
    end
end
dist_MERIDACANCUN = dist_MERIDACANCUN + dist_MERIDACANCUN';

MERIDA = [20.9761 -89.63292];
CANCUN = [21.1214 -86.85588];

clear count i j;

save MAT_MERIDA