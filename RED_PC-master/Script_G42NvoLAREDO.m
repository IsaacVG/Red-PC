NvoLAREDO = [27.45226 -99.54459];
NvoLAREDO_group = GROUPS_51(LAT==NvoLAREDO(1));
nodes_NvoLAREDO = IDS(GROUPS_51==NvoLAREDO_group);
Lat_NvoLAREDO = LAT(GROUPS_51==NvoLAREDO_group);
Lon_NvoLAREDO = LON(GROUPS_51==NvoLAREDO_group);
n_NvoLAREDO = length(nodes_NvoLAREDO);
output_NvoLAREDO = zeros(n_NvoLAREDO^2,7);

count=1;
aux = zeros(n_NvoLAREDO^2,1);

for i=1:n_NvoLAREDO
    for j=i:n_NvoLAREDO
        if i~=j
            output_NvoLAREDO(count, :) = ...
                [nodes_NvoLAREDO(i) nodes_NvoLAREDO(j)...
                Lat_NvoLAREDO(i) Lon_NvoLAREDO(i) ...
                Lat_NvoLAREDO(j) Lon_NvoLAREDO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_NvoLAREDO = output_NvoLAREDO(aux==1,:);
str = strcat('NvoLAREDO_grupo.csv');
csvwrite(str,output_NvoLAREDO);