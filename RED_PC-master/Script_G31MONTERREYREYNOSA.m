MONTERREY = [25.6488 -100.3031];
MONTERREY_group = GROUPS_51(LAT==MONTERREY(1));
nodes_MONTERREY = IDS(GROUPS_51==MONTERREY_group);
Lat_MONTERREY = LAT(GROUPS_51==MONTERREY_group);
Lon_MONTERREY = LON(GROUPS_51==MONTERREY_group);
n_MONTERREY = length(nodes_MONTERREY);
output_MONTERREY = zeros(n_MONTERREY^2,7);

count=1;
aux = zeros(n_MONTERREY^2,1);

for i=1:n_MONTERREY
    for j=i:n_MONTERREY
        if i~=j
            output_MONTERREY(count, :) = ...
                [nodes_MONTERREY(i) nodes_MONTERREY(j)...
                Lat_MONTERREY(i) Lon_MONTERREY(i) ...
                Lat_MONTERREY(j) Lon_MONTERREY(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_MONTERREY = output_MONTERREY(aux==1,:);
str = strcat('MONTERREY_grupo.csv');
csvwrite(str,output_MONTERREY);