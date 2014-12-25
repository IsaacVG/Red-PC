MORELIA = [19.70365 -101.20612];
MORELIA_group = GROUPS_51(LAT==MORELIA(1));
nodes_MORELIA = IDS(GROUPS_51==MORELIA_group);
Lat_MORELIA = LAT(GROUPS_51==MORELIA_group);
Lon_MORELIA = LON(GROUPS_51==MORELIA_group);
n_MORELIA = length(nodes_MORELIA);
output_MORELIA = zeros(n_MORELIA^2,7);

count=1;
aux = zeros(n_MORELIA^2,1);

for i=1:n_MORELIA
    for j=i:n_MORELIA
        if i~=j
            output_MORELIA(count, :) = ...
                [nodes_MORELIA(i) nodes_MORELIA(j)...
                Lat_MORELIA(i) Lon_MORELIA(i) ...
                Lat_MORELIA(j) Lon_MORELIA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_MORELIA = output_MORELIA(aux==1,:);
str = strcat('MORELIA_grupo.csv');
csvwrite(str,output_MORELIA);