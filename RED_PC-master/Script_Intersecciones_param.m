clear all
close all
clc

ciudad = 'COATZACOALCOS';
grupo = '38';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);
nombre_matriz = sprintf('MATRICES/Matriz-%s-G%s.csv',ciudad,grupo);

load(mat_ciudad)

CSV_MATRIZ  = csvread(nombre_matriz,1,1 );
nodes_MATRIZ  = CSV_MATRIZ(:,1);
eval(sprintf('n_MATRIZ  = length(%s)',nodes_ciudad));

dif_MATRIZ = zeros(n_MATRIZ,4);

for i=1:n_MATRIZ
    conteo=1;
    for j1=1:n_MATRIZ
        if CSV_MATRIZ(i,j1)~=0
            loc1=CSV_MATRIZ(i,j1);
            for j2=j1+1:n_MATRIZ
                if CSV_MATRIZ(i,j2)~=0
                    loc2=CSV_MATRIZ(i,j2);
                    ab=loc1+loc2;
                    eval(sprintf('c  = %s(j1,j2)',dist_ciudad));
                    dif=(ab-c)/2;
%                     dif_MATRIZCdOBREGON(i,j1)=dif;
                        if dif>=0
                          dif_MATRIZ(i,conteo)=dif;
                        else
                          dif_MATRIZ(i,conteo)=0;
                        end
                    conteo=conteo+1;
                end
            end
        end
    end
end
save(sprintf('MATRICES/MATdif_%s-G%s.mat',ciudad,grupo),'dif_MATRIZ');
