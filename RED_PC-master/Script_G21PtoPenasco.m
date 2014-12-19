PtoPENASCO = [31.34217 -113.53448];
PtoPENASCO_group = GROUPS_51(LAT==PtoPENASCO(1));
nodes_PtoPENASCO = IDS(GROUPS_51==PtoPENASCO_group);
Lat_PtoPENASCO = LAT(GROUPS_51==PtoPENASCO_group);
Lon_PtoPENASCO = LON(GROUPS_51==PtoPENASCO_group);
n_PtoPENASCO = length(nodes_PtoPENASCO);
output_PtoPENASCO = zeros(n_PtoPENASCO^2,7);

count=1;
aux = zeros(n_PtoPENASCO^2,1);

for i=1:n_PtoPENASCO
    for j=i:n_PtoPENASCO
        if i~=j
            output_PtoPENASCO(count, :) = ...
                [nodes_PtoPENASCO(i) nodes_PtoPENASCO(j)...
                Lat_PtoPENASCO(i) Lon_PtoPENASCO(i) ...
                Lat_PtoPENASCO(j) Lon_PtoPENASCO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_PtoPENASCO = output_PtoPENASCO(aux==1,:);
str = strcat('PtoPENASCO_grupo.csv');
csvwrite(str,output_PtoPENASCO);