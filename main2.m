clc;
t=[0,50];
m1=2;
m2=2;
l1=2;
l2=2;
g=9.8;

%%Pendulo 1

Z0_1=[pi/2,pi/2,0,-2];
[t_1,z_1]=ode45(@ODEx,t,Z0_1);

X1_1=[l1 ];
Y1_1=[0 ];
X2_1=[l2 ];
Y2_1=[0 ];

Z1_1=z_1(:,1)';
Z2_1=z_1(:,2)';

for k=1:length(z_1(:,1))-1
    X1_1(k+1)=l1*sin(Z1_1(k+1));
    Y1_1(k+1)=-l1*cos(Z1_1(k+1));
    X2_1(k+1)=X1_1(k+1)+l2*sin(Z2_1(k+1));
    Y2_1(k+1)=Y1_1(k+1)-l2*cos(Z2_1(k+1));
   
end

X1_1;
Y1_1;
X2_1;
Y2_1;
length(X1_1)
length(Y1_1)
length(X2_1)
length(Y2_1)
%plot(X1,Y1);
%hold on;
%plot(X2,Y2);



%%Pendulo 2

Z0_2=[pi/2,pi/2,-0.001,-2];
[t_2,z_2]=ode45(@ODEx,t,Z0_2);

X1_2=[l1 ];
Y1_2=[0 ];
X2_2=[l2 ];
Y2_2=[0 ];

Z1_2=z_2(:,1)';
Z2_2=z_2(:,2)';

for k=1:length(z_2(:,1))-1
    X1_2(k+1)=l1*sin(Z1_2(k+1));
    Y1_2(k+1)=-l1*cos(Z1_2(k+1));
    X2_2(k+1)=X1_2(k+1)+l2*sin(Z2_2(k+1));
    Y2_2(k+1)=Y1_2(k+1)-l2*cos(Z2_2(k+1));
   
end

X1_2;
Y1_2;
X2_2;
Y2_2;
length(X1_2)
length(Y1_2)
length(X2_2)
length(Y2_2)


%%XvsY

% figure(1)
% subplot(2,2,1)
% hold on
% xlim([-4.5,4.5])
% ylim([-4.5,4.5])
% xlabel("X1")
% ylabel("Y1")
% title("Pendulo 1")
% plot(X1_1, Y1_1, 'g')
% 
% 
% subplot(2,2,3)
% hold on
% xlim([-4.5,4.5])
% ylim([-4.5,4.5])
% xlabel("X2")
% ylabel("Y2")
% plot(X2_1, Y2_1, 'r')
% 
% 
% subplot(2,2,2)
% hold on
% xlim([-4.5,4.5])
% ylim([-4.5,4.5])
% xlabel("X1")
% ylabel("Y1")
% title("Pendulo 2")
% plot(X1_2, Y1_2,'g')
% 
% subplot(2,2,4)
% hold on
% xlim([-4.5,4.5])
% ylim([-4.5,4.5])
% xlabel("X2")
% ylabel("Y2")
% plot(X2_2, Y2_2,'r')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Theta1VSTheta2
% theta1_1 = z_1(:,1);
% theta2_1 = z_1(:,2);
% 
% theta1_2 = z_2(:,1);
% theta2_2 = z_2(:,2);
% %%Theta1 VS theta2
% 
% figure(1)
% subplot(1,2,1)
% hold on
% xlabel("Theta1")
% ylabel("Theta2")
% title("Pendulo 1")
% plot(theta1_1, theta2_1, 'g')
% 
% 
% subplot(1,2,2)
% hold on
% xlabel("Theta1")
% ylabel("Theta2")
% title("Pendulo 2")
% plot(theta1_2, theta2_2, 'r')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Theta1VStheta1_p
%%Theta2Stheta2_p

