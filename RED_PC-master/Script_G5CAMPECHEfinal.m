% script_G5CAMPECHEfinal.m
%
% Computes:
% - Matrix for CAMPECHE group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with CAMPECHE)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_CAMPECHE
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_CAMPECHE = POB(nodes_CAMPECHE);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_CAMPECHE, dist_CAMPECHE);

% force CAMPECHE into the main nodes.
concentrador(LAT(nodes_CAMPECHE)==CAMPECHE(1)) = true;
concentrador(POB_CAMPECHE<=minpop) = false;

Dc = dist_CAMPECHE(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_CAMPECHE, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_CAMPECHE,...
                                             dist_CAMPECHE);
CM_CAMPECHE = zeros(size(dist_CAMPECHE)); %full conectivity matrix.
concentrators = nodes_CAMPECHE(concentrador==true);

localindx = 1:length(nodes_CAMPECHE);
for i=1:numberOfGroups
    Dindx = dist_CAMPECHE(groupindx==i,groupindx==i);
    Nindx = nodes_CAMPECHE(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_CAMPECHE(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_CAMPECHE(concentrador==true, concentrador==true) = Kc;

cell_CAMPECHE  = toCell(NOMBRES(nodes_CAMPECHE), CM_CAMPECHE, 'Matriz-CAMPECHE-G5.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_CAMPECHE(concentrador==true));
LONc = LON(nodes_CAMPECHE(concentrador==true));

LATnc = LAT(nodes_CAMPECHE(concentrador==false));
LONnc = LON(nodes_CAMPECHE(concentrador==false));

LATch = LAT(nodes_CAMPECHE);
LONch = LON(nodes_CAMPECHE);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - CAMPECHE - Grupo 5');

n = length(nodes_CAMPECHE);

for i=1:n
    for j=1:n
        if CM_CAMPECHE(i,j)~=0
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
    NOMBRES(nodes_CAMPECHE(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(CAMPECHE,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);