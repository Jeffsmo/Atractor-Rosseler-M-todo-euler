t0=1;
x0=1;
z0=1;
y0=1;
tf=250;

dt=.0001;

n=(tf-t0)/dt;

t(1)=t0;
x(1)=x0;
y(1)=y0;
z(1)=z0;


for i=1:n
    t(i+1)=t(i)+dt;
    fx=EDO_ROSSELER_fx(y(i),z(i));
    fy=EDO_ROSSELER_fy(x(i),y(i));
    fz=EDO_ROSSELER_fz(z(i),x(i));
    x(i+1)=x(i)+fx*dt;
    y(i+1)=y(i)+fy*dt;
    z(i+1)=z(i)+fz*dt;
end
figure;
comet3(x,y,z);

% plot3(x,y,z);
% title("Atractor de Rosseler - Solución Método de Euler")


figure;

subplot(2,1,1)
plot(x,y);
title("Plano de Fase 'X' & 'Y'")
hold on;
subplot(2,1,2);
comet(t,x);

