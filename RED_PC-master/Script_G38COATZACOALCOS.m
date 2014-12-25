COATZACOALCOS = [18.13422 -94.46303];
COATZACOALCOS_group = GROUPS_51(LAT==COATZACOALCOS(1));
nodes_COATZACOALCOS = IDS(GROUPS_51==COATZACOALCOS_group);
Lat_COATZACOALCOS = LAT(GROUPS_51==COATZACOALCOS_group);
Lon_COATZACOALCOS = LON(GROUPS_51==COATZACOALCOS_group);
n_COATZACOALCOS = length(nodes_COATZACOALCOS);
output_COATZACOALCOS = zeros(n_COATZACOALCOS^2,7);

count=1;
aux = zeros(n_COATZACOALCOS^2,1);

for i=1:n_COATZACOALCOS
    for j=i:n_COATZACOALCOS
        if i~=j
            output_COATZACOALCOS(count, :) = ...
                [nodes_COATZACOALCOS(i) nodes_COATZACOALCOS(j)...
                Lat_COATZACOALCOS(i) Lon_COATZACOALCOS(i) ...
                Lat_COATZACOALCOS(j) Lon_COATZACOALCOS(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_COATZACOALCOS = output_COATZACOALCOS(aux==1,:);
str = strcat('COATZACOALCOS_grupo.csv');
csvwrite(str,output_COATZACOALCOS);