IXMIQUILPAN = [20.49026 -99.2231];
IXMIQUILPAN_group = GROUPS_51(LAT==IXMIQUILPAN(1));
nodes_IXMIQUILPAN = IDS(GROUPS_51==IXMIQUILPAN_group);
Lat_IXMIQUILPAN = LAT(GROUPS_51==IXMIQUILPAN_group);
Lon_IXMIQUILPAN = LON(GROUPS_51==IXMIQUILPAN_group);
n_IXMIQUILPAN = length(nodes_IXMIQUILPAN);
output_IXMIQUILPAN = zeros(n_IXMIQUILPAN^2,7);

count=1;
aux = zeros(n_IXMIQUILPAN^2,1);

for i=1:n_IXMIQUILPAN
    for j=i:n_IXMIQUILPAN
        if i~=j
            output_IXMIQUILPAN(count, :) = ...
                [nodes_IXMIQUILPAN(i) nodes_IXMIQUILPAN(j)...
                Lat_IXMIQUILPAN(i) Lon_IXMIQUILPAN(i) ...
                Lat_IXMIQUILPAN(j) Lon_IXMIQUILPAN(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_IXMIQUILPAN = output_IXMIQUILPAN(aux==1,:);
str = strcat('IXMIQUILPAN_grupo.csv');
csvwrite(str,output_IXMIQUILPAN);