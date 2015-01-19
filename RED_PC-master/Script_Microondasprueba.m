clear all
close all
clc

cd C:/Users/isaac/Documents/GitHub/Red-PC/RED_PC-master/
load MAT_CdOBREGON
cd C:\Users\Isaac\Dropbox\RED_PC\EntregablesIvana\MatricesDistancias


CSV_MATRIZ  = csvread('Matriz-CdObregon-G3.csv',1,1 );
nodes_MATRIZ  = CSV_MATRIZ(:,1);
n_MATRIZ = length(nodes_CdOBREGON);

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
        index_ult(n_hoja) = nodes_CdOBREGON(ult);
        index_penult(n_hoja) = nodes_CdOBREGON(penult);
        carr_dist(n_hoja)=dist_carr;
        n_hoja = n_hoja + 1;
    else
        clear ult;
        clear penult;
        clear dist_carr;
    end
    
end

cd C:/Users/isaac/Documents/GitHub/Red-PC/RED_PC-master/
load MAT_fullDistance

for i=1:n_hoja-1
    dist_recta(i) = D(index_ult(i),index_penult(i))*100;
    grupo(i) = GROUPS_51(index_ult(i));
    Nombre_ult(i) = NOMBRES(index_ult(i));
    Nombre_penult(i) = NOMBRES(index_penult(i));
end
dist_recta = dist_recta';
grupo = grupo';
Nombre_ult = Nombre_ult';
Nombre_penult = Nombre_penult';
index_ult = index_ult';
index_penult = index_penult';
carr_dist=carr_dist';

save('MATmicroPRUEBA_CdOBREGON.mat','dist_recta','grupo','index_ult','index_penult','Nombre_ult','Nombre_penult','carr_dist')
clear all
load MATmicroPRUEBA_CdOBREGON.mat
%load(sprintf('MATRICES/Micro/MATmicro_%s-G%s.mat',ciudad,grupo));
%csvwrite(nombre_arch,dif_MATRIZ);