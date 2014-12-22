VERACRUZ = [19.1411 -96.1176];
VERACRUZ_group = GROUPS_51(LAT==VERACRUZ(1));
nodes_VERACRUZ = IDS(GROUPS_51==VERACRUZ_group);
Lat_VERACRUZ = LAT(GROUPS_51==VERACRUZ_group);
Lon_VERACRUZ = LON(GROUPS_51==VERACRUZ_group);
n_VERACRUZ = length(nodes_VERACRUZ);
output_VERACRUZ = zeros(n_VERACRUZ^2,7);

count=1;
aux = zeros(n_VERACRUZ^2,1);

for i=1:n_VERACRUZ
    for j=i:n_VERACRUZ
        if i~=j
            output_VERACRUZ(count, :) = ...
                [nodes_VERACRUZ(i) nodes_VERACRUZ(j)...
                Lat_VERACRUZ(i) Lon_VERACRUZ(i) ...
                Lat_VERACRUZ(j) Lon_VERACRUZ(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_VERACRUZ = output_VERACRUZ(aux==1,:);
str = strcat('VERACRUZ_grupo.csv');
csvwrite(str,output_VERACRUZ);