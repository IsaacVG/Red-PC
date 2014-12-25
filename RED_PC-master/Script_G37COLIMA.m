COLIMA = [19.2418 -103.72861];
COLIMA_group = GROUPS_51(LAT==COLIMA(1));
nodes_COLIMA = IDS(GROUPS_51==COLIMA_group);
Lat_COLIMA = LAT(GROUPS_51==COLIMA_group);
Lon_COLIMA = LON(GROUPS_51==COLIMA_group);
n_COLIMA = length(nodes_COLIMA);
output_COLIMA = zeros(n_COLIMA^2,7);

count=1;
aux = zeros(n_COLIMA^2,1);

for i=1:n_COLIMA
    for j=i:n_COLIMA
        if i~=j
            output_COLIMA(count, :) = ...
                [nodes_COLIMA(i) nodes_COLIMA(j)...
                Lat_COLIMA(i) Lon_COLIMA(i) ...
                Lat_COLIMA(j) Lon_COLIMA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_COLIMA = output_COLIMA(aux==1,:);
str = strcat('COLIMA_grupo.csv');
csvwrite(str,output_COLIMA);