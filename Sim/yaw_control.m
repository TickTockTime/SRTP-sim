%% Leader2偏航角控制
% Author: Yao Chengtao
% 2018/8/8

%% 初始化参数
% 初始化Leader1的轨迹 x1 = [2cos(0.25t), sin(0.5t)]
% 计算Leader1的速度 v1 = [-0.5*sin(0.25*t), 0.5*cos(0.5*t)]
% Leader2的偏航角控制律 omega_yaw = v1/fd*sin(yaw1-yaw2)

%% 绘制不同初始偏航角情况下Leader2的
t = 0:0.1:40;
fd = 0.5;
v1x = -0.5*sin(0.25*t);
v1y = 0.5*cos(0.5*t);
v1 = sqrt( v1x.^2 + v1y.^2);
yaw1 = atan2( v1x, v1y);

% 不同初始偏航角情况下的Leader2的偏航角控制
yaw2_1 = yaw1 + 2.*atan2( real( exp(log(-atan2((yaw1/2 - pi/4), 1)) - (t.*v1)/fd) ), 1);    % 初始偏航角：pi/2
yaw2_2 = yaw1 + 2.*atan2( real( exp(log(-atan2((yaw1/2 + pi/4), 1)) - (t.*v1)/fd) ), 1);    % 初始偏航角：pi/2
yaw2_3 = yaw1 + 2.*atan(exp(log(cot(yaw1/2)) - (t.*v1)/fd));
yaw2_4 = yaw1 - 2.*atan(exp(log(cot(yaw1/2)) - (t.*v1)/fd));

figure(1);

plot(t,yaw1,"-", 'LineWidth',1.5);hold on
plot(t, yaw2_1, "--", 'LineWidth',1.5);hold on
plot(t, yaw2_2, "-.", 'LineWidth',1.5);hold on
plot(t, yaw2_3, "--", 'LineWidth',1.5);hold on
plot(t, yaw2_4, "--", 'LineWidth',1.5);hold on

xlabel('t/s');
ylabel('yaw/rad');
