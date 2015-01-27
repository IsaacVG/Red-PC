clear all
close all
clc

load MAT_CdOBREGON
load MAT_FullDistance
cd C:\Users\Isaac\Dropbox\RED_PC\EntregablesIvana\MatricesDistancias

CSV_MATRIZCdOBREGON = csvread('Matriz-CdObregon-G3.csv',1,1);
cd C:\Users\Isaac\Documents\GitHub\Red-PC\RED_PC-master
nodes_MATRIZCdOBREGON = CSV_CdOBREGON(:,1);
n_MATRIZCdOBREGON = length(nodes_CdOBREGON);
% dif_MATRIZCdOBREGON = zeros(n_MATRIZCdOBREGON);
dif_MATRIZCdOBREGON = zeros(n_MATRIZCdOBREGON,4);
conteo=1;
for i=1:n_MATRIZCdOBREGON    
    for j=1:n_MATRIZCdOBREGON
        if CSV_MATRIZCdOBREGON(i,j)~=0
            distancia(conteo)=CSV_MATRIZCdOBREGON(i,j);
            Id1=nodes_CdOBREGON(i);
            Id2=nodes_CdOBREGON(j);
            Nombre1(conteo)=NOMBRES(Id1);
            Nombre2(conteo)=NOMBRES(Id2);
            Lat1(conteo)=LAT(Id1);
            Lon1(conteo)=LON(Id1);
            Lat2(conteo)=LAT(Id2);
            Lon2(conteo)=LON(Id2);
            Grupo(conteo)=GROUPS_51(Id1);
            numConexion(conteo)=conteo;
            conteo=conteo+1;
        end
    end
end
%distancia=distancia';
Nombre1=Nombre1';
Nombre2=Nombre2';
info=[numConexion' Grupo' distancia' Lat1' Lon2' Lat2' Lon2'];
save('MATconex_CdOBREGON.mat','Nombre1','Nombre2','info')
clear all
load 'MATconex_CdOBREGON.mat'