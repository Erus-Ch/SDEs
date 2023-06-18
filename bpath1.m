%BPATH1  Brownian path simulation

randn('state',100)           % set the state of randn
T = 1; N = 1000; dt = T/N;
dW = zeros(1,N);             % preallocate arrays ...
 x = zeros(1,N);              % for efficiency
 v = zeros(1,N);
 a = zeros(1,N);
 out = zeros(1,N)
k=10; U=0.01; f=1;
v0= 0.01
avr = 0
dW(1) = sqrt(dt)*randn;      % first approximation outside the loop ...

for j = 2: N
   dW(j) = 1000*sqrt(dt)*randn;  % general increment
   out(j) = k*(v0*j*dt-x(j-1))
   a(j) = out(j)+U*sin(x(j-1))+dW(j)-f*v(j-1)
   v(j) = v(j-1) + a(j)*dt
   x(j) = x(j-1) + v(j)*dt
   avr=avr+out(j)/N
end

plot([0:dt:T],[0,x],'r-')    % plot W against t
xlabel('t','FontSize',16) 
ylabel('X(t)','FontSize',16,'Rotation',0)
figure

plot([0:dt:T],[0,out],'r-')    % plot W against t
xlabel('t','FontSize',16) 
ylabel('out(t)','FontSize',16,'Rotation',0)

