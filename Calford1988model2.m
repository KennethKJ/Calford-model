clc
figure(1)
clf

Attn =0.8;

c = 345;
f = 1000;
lambda = c/f;
forsink = 0*c * 50/1000000;%0*lambda/360;

% Head geometry
TS = 11/1000;
TSdelay = TS/lambda*360;
M = 2/1000;
r = (TS + 2*M)/2;
% r = 14/1000/2;
Ampl = 1;


%% Polar

alpha = -3*pi/2 : pi/36 : pi/2;

P = 1.5*(2*r)*sin(alpha); % Fletcher (1992) Eqs 9.2, p. 155
Pcontra = 1.5*(2*r)*sin(alpha+pi); % Fletcher (1992) Eqs 9.2, p. 155

% P = r*(alpha + sin(alpha)); % Calford (1988) = error?
amplitude = zeros(1, length(alpha));
amplitudeContra = amplitude;
% for f = 500 : 100 : 3000
%     lambda = c/f;

    
subplot(131)
for i = 1 : length(alpha)
 
    t = 0 : 1/f/20 : 1/f;
    
    outer =   Ampl * sin(((2*pi)/lambda)*(c*t + P(i) + M));
    inner = Ampl.*Attn * sin(((2*pi)/lambda)*(c*t + M + TS + forsink));
    
    difference = outer - inner;

    outerContra =   Ampl * sin(((2*pi)/lambda)*(c*t + Pcontra(i) + M));
    innerContra = Ampl.*Attn * sin(((2*pi)/lambda)*(c*t + M + TS + forsink));
    
    differenceContra = outerContra - innerContra;    
    
    cla
    plot(t,outer)
    hold on
    plot(t,outerContra,'b--')
    
    plot(t,inner,'k')
    plot(t,innerContra,'k--')
    
    plot(t,difference,'r')
    plot(t,differenceContra,'r--')
    
    xlim([0 t(end)])
    ylim([-2 2])
    title(alpha(i)/pi*180)
    grid on
    amplitude(i) = rms(difference);
    amplitudeContra(i) = rms(differenceContra);
    
    drawnow
    pause(0.05)
end
    cla
    plot(t,outer)
    hold on
    plot(t,inner,'k')
    plot(t,difference,'r')
    plot(t,differenceContra,'r--')
    
    [~, idx1] = max(difference);
    [~, idx2] = max(differenceContra);
    
    
    maxDelay_ms = (t(idx2)-t(idx1))*1000000;
    
    xlim([0 t(end)])
    ylim([-2 2])
    grid on
    legend({'Outer';'Inner';'Difference'})

subplot(132)
plot(alpha, 20*log10(amplitude/max(amplitude)))
hold on
plot(alpha, 20*log10(amplitude),'b--')

xlim([alpha(1) alpha(end)])
ylim([-60 5])
grid on

subplot(133)
cla
polar(alpha, amplitude,'r')
hold on
polar(alpha, amplitudeContra,'r:')

title(f)

% subplot(144)
% cla
% polar(alpha, 30+ 20*log10(amplitude),'r')
% drawnow
% pause(0.2)
% % end
% % close(2)
% figure(2)
% subplot(121)
% cla
% polar(alpha, amplitude,'r')
% 
% subplot(122)
% cla
% polar(alpha, 50+ 20*log10(amplitude),'r')
% 
% 
disp('DONE!')
