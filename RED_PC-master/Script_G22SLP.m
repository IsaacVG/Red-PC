SLP = [22.12398 -100.95106];
SLP_group = GROUPS_51(LAT==SLP(1));
nodes_SLP = IDS(GROUPS_51==SLP_group);
Lat_SLP = LAT(GROUPS_51==SLP_group);
Lon_SLP = LON(GROUPS_51==SLP_group);
n_SLP = length(nodes_SLP);
output_SLP = zeros(n_SLP^2,7);

count=1;
aux = zeros(n_SLP^2,1);

for i=1:n_SLP
    for j=i:n_SLP
        if i~=j
            output_SLP(count, :) = ...
                [nodes_SLP(i) nodes_SLP(j)...
                Lat_SLP(i) Lon_SLP(i) ...
                Lat_SLP(j) Lon_SLP(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_SLP = output_SLP(aux==1,:);
str = strcat('SLP_grupo.csv');
csvwrite(str,output_SLP);