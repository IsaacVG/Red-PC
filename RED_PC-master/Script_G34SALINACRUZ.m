SALINACRUZ = [16.19652 -95.19678];
SALINACRUZ_group = GROUPS_51(LAT==SALINACRUZ(1));
nodes_SALINACRUZ = IDS(GROUPS_51==SALINACRUZ_group);
Lat_SALINACRUZ = LAT(GROUPS_51==SALINACRUZ_group);
Lon_SALINACRUZ = LON(GROUPS_51==SALINACRUZ_group);
n_SALINACRUZ = length(nodes_SALINACRUZ);
output_SALINACRUZ = zeros(n_SALINACRUZ^2,7);

count=1;
aux = zeros(n_SALINACRUZ^2,1);

for i=1:n_SALINACRUZ
    for j=i:n_SALINACRUZ
        if i~=j
            output_SALINACRUZ(count, :) = ...
                [nodes_SALINACRUZ(i) nodes_SALINACRUZ(j)...
                Lat_SALINACRUZ(i) Lon_SALINACRUZ(i) ...
                Lat_SALINACRUZ(j) Lon_SALINACRUZ(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_SALINACRUZ = output_SALINACRUZ(aux==1,:);
str = strcat('SALINACRUZ_grupo.csv');
csvwrite(str,output_SALINACRUZ);