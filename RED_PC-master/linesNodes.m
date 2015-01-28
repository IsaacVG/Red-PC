%Script para sacar todos los puntos entre coordenadas
%Por cada grupo
%Parametrizado

ciudad = 'TEJUPILCO';
grupo = '18';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);


load(mat_ciudad)

load MAT_fullDistance

%coordenates of the nodes ordered by ID
eval(sprintf('indexN = length(%s);',nodes_ciudad));
for i=1:indexN
eval(sprintf('LATnodes(i) = LAT(%s(i));',nodes_ciudad));
eval(sprintf('LONnodes(i) = LON(%s(i));',nodes_ciudad));
cd(i,1) = LATnodes(i)';
cd(i,2) = LONnodes(i)';
end

k=1;
i=1;
while i<indexN
    for j=2:indexN
       if(cd(j,1)>cd(i,1) || abs(cd(j,2))>abs(cd(i,2)))
          point(k,1) = cd(i,1);
          point(k,2) = cd(i,2);
          while point(k,1)<cd(j,1) || abs(point(k,2))<abs(cd(j,2))
              point(k+1,1) = point(k,1)+0.005;
              point(k+1,2) = point(k,2)-0.005;
              k=k+1;
          end
       else
           if(cd(j,1)<cd(i,1) || abs(cd(j,2))<abs(cd(i,2)))
               point(k,1) = cd(j,1);
               point(k,2) = cd(j,2);
               while point(k,1)<cd(i,1) || abs(point(k,2))<abs(cd(i,2))
                point(k+1,1) = point(k,1)+0.005;
                point(k+1,2) = point(k,2)-0.005;
                k=k+1;
               end
           end
       end
       i=i+1;
    end
end

