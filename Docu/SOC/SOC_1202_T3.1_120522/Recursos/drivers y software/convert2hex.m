function [hex] = convert2hex(num)
in = num;

i=1;
while (num>=16)
q=floor(num/16);
r(i)=mod(num,16);
num=q;
i=i+1;
end

hex=['0x' digit2hex(num)];

if(in~=num)
    for i=length(r):-1:1
        hex=[hex digit2hex(r(i))]    
    end
end


function [hex1]=digit2hex(d)
switch(d)
    case {0,1,2,3,4,5,6,7,8,9}
        hex1=num2str(d);
    case 10
        hex1='A';
    case 11
         hex1='B';
    case 12
         hex1='C';
    case 13
         hex1='D';
    case 14
         hex1='E';
    case 15
         hex1='F';
end
   