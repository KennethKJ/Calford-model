A1 = 1;
q1 = 0;
f = 2500;

t = 0 : 0.00001 : 0.003;
maxdt = 2*0.014/344;

figure(100)
    wave1 = A1*cos(2*pi*f*t + q1);
cla
    plot(t, wave1)
xlim([0 t(end)])
ylim([-1.5 1.5])


for dt = -maxdt/2 : maxdt/100 : maxdt/2
    wave1 = A1*cos(2*pi*f*t + q1);
    wave2 = A1*cos(2*pi*f*(t + dt) + q1);
    cla
    plot(t, wave1)
    hold on
    plot([0.002 0.002],[1.5 -1.5],'k')
    plot(t, wave2, 'r--')
    plot(t, wave1-wave2, 'g')
    title(num2str(dt*1000000,'%2.0f'))
    drawnow
    pause(0.1)
end