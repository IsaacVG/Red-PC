ZIHUATANEJO = [17.64033 -101.55781];
ZIHUATANEJO_group = GROUPS_51(LAT==ZIHUATANEJO(1));
nodes_ZIHUATANEJO = IDS(GROUPS_51==ZIHUATANEJO_group);
Lat_ZIHUATANEJO = LAT(GROUPS_51==ZIHUATANEJO_group);
Lon_ZIHUATANEJO = LON(GROUPS_51==ZIHUATANEJO_group);
n_ZIHUATANEJO = length(nodes_ZIHUATANEJO);
output_ZIHUATANEJO = zeros(n_ZIHUATANEJO^2,7);

count=1;
aux = zeros(n_ZIHUATANEJO^2,1);

for i=1:n_ZIHUATANEJO
    for j=i:n_ZIHUATANEJO
        if i~=j
            output_ZIHUATANEJO(count, :) = ...
                [nodes_ZIHUATANEJO(i) nodes_ZIHUATANEJO(j)...
                Lat_ZIHUATANEJO(i) Lon_ZIHUATANEJO(i) ...
                Lat_ZIHUATANEJO(j) Lon_ZIHUATANEJO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_ZIHUATANEJO = output_ZIHUATANEJO(aux==1,:);
str = strcat('ZIHUATANEJO_grupo.csv');
csvwrite(str,output_ZIHUATANEJO);