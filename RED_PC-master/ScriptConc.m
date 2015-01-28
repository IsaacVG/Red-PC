%Para convertir el .MAT al .csv

ciudad = 'TEHUACAN';
grupo = '50';
mat_ciudad = sprintf('MAT_%s',ciudad);
nodes_ciudad = sprintf('nodes_%s',ciudad);
dist_ciudad = sprintf('dist_%s',ciudad);


load(mat_ciudad)

load MAT_fullDistance

nombre_arch = sprintf('MATRICES/Conc/MatrizConcSolv-%s-G%s.csv', ciudad, grupo);
eval(sprintf('cell_ciudad  = toCell(NOMBRES(%s), %s, nombre_arch );',nodes_ciudad, dist_ciudad));
%eval(sprintf('csvwrite(nombre_arch,%s)',dist_ciudad));
