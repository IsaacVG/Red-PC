clear all
close all
clc

ciudad = 'MAZATLAN';
grupo = '51';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);
nombre_matriz = sprintf('MATRICES/Matriz-%s-G%s.csv',ciudad,grupo);

load(mat_ciudad)
load MAT_fullDistance

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
        eval(sprintf('index_ult(n_hoja) = %s(ult)',nodes_ciudad));
        eval(sprintf('index_penult(n_hoja) = %s(penult)',nodes_ciudad));
        carr_dist(n_hoja)=dist_carr;
        n_hoja = n_hoja + 1;
    else
        clear ult;
        clear penult;
        clear dist_carr;
    end
    
end

for i=1:n_hoja-1
    dist_recta(i) = D(index_ult(i),index_penult(i))*100;
    grupos(i) = GROUPS_51(index_ult(i));
    Nombre_ult(i) = NOMBRES(index_ult(i));
    Nombre_penult(i) = NOMBRES(index_penult(i));
end
dist_recta = dist_recta';
grupos = grupos';
Nombre_ult = Nombre_ult';
Nombre_penult = Nombre_penult';
index_ult = index_ult';
index_penult = index_penult';
carr_dist=carr_dist';

all_info=[index_ult index_penult grupos carr_dist dist_recta];

% save('MATmicroPRUEBA_CdOBREGON.mat','all_info','dist_recta','grupos','index_ult','index_penult','Nombre_ult','Nombre_penult','carr_dist')
% clear all
% load MATmicroPRUEBA_CdOBREGON.mat

nombre_arch = sprintf('MATRICES/Microonda/Microonda_%s-G%s.csv', ciudad, grupo);

csvwrite(nombre_arch,all_info);