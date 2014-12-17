% script_G7TIJUANAfinal.m
%
% Computes:
% - Matrix for TIJUANA group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with TIJUANA)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_TIJUANA
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_TIJUANA = POB(nodes_TIJUANA);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_TIJUANA, dist_TIJUANA);

% force TIJUANA into the main nodes.
concentrador(LAT(nodes_TIJUANA)==TIJUANA(1)) = true;
concentrador(POB_TIJUANA<=minpop) = false;

Dc = dist_TIJUANA(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_TIJUANA, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_TIJUANA,...
                                             dist_TIJUANA);
CM_TIJUANA = zeros(size(dist_TIJUANA)); %full conectivity matrix.
concentrators = nodes_TIJUANA(concentrador==true);

localindx = 1:length(nodes_TIJUANA);
for i=1:numberOfGroups
    Dindx = dist_TIJUANA(groupindx==i,groupindx==i);
    Nindx = nodes_TIJUANA(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_TIJUANA(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_TIJUANA(concentrador==true, concentrador==true) = Kc;

cell_TIJUANA  = toCell(NOMBRES(nodes_TIJUANA), CM_TIJUANA, 'Matriz-TIJUANA-G7.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_TIJUANA(concentrador==true));
LONc = LON(nodes_TIJUANA(concentrador==true));

LATnc = LAT(nodes_TIJUANA(concentrador==false));
LONnc = LON(nodes_TIJUANA(concentrador==false));

LATch = LAT(nodes_TIJUANA);
LONch = LON(nodes_TIJUANA);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - TIJUANA - Grupo 7');

n = length(nodes_TIJUANA);

for i=1:n
    for j=1:n
        if CM_TIJUANA(i,j)~=0
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
    NOMBRES(nodes_TIJUANA(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(TIJUANA,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);