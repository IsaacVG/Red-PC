LEON = [21.12192 -101.66601];
LEON_group = GROUPS_51(LAT==LEON(1));
nodes_LEON = IDS(GROUPS_51==LEON_group);
Lat_LEON = LAT(GROUPS_51==LEON_group);
Lon_LEON = LON(GROUPS_51==LEON_group);
n_LEON = length(nodes_LEON);
output_LEON = zeros(n_LEON^2,7);

count=1;
aux = zeros(n_LEON^2,1);

for i=1:n_LEON
    for j=i:n_LEON
        if i~=j
            output_LEON(count, :) = ...
                [nodes_LEON(i) nodes_LEON(j)...
                Lat_LEON(i) Lon_LEON(i) ...
                Lat_LEON(j) Lon_LEON(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_LEON = output_LEON(aux==1,:);
str = strcat('LEON_grupo.csv');
csvwrite(str,output_LEON);