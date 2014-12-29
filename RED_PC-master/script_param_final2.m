% script_param_final.m
% Input: 
% ciudad: ciuadad a ejecutar
% Computes:
% - Matrix for ciudad group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with ciudad city)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc
ciudad = 'MERIDA';
grupo = '1';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);


load(mat_ciudad)

load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 50000; % min population to be concentrator
%
eval(sprintf('POB_ciudad = POB(%s);',nodes_ciudad))

eval(sprintf('[nodos concentrador v freqs] = dysartGeorganas(4, %s, %s);',nodes_ciudad,dist_ciudad))
% force Chiapas/Tuxtla City into the main nodes.
concentrador(POB_ciudad<=minpop) = false;
eval(sprintf('concentrador(LAT(%s)==%s(1)) = true;',nodes_ciudad,ciudad))
eval(sprintf('concentrador(IDS(%s)==3627) = true;',nodes_ciudad))
eval(sprintf('concentrador(IDS(%s)==3351) = true;',nodes_ciudad))
eval(sprintf('concentrador(IDS(%s)==3497) = false;',nodes_ciudad))

%Forced IDS
%MERIDA = 3627, 3351, 3497
%QUERETARO = 2938
%CHTUX = 3516
%AGUASCALIENTES[40000]  = 2985,3429
%CHIHUAHUA[40000]  = 3647
%CdVALLES[40000] = 3248
%TAPACHULA[17000] = 3120

%SLP[50000] = 

eval(sprintf('Dc = %s(concentrador==true,concentrador==true);',dist_ciudad))
%
eval(sprintf('[Kc, totDist, defi, permi] = steiglitzWeinerKleitman1(Dc, concentrador,%s, 2, 100);',nodes_ciudad))
                        
                        
eval(sprintf('[groupindx, numberOfGroups] = buildSubgroups(concentrador,%s,%s);',nodes_ciudad,dist_ciudad))
eval(sprintf('CM_ciudad = zeros(size(%s));',dist_ciudad)) %full conectivity matrix.
eval(sprintf('concentrators = %s(concentrador==true);',nodes_ciudad))

eval(sprintf('localindx = 1:length(%s);',nodes_ciudad))
for i=1:numberOfGroups
    eval(sprintf('Dindx = %s(groupindx==i,groupindx==i);',dist_ciudad))
    eval(sprintf('Nindx = %s(groupindx==i);',nodes_ciudad))
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_ciudad(groupindx==i,groupindx==i) = Kret;
end

       
               
% FULL CONECTIVITY MATRIX!!
nombre_matriz = sprintf('MATRICES/Matriz-%s-G%s.csv',ciudad,grupo);
eval(sprintf('cell_ciudad  = toCell(NOMBRES(%s), CM_ciudad,nombre_matriz );',nodes_ciudad))
CM_ciudad(concentrador==true, concentrador==true) = Kc;
%Concentrators Distance Matrix
Kc = Kc+Kc';
nombre_matriz_conc = sprintf('MATRICES/MatrizConc-%s-G%s.csv',ciudad,grupo);
cell_ciudad_conc  = toCell(NOMBRES(concentrators), Kc ,nombre_matriz_conc );

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
eval(sprintf('LATc = LAT(%s(concentrador==true));',nodes_ciudad))
eval(sprintf('LONc = LON(%s(concentrador==true));', nodes_ciudad))

eval(sprintf('LATnc = LAT(%s(concentrador==false));',nodes_ciudad))
eval(sprintf('LONnc = LON(%s(concentrador==false));',nodes_ciudad))

eval(sprintf('LATch = LAT(%s);',nodes_ciudad))
eval(sprintf('LONch = LON(%s);',nodes_ciudad))

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title(sprintf('Mexico - %s - Grupo %s',ciudad,grupo));

eval(sprintf('n = length(%s)',nodes_ciudad))
for i=1:n
    for j=1:n
        if CM_ciudad(i,j)~=0
            h = plotm([LATch(i) LONch(i); LATch(j) LONch(j)],...
                'o-','Color','b');
            set(h, 'MarkerSize',marker);
        end
    end
end

nc = sum(concentrador);
I = [];

for i=1:nc
    for j=1:nc
        if Kc(i,j)~=0
            I = [I;i j];
            h = plotm([LATc(i) LONc(i); LATc(j) LONc(j)],...
                '+-','Color','m');
            set(h, 'MarkerSize',bigmarker);
        end
    end
end

%textm(CHTUX(1), CHTUX(2),'Tuxtla Gutierrez');
offs = -0.001 + (0.002).*rand(size(LATc));
eval(sprintf('textm(LATc.*(1+offs),LONc, NOMBRES(%s(concentrador==true)));',nodes_ciudad))
offs = -0.001 + (0.002).*rand(size(LATnc));
eval(sprintf('textm(LATnc.*(1+offs),LONnc, NOMBRES(%s(concentrador==false)));',nodes_ciudad))

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

eval(sprintf('h = plotm(%s,''linestyle'',''o'',''Color'',''k'');',ciudad))
set(h, 'MarkerSize',bigmarker);

saveas(figure(5),sprintf('FIGS/FIG-%s-G%s',ciudad,grupo),'fig');