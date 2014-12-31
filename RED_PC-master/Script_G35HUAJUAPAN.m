HUAJUAPAN = [17.8047 -97.7827];
HUAJUAPAN_group = GROUPS_51(LAT==HUAJUAPAN(1));
nodes_HUAJUAPAN = IDS(GROUPS_51==HUAJUAPAN_group);
Lat_HUAJUAPAN = LAT(GROUPS_51==HUAJUAPAN_group);
Lon_HUAJUAPAN = LON(GROUPS_51==HUAJUAPAN_group);
n_HUAJUAPAN = length(nodes_HUAJUAPAN);
output_HUAJUAPAN = zeros(n_HUAJUAPAN^2,7);

count=1;
aux = zeros(n_HUAJUAPAN^2,1);

for i=1:n_HUAJUAPAN
    for j=i:n_HUAJUAPAN
        if i~=j
            output_HUAJUAPAN(count, :) = ...
                [nodes_HUAJUAPAN(i) nodes_HUAJUAPAN(j)...
                Lat_HUAJUAPAN(i) Lon_HUAJUAPAN(i) ...
                Lat_HUAJUAPAN(j) Lon_HUAJUAPAN(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_HUAJUAPAN = output_HUAJUAPAN(aux==1,:);
str = strcat('HUAJUAPAN_grupo.csv');
csvwrite(str,output_HUAJUAPAN);