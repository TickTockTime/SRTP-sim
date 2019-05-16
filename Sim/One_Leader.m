%% 初始化参数
syms x v t;
t=0:0.1:15;
% Leader1参数
xc1x=-cos(t);
xc1y=sin(t);
xc1z=5+t*0;
vc1x=sin(t);
vc1y=cos(t);
vc1z=0;

% % Leader2参数
% xc2x=-2*cos(t);
% xc2y=2*sin(t);
% xc2z=5;
% vc2x=2*sin(t);
% vc2y=2*cos(t);
% vc2z=0;

% follower1参数
x1 = [-1.5; 1; 0];
v1 = [0; 0; 0];
ex1 = [0; 0.5; 0];
% exx1 = [-0.5; 0.5; 0];
% follower2参数
x2 = [1; 1; 0];
v2 = [0; 2; 0];
ex2 = [-0.5; 0; 0];
% exx2 = [-1.5; 0; 0];
% follower3参数
x3 = [0.5; 1; 0];
v3 = [0; 0; 0];
ex3 = [0; -0.5; 0];
% exx3 = [-0.5; -0.5; 0];
% follower4参数
x4 = [0.5; 0; 0];
v4 = [0; 0; 0];
ex4 = [0.5; 0; 0];
% exx4 = [0.5; 0; 0];

% [v, x] = dsolve('Dx=v','Dv=cos(t)-((x-ex1(1)+cos(t))+2*(v-sin(t)))','v(0)=v1(1)','x(0)=x1(1)','t') 
% [v, x] = dsolve('Dx=v','Dv=-sin(t)-((x-ex1(2)-sin(t))+2*(v-cos(t)))','v(0)=v1(2)','x(0)=x1(2)','t') 
% [v, x] = dsolve('Dx=v','Dv=-((x-ex1(3)-xc1z)+2*(v-vc1z))','v(0)=v1(3)','x(0)=x1(3)','t')

[tmp, l] = size(t);
x1x=exp(-t) + ex1(1) - cos(t) + t.*exp(-t) + exp(-t).*x1(1) - ex1(1).*exp(-t) - t.*ex1(1).*exp(-t) + t.*exp(-t).*v1(1) + t.*exp(-t).*x1(1);
x1y=ex1(2) + sin(t) - t.*exp(-t) + exp(-t).*x1(2) - ex1(2).*exp(-t) - t.*ex1(2).*exp(-t) + t.*exp(-t).*v1(2) + t.*exp(-t).*x1(2);
x1z=- (exp(-t) + t.*exp(-t)).*(2.*vc1z + xc1z + ex1(3) - v1(3) - x1(3) - exp(t).*(2.*vc1z + xc1z + ex1(3))) - exp(-t).*(v1(3) + t.*exp(t).*(2.*vc1z + xc1z + ex1(3)));

x2x=exp(-t) + ex2(1) - cos(t) + t.*exp(-t) + exp(-t).*x2(1) - ex2(1).*exp(-t) - t.*ex2(1).*exp(-t) + t.*exp(-t).*v2(1) + t.*exp(-t).*x2(1);
x2y=ex2(2) + sin(t) - t.*exp(-t) + exp(-t).*x2(2) - ex2(2).*exp(-t) - t.*ex2(2).*exp(-t) + t.*exp(-t).*v2(2) + t.*exp(-t).*x2(2);
x2z=- (exp(-t) + t.*exp(-t)).*(2.*vc1z + xc1z + ex2(3) - v2(3) - x2(3) - exp(t).*(2.*vc1z + xc1z + ex2(3))) - exp(-t).*(v2(3) + t.*exp(t).*(2.*vc1z + xc1z + ex2(3)));

x3x=exp(-t) + ex3(1) - cos(t) + t.*exp(-t) + exp(-t).*x3(1) - ex3(1).*exp(-t) - t.*ex3(1).*exp(-t) + t.*exp(-t).*v3(1) + t.*exp(-t).*x3(1);
x3y=ex3(2) + sin(t) - t.*exp(-t) + exp(-t).*x3(2) - ex3(2).*exp(-t) - t.*ex3(2).*exp(-t) + t.*exp(-t).*v3(2) + t.*exp(-t).*x3(2);
x3z=- (exp(-t) + t.*exp(-t)).*(2.*vc1z + xc1z + ex3(3) - v3(3) - x3(3) - exp(t).*(2.*vc1z + xc1z + ex3(3))) - exp(-t).*(v3(3) + t.*exp(t).*(2.*vc1z + xc1z + ex3(3)));

x4x=exp(-t) + ex4(1) - cos(t) + t.*exp(-t) + exp(-t).*x4(1) - ex4(1).*exp(-t) - t.*ex4(1).*exp(-t) + t.*exp(-t).*v4(1) + t.*exp(-t).*x4(1);
x4y=ex4(2) + sin(t) - t.*exp(-t) + exp(-t).*x4(2) - ex4(2).*exp(-t) - t.*ex4(2).*exp(-t) + t.*exp(-t).*v4(2) + t.*exp(-t).*x4(2);
x4z=- (exp(-t) + t.*exp(-t)).*(2.*vc1z + xc1z + ex4(3) - v4(3) - x4(3) - exp(t).*(2.*vc1z + xc1z + ex4(3))) - exp(-t).*(v4(3) + t.*exp(t).*(2.*vc1z + xc1z + ex4(3)));

figure(1);
plot3(xc1x, xc1y, xc1z);hold on
plot3(x1x(1,:),x1y(1,:),x1z(1,:),'LineWidth',1.5);hold on
plot3(x2x(1,:),x2y(1,:),x2z(1,:),'LineWidth',1.5);hold on
plot3(x3x(1,:),x3y(1,:),x3z(1,:),'LineWidth',1.5);hold on
plot3(x4x(1,:),x4y(1,:),x4z(1,:),'LineWidth',1.5);hold on

scatter3(x1x(1,l),x1y(1,l),x1z(1,l),'filled');
scatter3(x2x(1,l),x2y(1,l),x2z(1,l),'filled');
scatter3(xc1x(1,l),xc1y(1,l),xc1z(1,l),'filled');
scatter3(x3x(1,l),x3y(1,l),x3z(1,l),'filled');
scatter3(x4x(1,l),x4y(1,l),x4z(1,l),'filled');
axis([-3,3,-3,3,0,6]);
title('编队跟随')
legend('l1','f1','f2','f3','f4');
xlabel("x");
ylabel("y");
zlabel("z");

grid on


figure(2)

subplot(311);
plot(t,x1x,'LineWidth',1.5);hold on
plot(t,x2x,'LineWidth',1.5);hold on
plot(t,x3x,'LineWidth',1.5);hold on
plot(t,x4x,'LineWidth',1.5);hold on
title('跟随机x方向的位置')
legend('f1','f2','f3','f4');
xlabel("t/s");
ylabel("x position/m");

subplot(312);
plot(t,x1y,'LineWidth',1.5);hold on
plot(t,x2y,'LineWidth',1.5);hold on
plot(t,x3y,'LineWidth',1.5);hold on
plot(t,x4y,'LineWidth',1.5);hold on
title('跟随机y方向的位置')
legend('f1','f2','f3','f4');
xlabel("t/s");
ylabel("y position/m");

subplot(313);
plot(t,x1z,'LineWidth',1.5);hold on
plot(t,x2z,'LineWidth',1.5);hold on
plot(t,x3z,'LineWidth',1.5);hold on
plot(t,x4z,'LineWidth',1.5);hold on
title('跟随机z方向的位置')
legend('f1','f2','f3','f4');
xlabel("t/s");
ylabel("z position/m");