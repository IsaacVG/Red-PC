VILLAHERMOSA = [17.99253 -92.95312];
VILLAHERMOSA_group = GROUPS_51(LAT==VILLAHERMOSA(1));
nodes_VILLAHERMOSA = IDS(GROUPS_51==VILLAHERMOSA_group);
Lat_VILLAHERMOSA = LAT(GROUPS_51==VILLAHERMOSA_group);
Lon_VILLAHERMOSA = LON(GROUPS_51==VILLAHERMOSA_group);
n_VILLAHERMOSA = length(nodes_VILLAHERMOSA);
output_VILLAHERMOSA = zeros(n_VILLAHERMOSA^2,7);

count=1;
aux = zeros(n_VILLAHERMOSA^2,1);

for i=1:n_VILLAHERMOSA
    for j=i:n_VILLAHERMOSA
        if i~=j
            output_VILLAHERMOSA(count, :) = ...
                [nodes_VILLAHERMOSA(i) nodes_VILLAHERMOSA(j)...
                Lat_VILLAHERMOSA(i) Lon_VILLAHERMOSA(i) ...
                Lat_VILLAHERMOSA(j) Lon_VILLAHERMOSA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_VILLAHERMOSA = output_VILLAHERMOSA(aux==1,:);
str = strcat('VILLAHERMOSA_grupo.csv');
csvwrite(str,output_VILLAHERMOSA);