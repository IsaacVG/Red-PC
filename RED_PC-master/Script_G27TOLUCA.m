TOLUCA = [19.29411 -99.63121];
TOLUCA_group = GROUPS_51(LAT==TOLUCA(1));
nodes_TOLUCA = IDS(GROUPS_51==TOLUCA_group);
Lat_TOLUCA = LAT(GROUPS_51==TOLUCA_group);
Lon_TOLUCA = LON(GROUPS_51==TOLUCA_group);
n_TOLUCA = length(nodes_TOLUCA);
output_TOLUCA = zeros(n_TOLUCA^2,7);

count=1;
aux = zeros(n_TOLUCA^2,1);

for i=1:n_TOLUCA
    for j=i:n_TOLUCA
        if i~=j
            output_TOLUCA(count, :) = ...
                [nodes_TOLUCA(i) nodes_TOLUCA(j)...
                Lat_TOLUCA(i) Lon_TOLUCA(i) ...
                Lat_TOLUCA(j) Lon_TOLUCA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_TOLUCA = output_TOLUCA(aux==1,:);
str = strcat('TOLUCA_grupo.csv');
csvwrite(str,output_TOLUCA);