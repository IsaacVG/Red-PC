PINOTEPA = [16.34353 -98.05992];
PINOTEPA_group = GROUPS_51(LAT==PINOTEPA(1));
nodes_PINOTEPA = IDS(GROUPS_51==PINOTEPA_group);
Lat_PINOTEPA = LAT(GROUPS_51==PINOTEPA_group);
Lon_PINOTEPA = LON(GROUPS_51==PINOTEPA_group);
n_PINOTEPA = length(nodes_PINOTEPA);
output_PINOTEPA = zeros(n_PINOTEPA^2,7);

count=1;
aux = zeros(n_PINOTEPA^2,1);

for i=1:n_PINOTEPA
    for j=i:n_PINOTEPA
        if i~=j
            output_PINOTEPA(count, :) = ...
                [nodes_PINOTEPA(i) nodes_PINOTEPA(j)...
                Lat_PINOTEPA(i) Lon_PINOTEPA(i) ...
                Lat_PINOTEPA(j) Lon_PINOTEPA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_PINOTEPA = output_PINOTEPA(aux==1,:);
str = strcat('PINOTEPA_grupo.csv');
csvwrite(str,output_PINOTEPA);