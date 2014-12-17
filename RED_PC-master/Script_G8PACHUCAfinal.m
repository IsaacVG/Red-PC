% script_G8PACHUCAfinal.m
%
% Computes:
% - Matrix for PACHUCA group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with PACHUCA)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_PACHUCA
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_PACHUCA = POB(nodes_PACHUCA);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_PACHUCA, dist_PACHUCA);

% force PACHUCA into the main nodes.
concentrador(LAT(nodes_PACHUCA)==PACHUCA(1)) = true;
concentrador(POB_PACHUCA<=minpop) = false;

Dc = dist_PACHUCA(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_PACHUCA, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_PACHUCA,...
                                             dist_PACHUCA);
CM_PACHUCA = zeros(size(dist_PACHUCA)); %full conectivity matrix.
concentrators = nodes_PACHUCA(concentrador==true);

localindx = 1:length(nodes_PACHUCA);
for i=1:numberOfGroups
    Dindx = dist_PACHUCA(groupindx==i,groupindx==i);
    Nindx = nodes_PACHUCA(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_PACHUCA(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_PACHUCA(concentrador==true, concentrador==true) = Kc;

cell_PACHUCA  = toCell(NOMBRES(nodes_PACHUCA), CM_PACHUCA, 'Matriz-PACHUCA-G8.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_PACHUCA(concentrador==true));
LONc = LON(nodes_PACHUCA(concentrador==true));

LATnc = LAT(nodes_PACHUCA(concentrador==false));
LONnc = LON(nodes_PACHUCA(concentrador==false));

LATch = LAT(nodes_PACHUCA);
LONch = LON(nodes_PACHUCA);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - PACHUCA - Grupo 8');

n = length(nodes_PACHUCA);

for i=1:n
    for j=1:n
        if CM_PACHUCA(i,j)~=0
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
    NOMBRES(nodes_PACHUCA(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(PACHUCA,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);