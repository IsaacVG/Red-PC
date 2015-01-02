ZAMORA = [19.99255 -102.28609];
ZAMORA_group = GROUPS_51(LAT==ZAMORA(1));
nodes_ZAMORA = IDS(GROUPS_51==ZAMORA_group);
Lat_ZAMORA = LAT(GROUPS_51==ZAMORA_group);
Lon_ZAMORA = LON(GROUPS_51==ZAMORA_group);
n_ZAMORA = length(nodes_ZAMORA);
output_ZAMORA = zeros(n_ZAMORA^2,7);

count=1;
aux = zeros(n_ZAMORA^2,1);

for i=1:n_ZAMORA
    for j=i:n_ZAMORA
        if i~=j
            output_ZAMORA(count, :) = ...
                [nodes_ZAMORA(i) nodes_ZAMORA(j)...
                Lat_ZAMORA(i) Lon_ZAMORA(i) ...
                Lat_ZAMORA(j) Lon_ZAMORA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_ZAMORA = output_ZAMORA(aux==1,:);
str = strcat('ZAMORA_grupo.csv');
csvwrite(str,output_ZAMORA);