TORREON = [25.54861 -103.40192];
TORREON_group = GROUPS_51(LAT==TORREON(1));
nodes_TORREON = IDS(GROUPS_51==TORREON_group);
Lat_TORREON = LAT(GROUPS_51==TORREON_group);
Lon_TORREON = LON(GROUPS_51==TORREON_group);
n_TORREON = length(nodes_TORREON);
output_TORREON = zeros(n_TORREON^2,7);

count=1;
aux = zeros(n_TORREON^2,1);

for i=1:n_TORREON
    for j=i:n_TORREON
        if i~=j
            output_TORREON(count, :) = ...
                [nodes_TORREON(i) nodes_TORREON(j)...
                Lat_TORREON(i) Lon_TORREON(i) ...
                Lat_TORREON(j) Lon_TORREON(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_TORREON = output_TORREON(aux==1,:);
str = strcat('TORREON_grupo.csv');
csvwrite(str,output_TORREON);