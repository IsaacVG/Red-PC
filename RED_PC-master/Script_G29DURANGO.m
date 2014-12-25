DURANGO = [24.02273 -104.64828];
DURANGO_group = GROUPS_51(LAT==DURANGO(1));
nodes_DURANGO = IDS(GROUPS_51==DURANGO_group);
Lat_DURANGO = LAT(GROUPS_51==DURANGO_group);
Lon_DURANGO = LON(GROUPS_51==DURANGO_group);
n_DURANGO = length(nodes_DURANGO);
output_DURANGO = zeros(n_DURANGO^2,7);

count=1;
aux = zeros(n_DURANGO^2,1);

for i=1:n_DURANGO
    for j=i:n_DURANGO
        if i~=j
            output_DURANGO(count, :) = ...
                [nodes_DURANGO(i) nodes_DURANGO(j)...
                Lat_DURANGO(i) Lon_DURANGO(i) ...
                Lat_DURANGO(j) Lon_DURANGO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_DURANGO = output_DURANGO(aux==1,:);
str = strcat('DURANGO_grupo.csv');
csvwrite(str,output_DURANGO);