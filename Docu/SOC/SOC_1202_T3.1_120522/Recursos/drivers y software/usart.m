s = serial('COM13','BAUD',115200);
try
fopen(s);
fprintf(s,'%c','r');
fin = false;
comando = -1;
enfoque_prev = 0;
while(~fin)
    received = fscanf(s)
    if isempty(received)
        fprintf(s,'%c','n');
    elseif strfind(received,'Espero nuevo comando')==1
        comando = input('0   - Salir\n105 - Get image\n102 - Enfocar\n114 - Reset\nComando: ');
        switch(comando)
            case 0
                fin = 1;
            case 105 % Get image
                fprintf(s,'%c','i');
            case 102 % Enfocar
                fprintf(s,'%c','f');
            case 114 % Reset
                fprintf(s,'%c','r');
        end
    elseif strfind(received,'Operacion: 0')==1 
            %Recibimos la imagen
            display(fscanf(s));
            display(fscanf(s));
            display(fscanf(s));
            
            received = fscanf(s);
            
            fin_receive_image = false;
            data = zeros(20480,2);
            i=1;
            while(~fin_receive_image)
                received = fscanf(s);
                if (strcmp(received,'')==1)
                    fin_receive_image = true;
                elseif (strfind(received,'Fin')==1)
                    fin_receive_image = true;
                else
                    [ind,val]=strtok(received);
                    data(i,1)=str2double(ind);
                    data(i,2)=str2double(val);
                    i = i+1;
                    if mod(i,500)==0
                        display(['Received: ' num2str(floor(i/204.8)) '%']);
                    end
                    
                end
            end
            display('Received: 100%');
            display('Display image');
            close all
            display_image('usart',data,160,128,1);
            fprintf(s,'%c','n');
            fin = 1;
     elseif strfind(received,'Operacion: 1')==1
         % Leemos el enfoque
         fscanf(s);
         fscanf(s);
         fscanf(s);
         fscanf(s);
         fscanf(s);
         enfoque=0;
         while(enfoque==0)
            received = fscanf(s);
            [fun,val]=strtok(received,'=');
            if(isempty(val))
                enfoque = 0;
            else
                enfoque = str2double(val(2:end));
                display(['Enfoque = ' num2str(enfoque) '(' num2str(enfoque-enfoque_prev) ')']);
                enfoque_prev = enfoque;
            end
         end
         
         fin_receive_image = false;
         data = zeros(2500,2);
         i=1;
         while(~fin_receive_image)
             received = fscanf(s);
             if (strcmp(received,'')==1)
                    fin_receive_image = true;
             elseif (strfind(received,'Fin')==1)
                    fin_receive_image = true;
             else
                    [ind,val]=strtok(received);
                    data(i,1)=str2double(ind);
                    data(i,2)=str2double(val);
                    i = i+1;
             end
         end
         close all
         display(fscanf(s));
         display_image('usart',data,50,50,0);
         fprintf(s,'%c','n');
    end
end
fclose(s);

catch err
    display(err.message);
    for i=1:length(err.stack)
        display(['Name: ' err.stack(i).name]);
        display(['Line: ' num2str(err.stack(i).line)]);
    end
    fclose(s);
end