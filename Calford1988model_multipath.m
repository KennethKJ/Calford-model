clc
figure(1)
clf

K = 1;
c = 345;
f = 1000;
lambda = c/f;
forsink = 0*lambda/360;
% Head geometry
TS = 14/1000;
TSdelay = TS/lambda*360;
M = 0*2.5/1000;
r = (TS + 2*M)/2;
% r = 14/1000/2;
A = 1;


%% Polar

alpha = -pi : pi/36 : pi;

P = 1.5*(2*r)*sin(alpha); % Fletcher (1992) Eqs 9.2, p. 155
% P = r*(alpha + sin(alpha)); % Calford (1988) = error?
amplitude = zeros(1, length(alpha));
% for f = 500 : 100 : 3000
lambda = c/f;

    
    subplot(131)
    for i = 1 : length(alpha)
        
        t = 0 : 1/f/20 : 1/f;
        
        outer =   K * sin(((2*pi)/lambda)*(c*t + P(i) + M));
        inner = A.*K * sin(((2*pi)/lambda)*(c*t + M + TS));
        
        TS2 = TS*1.5;
            A2 = 0.2;
        inner2 = A2.*K * sin(((2*pi)/lambda)*(c*t + M + TS2));
        
        p = outer - inner - inner2;
        
        %     cla
        %     plot(t,outer)
        %     hold on
        %     plot(t,inner,'k')
        %     plot(t,p,'r')
        %     xlim([0 t(end)])
        %     ylim([-2 2])
        %     grid on
        amplitude(i) = rms(p);
        %     drawnow
    end
    cla
    plot(t,outer)
    hold on
    plot(t,inner,'k')
    plot(t,inner2,'g')
    
    plot(t,p,'r')
    xlim([0 t(end)])
    ylim([-2 2])
    grid on
    legend({'Outer';'Inner';'Difference'})
    
    subplot(132)
    plot(alpha, 20*log10(amplitude/max(amplitude)))
    xlim([alpha(1) alpha(end)])
    grid on
    
    subplot(133)
    cla
    polar(alpha, amplitude,'r')
    title(f)
    drawnow
    pause(0.2)
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
