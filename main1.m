clc;
t=[0,50];
m1=2;
m2=2;
l1=2;
l2=2;
g=9.8;

Z0=[0,0,0,0];
[t,z]=ode45(@ODEx,t,Z0);

X1=[l1 ];
Y1=[0 ];
X2=[l2 ];
Y2=[0 ];

Z1=z(:,1)';
Z2=z(:,2)';

for k=1:length(z(:,1))-1
    X1(k+1)=l1*sin(Z1(k+1));
    Y1(k+1)=-l1*cos(Z1(k+1));
    X2(k+1)=X1(k+1)+l2*sin(Z2(k+1));
    Y2(k+1)=Y1(k+1)-l2*cos(Z2(k+1));
   
end

X1;
Y1;
X2;
Y2;
length(X1)
length(Y1)
length(X2)
length(Y2)
%plot(X1,Y1);
%hold on;
%plot(X2,Y2);

x0=[0,0];

V=VideoWriter('Pendulo.mp4');
video.FrameRate = 100;
open(V);

figure(1)
grid on
xlim([-4.5,4.5])
ylim([-4.5,3])
xlabel('x')
ylabel('y')
title({'Pendulo Doble: l1 = l2 = m1 = m2 = 2';'Condiciones Iniciales: Theta1 = 0, Theta2 = 0, Omega1 = 0, Omega2 = 0'})

hold on 
for i=1:length(X1)
    p1=[X1(i),Y1(i)];
    p2=[X2(i),Y2(i)];
    [a1,b1]=line2points(x0,p1);
    [a2,b2]=line2points(p1,p2);
    plot(X1(i),Y1(i),'b','Marker','.','MarkerSize',50);
    plot(X2(i),Y2(i),'p','Marker','.','MarkerSize',50);
    plot(a1,b1,'r','LineWidth',5);
    plot(a2,b2,'g','LineWidth',5);
    F=getframe(gcf);
    writeVideo(V,F);
    cla
    
end

close(V);




