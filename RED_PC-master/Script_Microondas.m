clear all
close all
clc

ciudad = 'COLIMA';
grupo = '37';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);
nombre_matriz = sprintf('MATRICES/Matriz-%s-G%s.csv',ciudad,grupo);

load(mat_ciudad)

CSV_MATRIZ  = csvread(nombre_matriz,1,1 );
nodes_MATRIZ  = CSV_MATRIZ(:,1);
eval(sprintf('n_MATRIZ  = length(%s)',nodes_ciudad));

n_hoja=1;
for i=1:n_MATRIZ
    conteo=0;
    for j=1:n_MATRIZ
        if CSV_MATRIZ(i,j)~=0
            conteo=conteo+1;
            dist_carr=CSV_MATRIZ(i,j);
            ult=i;
            penult=j;
        end
    end
    if conteo==1
        eval(sprintf('index_ult(n_hoja) = %s(i)',nodes_ciudad));
        eval(sprintf('index_penult(n_hoja) = %s(j)',nodes_ciudad));
        carr_dist(n_hoja)=dist_carr;
        n_hoja = n_hoja + 1;
    else
        clear ult;
        clear penult;
        clear dist_carr;
    end
    
end


load MAT_fullDistance

for i=1:n_hoja
    dist_recta(i) = D(index_ult(i),index_penult(i));
    grupo(i) = GROUPS_51(index_ult(i));
    Nombre_ult(i) = NOMBRES(index_ult(i));
    Nombre_penult(i) = NOMBRES(index_penult(i));
end

nombre_arch = sprintf('MATRICES/Micro/Micro-%s-G%s.csv', ciudad, grupo);

save(sprintf('MATRICES/Micro/MATmicro_%s-G%s.mat',ciudad,grupo),'dist_recta','grupo','index_ult','index_penult','Nombre_ult','Nombre_penult');
%load(sprintf('MATRICES/Micro/MATmicro_%s-G%s.mat',ciudad,grupo));
%csvwrite(nombre_arch,dif_MATRIZ);