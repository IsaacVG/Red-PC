TEJUPILCO = [18.90587 -100.14913];
TEJUPILCO_group = GROUPS_51(LAT==TEJUPILCO(1));
nodes_TEJUPILCO = IDS(GROUPS_51==TEJUPILCO_group);
Lat_TEJUPILCO = LAT(GROUPS_51==TEJUPILCO_group);
Lon_TEJUPILCO = LON(GROUPS_51==TEJUPILCO_group);
n_TEJUPILCO = length(nodes_TEJUPILCO);
output_TEJUPILCO = zeros(n_TEJUPILCO^2,7);

count=1;
aux = zeros(n_TEJUPILCO^2,1);

for i=1:n_TEJUPILCO
    for j=i:n_TEJUPILCO
        if i~=j
            output_TEJUPILCO(count, :) = ...
                [nodes_TEJUPILCO(i) nodes_TEJUPILCO(j)...
                Lat_TEJUPILCO(i) Lon_TEJUPILCO(i) ...
                Lat_TEJUPILCO(j) Lon_TEJUPILCO(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_TEJUPILCO = output_TEJUPILCO(aux==1,:);
str = strcat('TEJUPILCO_grupo.csv');
csvwrite(str,output_TEJUPILCO);