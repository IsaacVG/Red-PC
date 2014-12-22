IZTAPALAPA = [19.34285 -99.05017];
IZTAPALAPA_group = GROUPS_51(LAT==IZTAPALAPA(1));
nodes_IZTAPALAPA = IDS(GROUPS_51==IZTAPALAPA_group);
Lat_IZTAPALAPA = LAT(GROUPS_51==IZTAPALAPA_group);
Lon_IZTAPALAPA = LON(GROUPS_51==IZTAPALAPA_group);
n_IZTAPALAPA = length(nodes_IZTAPALAPA);
output_IZTAPALAPA = zeros(n_IZTAPALAPA^2,7);

count=1;
aux = zeros(n_IZTAPALAPA^2,1);

for i=1:n_IZTAPALAPA
    for j=i:n_IZTAPALAPA
        if i~=j
            output_IZTAPALAPA(count, :) = ...
                [nodes_IZTAPALAPA(i) nodes_IZTAPALAPA(j)...
                Lat_IZTAPALAPA(i) Lon_IZTAPALAPA(i) ...
                Lat_IZTAPALAPA(j) Lon_IZTAPALAPA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_IZTAPALAPA = output_IZTAPALAPA(aux==1,:);
str = strcat('IZTAPALAPA_grupo.csv');
csvwrite(str,output_IZTAPALAPA);