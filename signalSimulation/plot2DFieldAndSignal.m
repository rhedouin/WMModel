function out = plot2DFieldAndSignal(field, signal, TE, field_direction)
% plot signal and field

h = figure('Name', 'Field perturbation and GRE signals');
% position = [10 10 1090 890];
% h.Position = position;

magn_signal = abs(signal);
phase_signal = phase(signal);

subplot(221)
imagesc(field)

cb = colorbar;

title(cb,'Hertz');

caxis([-10 10])
title('Field perturbation', 'FontWeight', 'bold')
set(gca, 'FontSize', 12);


subplot(223)
h3 = subplot(223)   ;
axis([-2 2 -2 2 -2 2])
CameraPosition = [5 0 0]
view([0 90])

hold on
arrow3([0 0 0], [0 0 1],'--r',0.5,[],0)
arrow3([0 0 0], [0 1 0],'--y',0.5,[],0)
arrow3([0 0 0], [1 0 0],'--b',0.5,[],0)

arrow3([0 0 0], field_direction,'2.5s',1,[],0)

hold off, axis off, camlight left
set(gca,'CameraViewAngle',4)
text(1,0,0,'X'), text(0,1,0,'Y')
text(0,0,1,'Z','VerticalAlignment','bottom',...
    'HorizontalAlignment','center')

text(-0.5,1.5,0,'B0 orientation', 'FontWeight', 'bold', 'FontSize', 12)
set(gca, 'FontSize', 12);

subplot(222)
plot(TE, magn_signal, 'LineWidth', 3)
xlabel('echo time')
ylabel('|S(t)|')
title('Signal magnitude', 'FontWeight', 'bold')
set(gca, 'FontSize', 12);

subplot(224)

plot(TE, phase_signal, 'LineWidth', 3)
xlabel('echo time')
ylabel('phase(S(t))')

title('Signal phase', 'FontWeight', 'bold')
set(gca, 'FontSize', 12);

end



