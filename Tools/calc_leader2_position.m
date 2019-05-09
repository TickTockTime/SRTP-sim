%% 工具函数：求解Leader2和Leader1距离关系函数
% Author: Yao Chengtao
% 2018/11/5

%% 初始化参数
syms x y t;

% Leader1的速度参数
v1x = sqrt(2)/2;
v1y = sqrt(2)/2;
yaw = pi/4;
% expect_xd = 2;
% expect_yd = 0;

%% 求解x和y方向的距离函数
dsolve('Dx=v1x+(v1x*t-x)*((v1x*t-x)^2-4)','x(0)=-2*sqrt(2)')
dsolve('Dy=v1y+(v1y*t-y)*((v1y*t-y)^2)','y(0)=-sqrt(2)/2')

%% 测试函数，请不要放到报告中
% [x, y] = dsolve('Dy=v1y+(v1y*t-y)*((cos(yaw)*(v1y*t-y)-sin(yaw)*(v1x*t-x))^2-4)','Dx=v1x+(v1x*t-x)*((sin(yaw)*(v1y*t-y)+cos(yaw)*(v1x*t-x))^2-4)','x(0)=-2*sqrt(2)','y(0)=-sqrt(2)/2')