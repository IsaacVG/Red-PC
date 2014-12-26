MAZATLAN = [23.24674 -106.42226];
MAZATLAN_group = GROUPS_51(LAT==MAZATLAN(1));
nodes_MAZATLAN = IDS(GROUPS_51==MAZATLAN_group);
Lat_MAZATLAN = LAT(GROUPS_51==MAZATLAN_group);
Lon_MAZATLAN = LON(GROUPS_51==MAZATLAN_group);
n_MAZATLAN = length(nodes_MAZATLAN);
output_MAZATLAN = zeros(n_MAZATLAN^2,7);

count=1;
aux = zeros(n_MAZATLAN^2,1);

for i=1:n_MAZATLAN
    for j=i:n_MAZATLAN
        if i~=j
            output_MAZATLAN(count, :) = ...
                [nodes_MAZATLAN(i) nodes_MAZATLAN(j)...
                Lat_MAZATLAN(i) Lon_MAZATLAN(i) ...
                Lat_MAZATLAN(j) Lon_MAZATLAN(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_MAZATLAN = output_MAZATLAN(aux==1,:);
str = strcat('MAZATLAN_grupo.csv');
csvwrite(str,output_MAZATLAN);