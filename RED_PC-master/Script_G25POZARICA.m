POZARICA = [20.53432 -97.44458];
POZARICA_group = GROUPS_51(LAT==POZARICA(1));
nodes_POZARICA = IDS(GROUPS_51==POZARICA_group);
Lat_POZARICA = LAT(GROUPS_51==POZARICA_group);
Lon_POZARICA = LON(GROUPS_51==POZARICA_group);
n_POZARICA = length(nodes_POZARICA);
output_POZARICA = zeros(n_POZARICA^2,7);

count=1;
aux = zeros(n_POZARICA^2,1);

for i=1:n_POZARICA
    for j=i:n_POZARICA
        if i~=j
            output_POZARICA(count, :) = ...
                [nodes_POZARICA(i) nodes_POZARICA(j)...
                Lat_POZARICA(i) Lon_POZARICA(i) ...
                Lat_POZARICA(j) Lon_POZARICA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_POZARICA = output_POZARICA(aux==1,:);
str = strcat('POZARICA_grupo.csv');
csvwrite(str,output_POZARICA);