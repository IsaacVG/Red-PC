% script_G6CUERNAVACAfinal.m
%
% Computes:
% - Matrix for CUERNAVACA group.
% - Dysart-Georganas algorithm.
% - Steiglitz-Weiner-Kleitman algorithm for Dysart's 
%   concentrators (along with CUERNAVACA)
% - Plot of group, with connected concentrators.
% 

clear all
close all
clc

load MAT_CUERNAVACA
load MAT_fullDistance

% Parameters
k = 4; % Connectivity for Dysart-Georganas
R = 3; % Redundancy for Steiglitz-Weiner-Kleitman
minpop = 20000; % min population to be concentrator
%

POB_CUERNAVACA = POB(nodes_CUERNAVACA);

[nodos concentrador v freqs] = ...
    dysartGeorganas(4, nodes_CUERNAVACA, dist_CUERNAVACA);

% force CUERNAVACA into the main nodes.
concentrador(LAT(nodes_CUERNAVACA)==CUERNAVACA(1)) = true;
concentrador(POB_CUERNAVACA<=minpop) = false;

Dc = dist_CUERNAVACA(concentrador==true, ...
                concentrador==true);
%
[Kc, totDist, defi, permi] = ...
    steiglitzWeinerKleitman1(Dc, concentrador, ...
                            nodes_CUERNAVACA, 2, 100);
                        
                        
[groupindx, numberOfGroups] = buildSubgroups(concentrador,...
                                             nodes_CUERNAVACA,...
                                             dist_CUERNAVACA);
CM_CUERNAVACA = zeros(size(dist_CUERNAVACA)); %full conectivity matrix.
concentrators = nodes_CUERNAVACA(concentrador==true);

localindx = 1:length(nodes_CUERNAVACA);
for i=1:numberOfGroups
    Dindx = dist_CUERNAVACA(groupindx==i,groupindx==i);
    Nindx = nodes_CUERNAVACA(groupindx==i);
    Cindx = concentrators(i);
    
    Kret = esauWilliams(Dindx, Cindx, Nindx);
    CM_CUERNAVACA(groupindx==i,groupindx==i) = Kret;
end
               
% FULL CONECTIVITY MATRIX!!
CM_CUERNAVACA(concentrador==true, concentrador==true) = Kc;

cell_CUERNAVACA  = toCell(NOMBRES(nodes_CUERNAVACA), CM_CUERNAVACA, 'Matriz-CUERNAVACA-G6.csv');

% Plot
clc
% meaningless variables (just to plot pretty)
marker = 4;
bigmarker = 2*marker;
colour = 0.8.*[rand(1) rand(1) rand(1)];
cities = ones(size(colour)) - colour;

% LatLong discriminated by concentrators
LATc = LAT(nodes_CUERNAVACA(concentrador==true));
LONc = LON(nodes_CUERNAVACA(concentrador==true));

LATnc = LAT(nodes_CUERNAVACA(concentrador==false));
LONnc = LON(nodes_CUERNAVACA(concentrador==false));

LATch = LAT(nodes_CUERNAVACA);
LONch = LON(nodes_CUERNAVACA);

figure(5)
worldmap('Mexico')
load coast
plotm(lat,long)

title('Mexico - CUERNAVACA - Grupo 6');

n = length(nodes_CUERNAVACA);

for i=1:n
    for j=1:n
        if CM_CUERNAVACA(i,j)~=0
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
    NOMBRES(nodes_CUERNAVACA(concentrador==true)));

h = plotm([LATc(nc) LONc(nc); LATc(1) LONc(1)],...
           '*-','Color','m');
set(h, 'MarkerSize',bigmarker);

h = plotm(LATnc, LONnc,...
    'linestyle','o','Color','b');
set(h, 'MarkerSize',marker);

h = plotm(CUERNAVACA,...
    'linestyle','o','Color','k');
set(h, 'MarkerSize',bigmarker);