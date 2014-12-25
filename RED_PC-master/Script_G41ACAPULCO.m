ACAPULCO = [16.83546 -99.82789];
ACAPULCO_group = GROUPS_51(LAT==ACAPULCO(1));
nodes_ACAPULCO = IDS(GROUPS_51==ACAPULCO_group);
Lat_ACAPULCO = LAT(GROUPS_51==ACAPULCO_group);
Lon_ACAPULCO = LON(GROUPS_51==ACAPULCO_group);
n_ACAPULCO = length(nodes_ACAPULCO);
output_ACAPULCO = zeros(n_ACAPULCO^2,7);

count=1;
aux = zeros(n_ACAPULCO^2,1);

for i=1:n_ACAPULCO
    for j=i:n_ACAPULCO
        if i~=j
            output_ACAPULCO(count, :) = ...
                [nodes_ACAPULCO(i) nodes_ACAPULCO(j)...
                Lat_ACAPULCO(i) Lon_ACAPULCO(i) ...
                Lat_ACAPULCO(j) Lon_ACAPULCO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_ACAPULCO = output_ACAPULCO(aux==1,:);
str = strcat('ACAPULCO_grupo.csv');
csvwrite(str,output_ACAPULCO);