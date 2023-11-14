%Condiciones de frontera

t0=1;
x0=1;
z0=1;
y0=1;
tf=250;

%pasos e iteraciones

dt=.0001;

n=(tf-t0)/dt;

%Inicializando Vectores Solucion del sistema
t(1)=t0;
x(1)=x0;
y(1)=y0;
z(1)=z0;


for i=1:n
    t(i+1)=t(i)+dt;
    %Los archivo EDO_ROSSELER contienen unicamente cada una de las
    %funciones del sistema de ecuaciones diferenciales
    fx=EDO_ROSSELER_fx(y(i),z(i));
    fy=EDO_ROSSELER_fy(x(i),y(i));
    fz=EDO_ROSSELER_fz(z(i),x(i));
    x(i+1)=x(i)+fx*dt;
    y(i+1)=y(i)+fy*dt;
    z(i+1)=z(i)+fz*dt;
end

%Mostrar evolucion del sistema en 3 dimensiones
figure;
comet3(x,y,z);

%Mostrar el Atractor de Rosseler en 3 dimensiones

% plot3(x,y,z);
% title("Atractor de Rosseler - Solución Método de Euler")


figure;
%Planos de Fase y evolucion temporal
subplot(2,1,1)
plot(x,y);
title("Plano de Fase 'X' & 'Y'")
hold on;
subplot(2,1,2);
comet(t,x);

