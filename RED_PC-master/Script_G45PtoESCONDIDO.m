PtoESCONDIDO = [15.87493 -97.07704];
PtoESCONDIDO_group = GROUPS_51(LAT==PtoESCONDIDO(1));
nodes_PtoESCONDIDO = IDS(GROUPS_51==PtoESCONDIDO_group);
Lat_PtoESCONDIDO = LAT(GROUPS_51==PtoESCONDIDO_group);
Lon_PtoESCONDIDO = LON(GROUPS_51==PtoESCONDIDO_group);
n_PtoESCONDIDO = length(nodes_PtoESCONDIDO);
output_PtoESCONDIDO = zeros(n_PtoESCONDIDO^2,7);

count=1;
aux = zeros(n_PtoESCONDIDO^2,1);

for i=1:n_PtoESCONDIDO
    for j=i:n_PtoESCONDIDO
        if i~=j
            output_PtoESCONDIDO(count, :) = ...
                [nodes_PtoESCONDIDO(i) nodes_PtoESCONDIDO(j)...
                Lat_PtoESCONDIDO(i) Lon_PtoESCONDIDO(i) ...
                Lat_PtoESCONDIDO(j) Lon_PtoESCONDIDO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_PtoESCONDIDO = output_PtoESCONDIDO(aux==1,:);
str = strcat('PtoESCONDIDO_grupo.csv');
csvwrite(str,output_PtoESCONDIDO);