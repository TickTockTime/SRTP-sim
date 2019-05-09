%% Parameters init

% Leader1
pitch = 0;

fd = 0.5;
sd = 0.5;

%% 
ld = sqrt(fd^2+sd^2);
phid = atan(sd/ld);
y = [];


% Plot psi of the leader 1
psi21 = pi/2;

t = 0:0.1:40;
v1 = sqrt( (-0.5*sin(0.25*t)).^2 + (0.5*cos(0.5*t)).^2 );
psi1 = atan2( (-0.5*sin(0.25*t)) , (0.5*cos(0.5*t)) );
p3 = psi1 - 2.*atan2(real(exp(log(atan2((psi1/2 + pi/4),1)) - 2.*t.*v1)),1);
p4 = psi1 - 2.*atan2(real(exp(log(atan2((psi1/2 - pi/4),1)) - 2.*t.*v1)),1);
% p = psi1 - 2.*atan2(real(exp(log(-cot(psi1/2)) - 2.*t.*v1)),1);
p1 = psi1 - 2.*atan(exp(log(-cot(psi1/2)) - 2.*t.*v1));
p2 = psi1 - 2.*atan(exp(log(cot(psi1/2)) - 2.*t.*v1));

figure(1);
title("Leader2 yaw control");
plot(t,psi1,"-", 'LineWidth',3);
hold on
plot(t, p1, "--", 'LineWidth',3);
hold on
plot(t, p2, "-.", 'LineWidth',3);
hold on
plot(t, p3, "--", 'LineWidth',2);
hold on
plot(t, p4, "--", 'LineWidth',2);

xlabel('t/s');
ylabel('psi/rad');
