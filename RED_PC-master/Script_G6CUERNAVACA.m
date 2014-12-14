CUERNAVACA = [18.93188 -99.24057];
CUERNAVACA_group = GROUPS_51(LAT==CUERNAVACA(1));
nodes_CUERNAVACA = IDS(GROUPS_51==CUERNAVACA_group);
Lat_CUERNAVACA = LAT(GROUPS_51==CUERNAVACA_group);
Lon_CUERNAVACA = LON(GROUPS_51==CUERNAVACA_group);
n_CUERNAVACA = length(nodes_CUERNAVACA);
output_CUERNAVACA = zeros(n_CUERNAVACA^2,7);

count=1;
aux = zeros(n_CUERNAVACA^2,1);

for i=1:n_CUERNAVACA
    for j=i:n_CUERNAVACA
        if i~=j
            output_CUERNAVACA(count, :) = ...
                [nodes_CUERNAVACA(i) nodes_CUERNAVACA(j)...
                Lat_CUERNAVACA(i) Lon_CUERNAVACA(i) ...
                Lat_CUERNAVACA(j) Lon_CUERNAVACA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_CUERNAVACA = output_CUERNAVACA(aux==1,:);
str = strcat('CUERNAVACA_grupo.csv');
csvwrite(str,output_CUERNAVACA);