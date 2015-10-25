clc
figure(1)
clf
K = 1;
c = 345;
f = 100;
lambda = c/f;

t = 0 : 0.00001 : 1/f;
% wave1 = A1*cos(2*pi*f*t + q1);
p = K * sin(2*pi*c*t/lambda);

TS = 20/1000;
M = 0*8/1000;

alpha = 0;
r = TS + 2*M;
P = 1.5*(2*r)*sin(alpha); % Fletcher (1992) Eq. 9.2 p.155 


A = 0.9;
outer = K * sin(((2*pi)/lambda)*(c*t + P + M));
inner =A*K * sin(((2*pi)/lambda)*(c*t + M + TS));

p = outer - inner;
   subplot(131) 
cla
plot(t,outer)
hold on
plot(t,inner,'k')
plot(t,p,'r')
legend({'Outer';'Inner';'Difference'})
grid on

%% Polar
alpha = 0 : pi/10 : 2*pi;
t = 0;
subplot(131) 
% P = r*(alpha + sin(alpha));
P = 1.5*(2*r)*sin(alpha);
amplitude = zeros(1, length(alpha));
for i = 1 : length(alpha)
    t = 0 : 0.00001 : 1/f;
outer =   K * sin(((2*pi)/lambda)*(c*t + P(i) + M));
inner = A.*K * sin(((2*pi)/lambda)*(c*t + M + TS));

p = outer - inner;
cla

plot(t,outer)
hold on
plot(t,inner,'k')
plot(t,p,'r')
legend({'Outer';'Inner';'Difference'})
grid on
amplitude(i) = rms(p);
% drawnow
end
% p_dB = 20*log10(abs(p));

subplot(132)
plot(alpha, amplitude)
xlim([alpha(1) alpha(end)])
grid on
subplot(133)
cla
polar(alpha, amplitude,'r')

% hold on




% compass(alpha, 20*log10(abs(p)),'b-')



% for i = 1 : length(alpha)
%     
% polar(alpha(i), p(i),'ro')
% drawnow
% pause(0.1)
% 
% end
% polar(alpha, p,'b-')
