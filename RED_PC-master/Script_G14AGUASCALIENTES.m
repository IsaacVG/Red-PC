AGUASCALIENTES = [21.88319 -102.2913];
AGUASCALIENTES_group = GROUPS_51(LAT==AGUASCALIENTES(1));
nodes_AGUASCALIENTES = IDS(GROUPS_51==AGUASCALIENTES_group);
Lat_AGUASCALIENTES = LAT(GROUPS_51==AGUASCALIENTES_group);
Lon_AGUASCALIENTES = LON(GROUPS_51==AGUASCALIENTES_group);
n_AGUASCALIENTES = length(nodes_AGUASCALIENTES);
output_AGUASCALIENTES = zeros(n_AGUASCALIENTES^2,7);

count=1;
aux = zeros(n_AGUASCALIENTES^2,1);

for i=1:n_AGUASCALIENTES
    for j=i:n_AGUASCALIENTES
        if i~=j
            output_AGUASCALIENTES(count, :) = ...
                [nodes_AGUASCALIENTES(i) nodes_AGUASCALIENTES(j)...
                Lat_AGUASCALIENTES(i) Lon_AGUASCALIENTES(i) ...
                Lat_AGUASCALIENTES(j) Lon_AGUASCALIENTES(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_AGUASCALIENTES = output_AGUASCALIENTES(aux==1,:);
str = strcat('AGUASCALIENTES_grupo.csv');
csvwrite(str,output_AGUASCALIENTES);