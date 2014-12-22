% script_G12QUERETAROfinal.m
%
% Computes:
% - Matrix for QUERETARO group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with QUERETARO)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_QUERETARO
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_QUERETARO = POB(nodes_QUERETARO);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_QUERETARO, dist_QUERETARO);

% force QUERETARO into the main nodes.
concentrador(LAT(nodes_QUERETARO)==QUERETARO(1)) = true;
concentrador(POB_QUERETARO<=minpop) = false;

Dc = dist_QUERETARO(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_QUERETARO, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_QUERETARO,...
                                             dist_QUERETARO);
CM_QUERETARO = zeros(size(dist_QUERETARO)); %full conectivity matrix.
concentrators = nodes_QUERETARO(concentrador==true);

localindx = 1:length(nodes_QUERETARO);
for i=1:numberOfGroups
    Dindx = dist_QUERETARO(groupindx==i,groupindx==i);
    Nindx = nodes_QUERETARO(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_QUERETARO(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_QUERETARO(concentrador==true, concentrador==true) = Kc;

cell_QUERETARO  = toCell(NOMBRES(nodes_QUERETARO), CM_QUERETARO, 'Matriz-QUERETARO-G12.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_QUERETARO(concentrador==true));
LONc = LON(nodes_QUERETARO(concentrador==true));

LATnc = LAT(nodes_QUERETARO(concentrador==false));
LONnc = LON(nodes_QUERETARO(concentrador==false));

LATch = LAT(nodes_QUERETARO);
LONch = LON(nodes_QUERETARO);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - QUERETARO - Grupo 12');

n = length(nodes_QUERETARO);

for i=1:n
    for j=1:n
        if CM_QUERETARO(i,j)~=0
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
    NOMBRES(nodes_QUERETARO(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(QUERETARO,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);