CdVICTORIA = [23.741 -99.14332];
CdVICTORIA_group = GROUPS_51(LAT==CdVICTORIA(1));
nodes_CdVICTORIA = IDS(GROUPS_51==CdVICTORIA_group);
Lat_CdVICTORIA = LAT(GROUPS_51==CdVICTORIA_group);
Lon_CdVICTORIA = LON(GROUPS_51==CdVICTORIA_group);
n_CdVICTORIA = length(nodes_CdVICTORIA);
output_CdVICTORIA = zeros(n_CdVICTORIA^2,7);

count=1;
aux = zeros(n_CdVICTORIA^2,1);

for i=1:n_CdVICTORIA
    for j=i:n_CdVICTORIA
        if i~=j
            output_CdVICTORIA(count, :) = ...
                [nodes_CdVICTORIA(i) nodes_CdVICTORIA(j)...
                Lat_CdVICTORIA(i) Lon_CdVICTORIA(i) ...
                Lat_CdVICTORIA(j) Lon_CdVICTORIA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_CdVICTORIA = output_CdVICTORIA(aux==1,:);
str = strcat('CdVICTORIA_grupo.csv');
csvwrite(str,output_CdVICTORIA);