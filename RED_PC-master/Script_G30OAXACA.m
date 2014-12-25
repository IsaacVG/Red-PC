OAXACA = [17.0813 -96.73564];
OAXACA_group = GROUPS_51(LAT==OAXACA(1));
nodes_OAXACA = IDS(GROUPS_51==OAXACA_group);
Lat_OAXACA = LAT(GROUPS_51==OAXACA_group);
Lon_OAXACA = LON(GROUPS_51==OAXACA_group);
n_OAXACA = length(nodes_OAXACA);
output_OAXACA = zeros(n_OAXACA^2,7);

count=1;
aux = zeros(n_OAXACA^2,1);

for i=1:n_OAXACA
    for j=i:n_OAXACA
        if i~=j
            output_OAXACA(count, :) = ...
                [nodes_OAXACA(i) nodes_OAXACA(j)...
                Lat_OAXACA(i) Lon_OAXACA(i) ...
                Lat_OAXACA(j) Lon_OAXACA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_OAXACA = output_OAXACA(aux==1,:);
str = strcat('OAXACA_grupo.csv');
csvwrite(str,output_OAXACA);