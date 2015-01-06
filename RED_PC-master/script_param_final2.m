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
ciudad = 'HERMOSILLO';
grupo = '2';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);


load(mat_ciudad)

load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 700000; % min population to be concentrator
%
eval(sprintf('POB_ciudad = POB(%s);',nodes_ciudad))

eval(sprintf('[nodos concentrador v freqs] = dysartGeorganas(4, %s, %s);',nodes_ciudad,dist_ciudad))
% force Chiapas/Tuxtla City into the main nodes.
concentrador(POB_ciudad<=minpop) = false;
eval(sprintf('concentrador(LAT(%s)==%s(1)) = true;',nodes_ciudad,ciudad))
eval(sprintf('concentrador(IDS(%s)==3285) = true;',nodes_ciudad))
eval(sprintf('concentrador(IDS(%s)==3462) = true;',nodes_ciudad))
%eval(sprintf('concentrador(IDS(%s)==3463) = false;',nodes_ciudad))
%eval(sprintf('concentrador(IDS(%s)==3535) = false;',nodes_ciudad))

%Forced IDS
%MERIDA[50000] = 3627, 3351, 3497
%HERMOSILLO[700000] = 3285, 3462
%QUERETARO[100000] = 2938
%ECATEPEC[700000] = 3613, 3416
%CULIACAN[100000] = 3471
%CHTUX[50000] = 3516
%AGUASCALIENTES[40000]  = 2985,3429
%CHIHUAHUA[40000]  = 3647
%CdVALLES[40000] = 3248
%TAPACHULA[17000] = 3120
%TEJUPILCO[50000] = -
%SLP[17000] = false 3577, 3342
%VERACRUZ[50000] = 2594
%PINOTEPA[50000] = 918,2800
%POZARICA[50000] = 3395
%IZTAPALAPA[700000] sin off en mapa = 3525, 3379
%TOLUCA[50000] sin off en mapa = 3116, 1590
%LEON[50000] = false 3491
%DURANGO[50000] = -
%OAXACA[50000] = 2964, 3023
%MONTERREY[600000] = 3621, 3612, 3470
%CdVICTORIA[600000] = 3506, 3587
%CdCARMEN[600000] = 3345, 3411 
%SALINACRUZ[600000] = 3148, 2442
%HUAJUAPAN[600000] = 3234, 3297
%VILLAHERMOSA[20000] = 3512, false 3195
%COLIMA[100000] = 3517, 3422, false 3531
%COATZACOALCOS[100000] = 3437, 3521, false 3527
%MORELIA[100000] = 3444
%ZAMORA[100000] = 3502, 3503
%ACAPULCO[100000] = 2930
%NvoLAREDO[100000] = 3544
%ZITACUARO[100000] = 3362, 3209
%GUADALAJARA[100000] = 3187, 3510, 3372
%PtoESCONDIDO[100000] = -
%IXQUIMILPAN[100000] = 3317, 3359
%CELAYA[55000] = -
%PUEBLA[55000] = 3440, false 3463, false 3511
%ZACATECAS[50000] = 3175, false 3539
%TEHUACAN[100000] = 3426, false 3535
%MAZATLAN[100000] = -

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
eval(sprintf('textm(LATc.*(1),LONc, NOMBRES(%s(concentrador==true)));',nodes_ciudad))
offs = -0.001 + (0.002).*rand(size(LATnc));
eval(sprintf('textm(LATnc.*(1),LONnc, NOMBRES(%s(concentrador==false)));',nodes_ciudad))

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

eval(sprintf('h = plotm(%s,''linestyle'',''o'',''Color'',''k'');',ciudad))
set(h, 'MarkerSize',bigmarker);

saveas(figure(5),sprintf('FIGS/FIG-%s-G%s',ciudad,grupo),'fig');