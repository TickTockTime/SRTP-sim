%% 工具函数：求解Leader2领航机偏航角函数
% Author: Yao Chengtao
% 2018/11/5

%% 参数初始化
syms y t;

fd = 0.5;
v1x = -0.5*sin(0.25*t);
v1y = 0.5*cos(0.5*t);
v1 = sqrt( v1x.^2 + v1y.^2);
yaw1 = atan2( v1x, v1y);

%% 求解不同初始偏航角的Leader2偏航角函数
dsolve('Dy=v1/fd*sin(yaw1-y)','y(0)=pi/2')                                  % 初始偏航角：pi/2
dsolve('Dy=v1/fd*sin(yaw1-y)','y(0)=-pi/2')                                 % 初始偏航角：-pi/2
dsolve('Dy=v1/fd*sin(yaw1-y)','y(0)=pi')                                    % 初始偏航角：pi
dsolve('Dy=v1/fd*sin(yaw1-y)','y(0)=-pi')                                   % 初始偏航角：-pi
