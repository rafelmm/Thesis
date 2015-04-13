function [I,indice_enfoque] = read_image(fileName,width,height,header_lines)
DELIMITER = ' ';
HEADERLINES = header_lines;
readdata = importdata(fileName, DELIMITER, HEADERLINES);
data = readdata.data;

I = display_image(data,width,height);


