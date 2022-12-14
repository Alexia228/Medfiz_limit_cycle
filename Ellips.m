clear
clc

% Ode45(a,b,c) 
% a -ссылка на функцию
% b - диапозон (чем больше шаг, тем больше полигонов). Конец диапазона -
% число итераций
% с - начальная точка, с которой стартуем рисовать
% 
% В limit_cycle вбиваем систему диффуров x(1) это x, x(2) это y
% Выбираем, какой цикл хотим посстроить (3D или 2D через перемнную Plot) 

Plot = '2D';
if Plot == '3D'
[x,y,z] = ode45(@limit_cycle,[0 : 0.01 : 100], [6.5, 1.5 , 7]);
plot3(y(:,1),y(:,2),y(:,3));

xlabel('X') 
ylabel('Y') 
zlabel('Z')
end

if Plot == '2D'
[x,y] = ode45(@limit_cycle,[0 : 0.01 : 100], [0.1, 0.1]);
plot(y(:,1),y(:,2));

xlabel('X') 
ylabel('Y') 
end



function dx = limit_cycle(t,x)
% %ВНУТРИКЛЕТОЧНЫЕ КОЛЕБАНИЯ КОНЦЕНТРАЦИИ КАЛЬЦИЯ(2D)
% dx = zeros(2,1);
% % v1 = 3;
% % k6 = 0.039;
% % dx(1) = v1-x(1)-2*x(1)+(x(1)^(4)*x(2))/(92.35+x(1)^4)+2*k6*x(2);
% % dx(2) = 2*x(1)-(x(1)^(4)*x(2))/(92.35+x(1)^4)-2*k6*x(2);
% 
% БРЮССЕЛЯТОР(2D)
dx = zeros(2,1);
a = 1.1;
b = 2.3;
dx(1) = a-(b+1)*x(1)+x(1)*x(1)*x(2);
dx(2) = b*x(1) - x(1)*x(1)*x(2);

%РЕАКЦИЯ БЕЛОУСОВА-ЖАБОТИНСКОГО(3D)
% dx = zeros(3,1);
% 
% q = 6e-3;
% h = 0.7;
% p = 1;
% e = 0.5;
% 
% dx(1) = 1/e * (x(1)+x(2) - q*(x(1))^2 - x(1)*x(2));
% dx(2) = 2*h*x(3)-x(2)-x(1)*x(2);
% dx(3) = 1/p * (x(1) - x(3));


end

%%











