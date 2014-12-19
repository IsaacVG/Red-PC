CdVALLES = [21.98859 -99.0155];
CdVALLES_group = GROUPS_51(LAT==CdVALLES(1));
nodes_CdVALLES = IDS(GROUPS_51==CdVALLES_group);
Lat_CdVALLES = LAT(GROUPS_51==CdVALLES_group);
Lon_CdVALLES = LON(GROUPS_51==CdVALLES_group);
n_CdVALLES = length(nodes_CdVALLES);
output_CdVALLES = zeros(n_CdVALLES^2,7);

count=1;
aux = zeros(n_CdVALLES^2,1);

for i=1:n_CdVALLES
    for j=i:n_CdVALLES
        if i~=j
            output_CdVALLES(count, :) = ...
                [nodes_CdVALLES(i) nodes_CdVALLES(j)...
                Lat_CdVALLES(i) Lon_CdVALLES(i) ...
                Lat_CdVALLES(j) Lon_CdVALLES(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_CdVALLES = output_CdVALLES(aux==1,:);
str = strcat('CdVALLES_grupo.csv');
csvwrite(str,output_CdVALLES);