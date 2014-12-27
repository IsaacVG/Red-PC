clear all
close all
clc

load MAT_CdOBREGON
cd C:\Users\Isaac\Dropbox\RED_PC\EntregablesIvana\MatricesDistancias

CSV_MATRIZCdOBREGON = csvread('Matriz-CdObregon-G3.csv',1,1);
cd C:\Users\Isaac\Documents\GitHub\Red-PC\RED_PC-master
nodes_MATRIZCdOBREGON = CSV_CdOBREGON(:,1);
n_MATRIZCdOBREGON = length(nodes_CdOBREGON);
% dif_MATRIZCdOBREGON = zeros(n_MATRIZCdOBREGON);
dif_MATRIZCdOBREGON = zeros(n_MATRIZCdOBREGON,4);
for i=1:n_MATRIZCdOBREGON
    conteo=1;
    for j1=1:n_MATRIZCdOBREGON
        if CSV_MATRIZCdOBREGON(i,j1)~=0
            loc1=CSV_MATRIZCdOBREGON(i,j1);
            for j2=j1+1:n_MATRIZCdOBREGON
                if CSV_MATRIZCdOBREGON(i,j2)~=0
                    loc2=CSV_MATRIZCdOBREGON(i,j2);
                    ab=loc1+loc2;
                    c=dist_CdOBREGON(j1,j2);
                    dif=(ab-c)/2;
%                     dif_MATRIZCdOBREGON(i,j1)=dif;
                    dif_MATRIZCdOBREGON(i,conteo)=dif;
                    conteo=conteo+1;
                end
            end
        end
    end
end
save('MATdif_CdOBREGON.mat','dif_MATRIZCdOBREGON')