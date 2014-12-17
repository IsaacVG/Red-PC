% script_G9TORREONfinal.m
%
% Computes:
% - Matrix for TORREON group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with TORREON)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_TORREON
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_TORREON = POB(nodes_TORREON);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_TORREON, dist_TORREON);

% force TORREON into the main nodes.
concentrador(LAT(nodes_TORREON)==TORREON(1)) = true;
concentrador(POB_TORREON<=minpop) = false;

Dc = dist_TORREON(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_TORREON, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_TORREON,...
                                             dist_TORREON);
CM_TORREON = zeros(size(dist_TORREON)); %full conectivity matrix.
concentrators = nodes_TORREON(concentrador==true);

localindx = 1:length(nodes_TORREON);
for i=1:numberOfGroups
    Dindx = dist_TORREON(groupindx==i,groupindx==i);
    Nindx = nodes_TORREON(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_TORREON(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_TORREON(concentrador==true, concentrador==true) = Kc;

cell_TORREON  = toCell(NOMBRES(nodes_TORREON), CM_TORREON, 'Matriz-TORREON-G9.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_TORREON(concentrador==true));
LONc = LON(nodes_TORREON(concentrador==true));

LATnc = LAT(nodes_TORREON(concentrador==false));
LONnc = LON(nodes_TORREON(concentrador==false));

LATch = LAT(nodes_TORREON);
LONch = LON(nodes_TORREON);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - TORREON - Grupo 9');

n = length(nodes_TORREON);

for i=1:n
    for j=1:n
        if CM_TORREON(i,j)~=0
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
    NOMBRES(nodes_TORREON(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(TORREON,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);