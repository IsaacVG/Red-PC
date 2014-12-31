APATZINGAN = [19.08895 -102.34886];
APATZINGAN_group = GROUPS_51(LAT==APATZINGAN(1));
nodes_APATZINGAN = IDS(GROUPS_51==APATZINGAN_group);
Lat_APATZINGAN = LAT(GROUPS_51==APATZINGAN_group);
Lon_APATZINGAN = LON(GROUPS_51==APATZINGAN_group);
n_APATZINGAN = length(nodes_APATZINGAN);
output_APATZINGAN = zeros(n_APATZINGAN^2,7);

count=1;
aux = zeros(n_APATZINGAN^2,1);

for i=1:n_APATZINGAN
    for j=i:n_APATZINGAN
        if i~=j
            output_APATZINGAN(count, :) = ...
                [nodes_APATZINGAN(i) nodes_APATZINGAN(j)...
                Lat_APATZINGAN(i) Lon_APATZINGAN(i) ...
                Lat_APATZINGAN(j) Lon_APATZINGAN(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_APATZINGAN = output_APATZINGAN(aux==1,:);
str = strcat('APATZINGAN_grupo.csv');
csvwrite(str,output_APATZINGAN);