% theta1_1 = z_1(:,1);
% theta1_1_p = z_1(:,3);
% theta2_1 = z_1(:,2);
% theta2_1_p = z_1(:,4);
% 
% theta1_2 = z_2(:,1);
% theta1_2_p = z_2(:,3);
% theta2_2 = z_2(:,2);
% theta2_2_p = z_2(:,4);
% 
% figure(1)
% subplot(2,2,1)
% hold on
% xlabel("Theta1")
% ylabel("Theta1_p")
% title("Pendulo 1")
% plot(theta1_1, theta1_1_p, 'g')
% 
% 
% subplot(2,2,3)
% hold on
% xlabel("Theta2")
% ylabel("Theta2_p")
% plot(theta2_1, theta2_1_p, 'r')
% 
% 
% subplot(2,2,2)
% hold on
% xlabel("Theta1")
% ylabel("Theta1_p")
% title("Pendulo 2")
% plot(theta1_2, theta1_2_p,'g')
% 
% subplot(2,2,4)
% hold on
% xlabel("Theta2")
% ylabel("Theta2_p")
% plot(theta2_2, theta2_2_p,'r')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%X Vs t ; Y Vs t

figure(1)
subplot(2,2,1)
hold on
xlabel("t")
ylabel("X1, Y1")
title("Pendulo 1")
plot(t_1, X1_1, 'g')
plot(t_1, Y1_1, 'r')


subplot(2,2,3)
hold on
xlabel("t")
ylabel("X2, Y2")
plot(t_1, X2_1, 'g')
plot(t_1, Y2_1, 'r')


subplot(2,2,2)
hold on
xlabel("t")
ylabel("X1, Y1")
title("Pendulo 2")
plot(t_2, X1_2,'g')
plot(t_2, Y1_2, 'r')

subplot(2,2,4)
hold on
xlabel("t")
ylabel("X2, Y2")
plot(t_2, X2_2, 'g')
plot(t_2, Y2_2,'r')






% size1=length(X1_1);
% size2=length(X2_2);

% k=0;
% if (size1 <= size2)
%     k=size1;
% else
%     k=size2;
% end

%% VIDEO
% x0=[0,0];
% 
% V=VideoWriter('Pendulos.mp4');
% video.FrameRate = 100;
% open(V);
% figure
% 
% 
% set(gcf,'WindowState','fullscreen')
% 
% subplot(1,2,1)
% grid on
% hold on
% xlim([-4.5,4.5])
% ylim([-4.5,4.5])
% xlabel('x')
% ylabel('y')
% title({'Pendulo Doble: l1 = l2 = m1 = m2 = 2';'Condiciones Iniciales: Theta1 = pi/2, Theta2 = pi/2, Omega1 = 0, Omega2 = -2'})
% daspect([2 2 2])
% 
% subplot(1,2,2)
% grid on
% hold on
% xlim([-4.5,4.5])
% ylim([-4.5,4.5])
% xlabel('x')
% ylabel('y')
% title({'Pendulo Doble: l1 = l2 = m1 = m2 = 2';'Condiciones Iniciales: Theta1 = pi/2, Theta2 = pi/2, Omega1 = -0.001, Omega2 = -2'})
% daspect([2 2 2])
% 
% for i=1:k
%     p1_1=[X1_1(i),Y1_1(i)];
%     p2_1=[X2_1(i),Y2_1(i)];
%     [a1_1,b1_1]=line2points(x0,p1_1);
%     [a2_1,b2_1]=line2points(p1_1,p2_1);
%     
%     p1_2=[X1_2(i),Y1_2(i)];
%     p2_2=[X2_2(i),Y2_2(i)];
%     [a1_2,b1_2]=line2points(x0,p1_2);
%     [a2_2,b2_2]=line2points(p1_2,p2_2);
%     
%     subplot(1,2,1)
%     plot(X1_1(i),Y1_1(i),'b','Marker','.','MarkerSize',50);
%     plot(X2_1(i),Y2_1(i),'p','Marker','.','MarkerSize',50);
%     plot(a1_1,b1_1,'r','LineWidth',5);
%     plot(a2_1,b2_1,'g','LineWidth',5);
%     
%     
%     subplot(1,2,2)
%     plot(X1_2(i),Y1_2(i),'b','Marker','.','MarkerSize',50);
%     plot(X2_2(i),Y2_2(i),'p','Marker','.','MarkerSize',50);
%     plot(a1_2,b1_2,'r','LineWidth',5);
%     plot(a2_2,b2_2,'g','LineWidth',5);
%     
%     
%     
%     F=getframe(gcf);
%     writeVideo(V,F);
%     subplot(1,2,1)
%     cla
%     subplot(1,2,2)
%     cla
%    
%     
%     
% end
% 
% close(V);