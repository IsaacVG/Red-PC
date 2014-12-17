ECATEPEC = [19.57186 -99.03862];
ECATEPEC_group = GROUPS_51(LAT==ECATEPEC(1));
nodes_ECATEPEC = IDS(GROUPS_51==ECATEPEC_group);
Lat_ECATEPEC = LAT(GROUPS_51==ECATEPEC_group);
Lon_ECATEPEC = LON(GROUPS_51==ECATEPEC_group);
n_ECATEPEC = length(nodes_ECATEPEC);
output_ECATEPEC = zeros(n_ECATEPEC^2,7);

count=1;
aux = zeros(n_ECATEPEC^2,1);

for i=1:n_ECATEPEC
    for j=i:n_ECATEPEC
        if i~=j
            output_ECATEPEC(count, :) = ...
                [nodes_ECATEPEC(i) nodes_ECATEPEC(j)...
                Lat_ECATEPEC(i) Lon_ECATEPEC(i) ...
                Lat_ECATEPEC(j) Lon_ECATEPEC(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_ECATEPEC = output_ECATEPEC(aux==1,:);
str = strcat('ECATEPEC_grupo.csv');
csvwrite(str,output_ECATEPEC);