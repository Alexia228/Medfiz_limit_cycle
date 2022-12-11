 Xs = 1.05;
 Ys = 2.1;
% N = 100;
clc
clear
% y(end,1)
% y(end,2)
ylim([0,14])
xlim([0,5])
[x,y] = ode45(@right_hand_side,[1 : 0.1 : 1000], [3, 11]);
hold on
plot(y(:,1),y(:,2), 'red');

xlabel('Ox') 
ylabel('Oy') 


function dx = right_hand_side(t,x)
dx = zeros(2,1);
% a = 1.1;
% b = 2.3;
v1 = 3;
k6 = 0.039;

dx(1) = v1-x(1)-2*x(1)+(x(1)^(4)*x(2))/(92.35+x(1)^4)+2*k6*x(2);
dx(2) = 2*x(1)-(x(1)^(4)*x(2))/(92.35+x(1)^4)-2*k6*x(2);



% dx(1) = a-(b+1)*x(1)+x(1)*x(1)*x(2);
% dx(2) = b*x(1) - x(1)^2*x(2);
end