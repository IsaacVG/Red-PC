GUADALAJARA = [20.67379 -103.33541];
GUADALAJARA_group = GROUPS_51(LAT==GUADALAJARA(1));
nodes_GUADALAJARA = IDS(GROUPS_51==GUADALAJARA_group);
Lat_GUADALAJARA = LAT(GROUPS_51==GUADALAJARA_group);
Lon_GUADALAJARA = LON(GROUPS_51==GUADALAJARA_group);
n_GUADALAJARA = length(nodes_GUADALAJARA);
output_GUADALAJARA = zeros(n_GUADALAJARA^2,7);

count=1;
aux = zeros(n_GUADALAJARA^2,1);

for i=1:n_GUADALAJARA
    for j=i:n_GUADALAJARA
        if i~=j
            output_GUADALAJARA(count, :) = ...
                [nodes_GUADALAJARA(i) nodes_GUADALAJARA(j)...
                Lat_GUADALAJARA(i) Lon_GUADALAJARA(i) ...
                Lat_GUADALAJARA(j) Lon_GUADALAJARA(j) 0];
            aux(count) = 1;
            count = count+1;
        end
    end
end

output_GUADALAJARA = output_GUADALAJARA(aux==1,:);
str = strcat('GUADALAJARA_grupo.csv');
csvwrite(str,output_GUADALAJARA);