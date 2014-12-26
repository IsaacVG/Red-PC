ZACATECAS = [22.76321 -102.58868];
ZACATECAS_group = GROUPS_51(LAT==ZACATECAS(1));
nodes_ZACATECAS = IDS(GROUPS_51==ZACATECAS_group);
Lat_ZACATECAS = LAT(GROUPS_51==ZACATECAS_group);
Lon_ZACATECAS = LON(GROUPS_51==ZACATECAS_group);
n_ZACATECAS = length(nodes_ZACATECAS);
output_ZACATECAS = zeros(n_ZACATECAS^2,7);

count=1;
aux = zeros(n_ZACATECAS^2,1);

for i=1:n_ZACATECAS
    for j=i:n_ZACATECAS
        if i~=j
            output_ZACATECAS(count, :) = ...
                [nodes_ZACATECAS(i) nodes_ZACATECAS(j)...
                Lat_ZACATECAS(i) Lon_ZACATECAS(i) ...
                Lat_ZACATECAS(j) Lon_ZACATECAS(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_ZACATECAS = output_ZACATECAS(aux==1,:);
str = strcat('ZACATECAS_grupo.csv');
csvwrite(str,output_ZACATECAS);