PACHUCA = [20.08466 -98.76332];
PACHUCA_group = GROUPS_51(LAT==PACHUCA(1));
nodes_PACHUCA = IDS(GROUPS_51==PACHUCA_group);
Lat_PACHUCA = LAT(GROUPS_51==PACHUCA_group);
Lon_PACHUCA = LON(GROUPS_51==PACHUCA_group);
n_PACHUCA = length(nodes_PACHUCA);
output_PACHUCA = zeros(n_PACHUCA^2,7);

count=1;
aux = zeros(n_PACHUCA^2,1);

for i=1:n_PACHUCA
    for j=i:n_PACHUCA
        if i~=j
            output_PACHUCA(count, :) = ...
                [nodes_PACHUCA(i) nodes_PACHUCA(j)...
                Lat_PACHUCA(i) Lon_PACHUCA(i) ...
                Lat_PACHUCA(j) Lon_PACHUCA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_PACHUCA = output_PACHUCA(aux==1,:);
str = strcat('PACHUCA_grupo.csv');
csvwrite(str,output_PACHUCA);