TEPIC = [21.50099 -104.87697];
TEPIC_group = GROUPS_51(LAT==TEPIC(1));
nodes_TEPIC = IDS(GROUPS_51==TEPIC_group);
Lat_TEPIC = LAT(GROUPS_51==TEPIC_group);
Lon_TEPIC = LON(GROUPS_51==TEPIC_group);
n_TEPIC = length(nodes_TEPIC);
output_TEPIC = zeros(n_TEPIC^2,7);

count=1;
aux = zeros(n_TEPIC^2,1);

for i=1:n_TEPIC
    for j=i:n_TEPIC
        if i~=j
            output_TEPIC(count, :) = ...
                [nodes_TEPIC(i) nodes_TEPIC(j)...
                Lat_TEPIC(i) Lon_TEPIC(i) ...
                Lat_TEPIC(j) Lon_TEPIC(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_TEPIC = output_TEPIC(aux==1,:);
str = strcat('TEPIC_grupo.csv');
csvwrite(str,output_TEPIC);