ZITACUARO = [19.43555 -100.35448];
ZITACUARO_group = GROUPS_51(LAT==ZITACUARO(1));
nodes_ZITACUARO = IDS(GROUPS_51==ZITACUARO_group);
Lat_ZITACUARO = LAT(GROUPS_51==ZITACUARO_group);
Lon_ZITACUARO = LON(GROUPS_51==ZITACUARO_group);
n_ZITACUARO = length(nodes_ZITACUARO);
output_ZITACUARO = zeros(n_ZITACUARO^2,7);

count=1;
aux = zeros(n_ZITACUARO^2,1);

for i=1:n_ZITACUARO
    for j=i:n_ZITACUARO
        if i~=j
            output_ZITACUARO(count, :) = ...
                [nodes_ZITACUARO(i) nodes_ZITACUARO(j)...
                Lat_ZITACUARO(i) Lon_ZITACUARO(i) ...
                Lat_ZITACUARO(j) Lon_ZITACUARO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_ZITACUARO = output_ZITACUARO(aux==1,:);
str = strcat('ZITACUARO_grupo.csv');
csvwrite(str,output_ZITACUARO);