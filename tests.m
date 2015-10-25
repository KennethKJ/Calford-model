

% 
% c = 345; % m/s
% f = 1200; % 1/s
% d = 11.5/1000; % m
% 
% C = 2*pi*d/2;
% 
% delay = C/c


% R = 2*10^-6;
% alpha = 2.18*10^-5;
% tau = R^2/(2*alpha);
% scaleValue = 2;
% 
% f = scaleValue/(2*pi*tau);
% disp(f)
% f =(5/R)^2;
% disp(f/1000)
c = 345;
f = 1000;
lambda = c/f;
disp(lambda)

minR = 0.01*f^0.5;
disp(['min r = ' num2str(minR)])

a = 0.4;
r = (a/pi)^0.5;
disp(['actual r = ' num2str(r)])