% script_G11ECATEPECfinal.m
%
% Computes:
% - Matrix for ECATEPEC group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with ECATEPEC)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_ECATEPEC
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_ECATEPEC = POB(nodes_ECATEPEC);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_ECATEPEC, dist_ECATEPEC);

% force ECATEPEC into the main nodes.
concentrador(LAT(nodes_ECATEPEC)==ECATEPEC(1)) = true;
concentrador(POB_ECATEPEC<=minpop) = false;

Dc = dist_ECATEPEC(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_ECATEPEC, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_ECATEPEC,...
                                             dist_ECATEPEC);
CM_ECATEPEC = zeros(size(dist_ECATEPEC)); %full conectivity matrix.
concentrators = nodes_ECATEPEC(concentrador==true);

localindx = 1:length(nodes_ECATEPEC);
for i=1:numberOfGroups
    Dindx = dist_ECATEPEC(groupindx==i,groupindx==i);
    Nindx = nodes_ECATEPEC(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_ECATEPEC(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_ECATEPEC(concentrador==true, concentrador==true) = Kc;

cell_ECATEPEC  = toCell(NOMBRES(nodes_ECATEPEC), CM_ECATEPEC, 'Matriz-ECATEPEC-G11.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_ECATEPEC(concentrador==true));
LONc = LON(nodes_ECATEPEC(concentrador==true));

LATnc = LAT(nodes_ECATEPEC(concentrador==false));
LONnc = LON(nodes_ECATEPEC(concentrador==false));

LATch = LAT(nodes_ECATEPEC);
LONch = LON(nodes_ECATEPEC);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - ECATEPEC - Grupo 11');

n = length(nodes_ECATEPEC);

for i=1:n
    for j=1:n
        if CM_ECATEPEC(i,j)~=0
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
textm(LATc.*(1+offs),LONc,...
    NOMBRES(nodes_ECATEPEC(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(ECATEPEC,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);