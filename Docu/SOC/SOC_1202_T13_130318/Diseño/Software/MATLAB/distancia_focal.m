%D: Distancia del sensor fins l'objecte enfocat en mm
%w: Amplada del pla d'enfoc en mm
%f: Distancia focal de la lent

%% 1. Donada l'amplada del pla d'enfoc calcula la distancia focal
D=150;
w=[100 200];

f=4.8*D./w;

%% 2. Donada la distancia focal calcula l'amplada del pla d'enfoc
D=150;
f=4.3;

w=D*4.8/f;

%% 3. Distancia entre la lente y el sensor
S1=150;
f=[6;4.3];
S2=1./(1./f-1/S1);
