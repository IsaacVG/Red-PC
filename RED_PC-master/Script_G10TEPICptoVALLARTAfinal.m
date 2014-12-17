% script_G10TEPICfinal.m
%
% Computes:
% - Matrix for TEPIC group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with TEPIC and Puerto Vallarta)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_TEPIC
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_TEPIC = POB(nodes_TEPIC);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_TEPIC, dist_TEPIC);

% force TEPIC and Puerto Vallarta into the main nodes.
concentrador(LAT(nodes_TEPIC)==TEPIC(1)) = true;
concentrador(LAT(nodes_TEPIC)==PtoVALLARTA(1)) = true;
concentrador(POB_TEPIC<=minpop) = false;

Dc = dist_TEPIC(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_TEPIC, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_TEPIC,...
                                             dist_TEPIC);
CM_TEPIC = zeros(size(dist_TEPIC)); %full conectivity matrix.
concentrators = nodes_TEPIC(concentrador==true);

localindx = 1:length(nodes_TEPIC);
for i=1:numberOfGroups
    Dindx = dist_TEPIC(groupindx==i,groupindx==i);
    Nindx = nodes_TEPIC(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_TEPIC(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_TEPIC(concentrador==true, concentrador==true) = Kc;

cell_TEPIC  = toCell(NOMBRES(nodes_TEPIC), CM_TEPIC, 'Matriz-TEPIC-G10.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_TEPIC(concentrador==true));
LONc = LON(nodes_TEPIC(concentrador==true));

LATnc = LAT(nodes_TEPIC(concentrador==false));
LONnc = LON(nodes_TEPIC(concentrador==false));

LATch = LAT(nodes_TEPIC);
LONch = LON(nodes_TEPIC);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - TEPIC - Grupo 10');

n = length(nodes_TEPIC);

for i=1:n
    for j=1:n
        if CM_TEPIC(i,j)~=0
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
    NOMBRES(nodes_TEPIC(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(TEPIC,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);