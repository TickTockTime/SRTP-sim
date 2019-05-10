%% Leader2距离控制
% Author: Yao Chengtao
% 2018/11/10

%% 初始化参数
% 初始位置 Leader1:(0, 0) Leader2(-2sqrt(2),-sqrt(2)/2)
% Leader1初始偏航角:pi/4
% 假定Leader1匀速飞行 v1 = [v1x = sqrt(2)/2; v1y = sqrt(2)/2]
% 设置Leader1的轨迹 x1 = [v1x*t; v1y*t]
% 控制Leader2和Leader1之间保持距离（2, 2）->变为（2,0）
% Leader2初始速度为（0,0）

t = 0:0.1:10;
% Leader1参数
v1x = sqrt(2)/2;
v1y = sqrt(2)/2;
v1 = [v1x; v1y];
x1 = v1.*t;

% Leader2参数
% x2 = [t.*v1y-exp(4.*t)./((exp(8.*t)./4-1/8).^(1/2)); t.*v1y-exp(4.*t)./((exp(8.*t)./4+7/4).^(1/2))];
figure(1);
x2 = [t.*v1y-exp(4.*t)./((exp(8.*t)./4-1/8).^(1/2)); t.*v1y-1./((2.*t+1/8).^(1/2))];
plot(x1(1,:), x1(2,:),'r-','LineWidth',2);hold on
plot(x2(1,:), x2(2,:),'b','LineWidth',2);hold on

xlabel('x/m');
ylabel('y/m');

figure(2);
fd = t.*v1y-exp(4.*t)./((exp(8.*t)./4-1/8).^(1/2))-sqrt(2)/2.*t;
plot(t, fd);hold on

figure(3)
sd = t.*v1y-1./((2.*t+1/8).^(1/2))-sqrt(2)/2.*t;
plot(t, sd);hold on