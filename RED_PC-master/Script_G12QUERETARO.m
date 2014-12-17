QUERETARO = [20.61214 -100.40699];
QUERETARO_group = GROUPS_51(LAT==QUERETARO(1));
nodes_QUERETARO = IDS(GROUPS_51==QUERETARO_group);
Lat_QUERETARO = LAT(GROUPS_51==QUERETARO_group);
Lon_QUERETARO = LON(GROUPS_51==QUERETARO_group);
n_QUERETARO = length(nodes_QUERETARO);
output_QUERETARO = zeros(n_QUERETARO^2,7);

count=1;
aux = zeros(n_QUERETARO^2,1);

for i=1:n_QUERETARO
    for j=i:n_QUERETARO
        if i~=j
            output_QUERETARO(count, :) = ...
                [nodes_QUERETARO(i) nodes_QUERETARO(j)...
                Lat_QUERETARO(i) Lon_QUERETARO(i) ...
                Lat_QUERETARO(j) Lon_QUERETARO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_QUERETARO = output_QUERETARO(aux==1,:);
str = strcat('QUERETARO_grupo.csv');
csvwrite(str,output_QUERETARO);