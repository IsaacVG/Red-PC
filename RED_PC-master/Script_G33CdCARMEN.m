CdCARMEN = [18.65045 -91.7984];
CdCARMEN_group = GROUPS_51(LAT==CdCARMEN(1));
nodes_CdCARMEN = IDS(GROUPS_51==CdCARMEN_group);
Lat_CdCARMEN = LAT(GROUPS_51==CdCARMEN_group);
Lon_CdCARMEN = LON(GROUPS_51==CdCARMEN_group);
n_CdCARMEN = length(nodes_CdCARMEN);
output_CdCARMEN = zeros(n_CdCARMEN^2,7);

count=1;
aux = zeros(n_CdCARMEN^2,1);

for i=1:n_CdCARMEN
    for j=i:n_CdCARMEN
        if i~=j
            output_CdCARMEN(count, :) = ...
                [nodes_CdCARMEN(i) nodes_CdCARMEN(j)...
                Lat_CdCARMEN(i) Lon_CdCARMEN(i) ...
                Lat_CdCARMEN(j) Lon_CdCARMEN(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_CdCARMEN = output_CdCARMEN(aux==1,:);
str = strcat('CdCARMEN_grupo.csv');
csvwrite(str,output_CdCARMEN);