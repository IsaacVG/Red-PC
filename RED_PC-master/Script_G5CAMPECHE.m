CAMPECHE = [19.83444 -90.52734];
CAMPECHE_group = GROUPS_51(LAT==CAMPECHE(1));
nodes_CAMPECHE = IDS(GROUPS_51==CAMPECHE_group);
Lat_CAMPECHE = LAT(GROUPS_51==CAMPECHE_group);
Lon_CAMPECHE = LON(GROUPS_51==CAMPECHE_group);
n_CAMPECHE = length(nodes_CAMPECHE);
output_CAMPECHE = zeros(n_CAMPECHE^2,7);

count=1;
aux = zeros(n_CAMPECHE^2,1);

for i=1:n_CAMPECHE
    for j=i:n_CAMPECHE
        if i~=j
            output_CAMPECHE(count, :) = ...
                [nodes_CAMPECHE(i) nodes_CAMPECHE(j)...
                Lat_CAMPECHE(i) Lon_CAMPECHE(i) ...
                Lat_CAMPECHE(j) Lon_CAMPECHE(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_CAMPECHE = output_CAMPECHE(aux==1,:);
str = strcat('CAMPECHE_grupo.csv');
csvwrite(str,output_CAMPECHE);