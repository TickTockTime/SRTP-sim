%% 工具函数：求解Leader2和Leader1距离关系函数
% Author: Yao Chengtao
% 2018/11/5

%% 初始化参数
syms f d t;

% Leader1偏航角
yaw = pi/4;

% 旋转矩阵 机体-导航
R=[cos(yaw) -sin(yaw); sin(yaw) cos(yaw)];

% Leader1的速度参数【机体坐标系】
v1x = 1;
v1y = 0;
v1 = [v1x; v1y];

% Leader1的速度参数【导航坐标系】
v0 = R*v1;

% 期望的fd和sd
expect_fd = 2;
expect_sd = 2;


%% 求解x和y方向的距离函数【机体坐标系】
% dsolve('Df=v1x+(v1x*t-f)*((v1x*t-f)^2-expect_fd^2)','f(0)=5/2')
% dsolve('Ds=v1y+(v1y*t-s)*((v1y*t-s)^2-expect_sd^2)','s(0)=3/2')

t=0:0.1:10;

% Leader1全局坐标系下的轨迹
x1 = v0.*t;

% 机体坐标系下的fd和sd
fd=exp((expect_fd.^2).*t)./((exp(2.*(expect_fd.^2).*t)/(expect_fd.^2)-1/(expect_fd.^2)+4/25).^(1/2));
sd=exp((expect_sd.^2).*t)./((exp(2.*(expect_sd.^2).*t)/(expect_sd.^2)-1/(expect_sd.^2)+4/9).^(1/2));
% Leader2全局坐标系下的轨迹
x2=R*[v1x.*t-fd;v1y.*t-sd];

% fd、sd收敛情况
figure(1)
plot(t, fd);hold on
figure(2)
plot(t, sd);hold on

% Leader系统的轨迹
figure(3)
plot(x1(2,:), x1(1,:));hold on
plot(x2(2,:), x2(1,:));hold on
