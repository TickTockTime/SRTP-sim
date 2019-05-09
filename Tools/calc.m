syms y t;
v1 = sqrt( (-0.5*sin(0.25*t)).^2 + (0.5*cos(0.5*t)).^2 );
psi1 = atan2( (-0.5*sin(0.25*t)) , (0.5*cos(0.5*t)) );
% dsolve('Dy=2*v1*sin(psi1-y)','y(0)=pi/2')
% dsolve('Dy=2*v1*sin(psi1-y)','y(0)=-pi')
% dsolve('Dy=2*v1*sin(psi1-y)','y(0)=3*pi/4')
dsolve('Dy=2*v1*sin(psi1-y)','y(0)=pi/2')