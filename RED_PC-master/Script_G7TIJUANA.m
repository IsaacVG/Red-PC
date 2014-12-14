TIJUANA = [32.49661 -116.97262];
TIJUANA_group = GROUPS_51(LAT==TIJUANA(1));
nodes_TIJUANA = IDS(GROUPS_51==TIJUANA_group);
Lat_TIJUANA = LAT(GROUPS_51==TIJUANA_group);
Lon_TIJUANA = LON(GROUPS_51==TIJUANA_group);
n_TIJUANA = length(nodes_TIJUANA);
output_TIJUANA = zeros(n_TIJUANA^2,7);

count=1;
aux = zeros(n_TIJUANA^2,1);

for i=1:n_TIJUANA
    for j=i:n_TIJUANA
        if i~=j
            output_TIJUANA(count, :) = ...
                [nodes_TIJUANA(i) nodes_TIJUANA(j)...
                Lat_TIJUANA(i) Lon_TIJUANA(i) ...
                Lat_TIJUANA(j) Lon_TIJUANA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_TIJUANA = output_TIJUANA(aux==1,:);
str = strcat('TIJUANA_grupo.csv');
csvwrite(str,output_TIJUANA);