function [I,indice_enfoque] = read_image(fileName,width,height)
DELIMITER = ' ';
HEADERLINES = 5;
readdata = importdata(fileName, DELIMITER, HEADERLINES);
data = readdata.data;

[I, indice_enfoque] = display_image(fileName,data,width,height,1);


