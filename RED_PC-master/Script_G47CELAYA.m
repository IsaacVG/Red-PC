CELAYA = [20.52855 -100.81709];
CELAYA_group = GROUPS_51(LAT==CELAYA(1));
nodes_CELAYA = IDS(GROUPS_51==CELAYA_group);
Lat_CELAYA = LAT(GROUPS_51==CELAYA_group);
Lon_CELAYA = LON(GROUPS_51==CELAYA_group);
n_CELAYA = length(nodes_CELAYA);
output_CELAYA = zeros(n_CELAYA^2,7);

count=1;
aux = zeros(n_CELAYA^2,1);

for i=1:n_CELAYA
    for j=i:n_CELAYA
        if i~=j
            output_CELAYA(count, :) = ...
                [nodes_CELAYA(i) nodes_CELAYA(j)...
                Lat_CELAYA(i) Lon_CELAYA(i) ...
                Lat_CELAYA(j) Lon_CELAYA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_CELAYA = output_CELAYA(aux==1,:);
str = strcat('CELAYA_grupo.csv');
csvwrite(str,output_CELAYA);