TAPACHULA = [14.91136 -92.27796];
TAPACHULA_group = GROUPS_51(LAT==TAPACHULA(1));
nodes_TAPACHULA = IDS(GROUPS_51==TAPACHULA_group);
Lat_TAPACHULA = LAT(GROUPS_51==TAPACHULA_group);
Lon_TAPACHULA = LON(GROUPS_51==TAPACHULA_group);
n_TAPACHULA = length(nodes_TAPACHULA);
output_TAPACHULA = zeros(n_TAPACHULA^2,7);

count=1;
aux = zeros(n_TAPACHULA^2,1);

for i=1:n_TAPACHULA
    for j=i:n_TAPACHULA
        if i~=j
            output_TAPACHULA(count, :) = ...
                [nodes_TAPACHULA(i) nodes_TAPACHULA(j)...
                Lat_TAPACHULA(i) Lon_TAPACHULA(i) ...
                Lat_TAPACHULA(j) Lon_TAPACHULA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_TAPACHULA = output_TAPACHULA(aux==1,:);
str = strcat('TAPACHULA_grupo.csv');
csvwrite(str,output_TAPACHULA);