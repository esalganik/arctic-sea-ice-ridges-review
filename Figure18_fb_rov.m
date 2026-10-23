%% Figure 18 - False bottoms 3D (6.2 x 2.2 in)
% Paths relative to this script
scriptDir = fileparts(mfilename('fullpath'));
dataDir = fullfile(scriptDir, 'data');
figDir = fullfile(scriptDir, 'figures');

if ~exist(figDir, 'dir')
    mkdir(figDir);
end
load(fullfile(dataDir, 'ROV_regrid.mat'), 'XX', 'YY', 'ZZ');
load(fullfile(dataDir, 'ROV_fast.mat'), 'x_fb', 'y_fb');
load(fullfile(dataDir, 'batlow.mat'));
step = 6; B = ones(step)/step^2;
for i = 1:7
    ZZ_sm{i} = conv2(ZZ{i},B,'same');
end
fig = figure('Units','inches', ...
    'Position',[1 1 8 3], ...
    'Color','w');
tile = tiledlayout(1,2);tile.TileSpacing = 'compact'; tile.Padding = 'none';
nexttile
i = 3; % ROV scan
h = surf(XX{i},YY{i},-ZZ_sm{i},'EdgeColor','none'); hold on
j = 1; values = spcrv([x_fb{j}-5;y_fb{j}+5],3); plot3(values(1,:),values(2,:),values(2,:)*0+1.7,'w-');
colormap((batlow));
hXLabel = xlabel('x (m)'); hYLabel = ylabel('y (m)'); zYLabel = zlabel('Ice draft (m)'); set([hXLabel hYLabel zYLabel gca],'FontSize',9,'FontWeight','normal');
xlim([100 250]); ylim([200 300]); zlim([0.5 4]); clim([0.5 4]); zticks(0.5:0.5:4); zticklabels({'0.5','1','1.5','2','2.5','3','3.5','4'});
ax = gca;
ax.ZDir = 'normal';
ax.ZLimMode = 'manual';
ax.ZTickMode = 'manual';
title('1 July 2020, before formation of false bottoms','FontSize',9,'FontWeight','Normal');
p = text(225,270,3.0,'Ridges'); set(p,'Color','w','HorizontalAlignment','center','FontSize',8);
p = text(145,240,3.0,'Ridges'); set(p,'Color','w','HorizontalAlignment','center','FontSize',8);
v = [-30 40 80]; [~,~] = view(v);
shading interp; lightangle(-45,30); h.FaceLighting = 'gouraud'; h.AmbientStrength = 0.6; h.DiffuseStrength = 0.95; h.SpecularStrength = 0.1; h.SpecularExponent = 50; h.BackFaceLighting = 'unlit';
nexttile
i = 5; % ROV scan
h = surf(XX{i},YY{i},-ZZ_sm{i},'EdgeColor','none'); hold on
j = 1; values = spcrv([x_fb{j}-5;y_fb{j}+5],3); plot3(values(1,:),values(2,:),values(2,:)*0+1.7,'w-');
colormap((batlow));
hXLabel = xlabel('x (m)'); hYLabel = ylabel('y (m)'); set([hXLabel hYLabel gca],'FontSize',9,'FontWeight','normal');
hBar1 = colorbar; ylabel(hBar1,'Ice draft (m)','FontSize',9);
xlim([100 250]); ylim([200 300]); zlim([0.5 4]); clim([0.5 4]); zticks(0.5:0.5:4); zticklabels({'0.5','1','1.5','2','2.5','3','3.5','4'});
ax = gca;
ax.ZDir = 'normal';
ax.ZLimMode = 'manual';
ax.ZTickMode = 'manual';
title('14 July 2020, after formation of false bottoms','FontSize',9,'FontWeight','Normal'); %
p = text(155,290,2.4,'False bottoms'); set(p,'Color','w','HorizontalAlignment','center','FontSize',8);
p = text(75,255,4,'Melting ice'); set(p,'Color','w','HorizontalAlignment','center','FontSize',8);
p = text(225,270,3.0,'Ridges'); set(p,'Color','w','HorizontalAlignment','center','FontSize',8);
p = text(145,240,3.0,'Ridges'); set(p,'Color','w','HorizontalAlignment','center','FontSize',8);
v = [-30 40 80]; [~,~] = view(v);
shading interp; lightangle(-45,30); h.FaceLighting = 'gouraud'; h.AmbientStrength = 0.6; h.DiffuseStrength = 0.95; h.SpecularStrength = 0.1; h.SpecularExponent = 50; h.BackFaceLighting = 'unlit';

annotation('textbox',[0 .51 0.02 .51],'String','(a)','EdgeColor','none','HorizontalAlignment','center','FontSize',9);
annotation('textbox',[0.31 .51 0.32 .51],'String','(b)','EdgeColor','none','HorizontalAlignment','center','FontSize',9);

outFile = fullfile(figDir, 'Figure18_fb_rov.png');
drawnow;
exportgraphics(fig, outFile, ...
    'Resolution', 300, ...
    'BackgroundColor', 'white');
fprintf('Figure saved: %s\n', outFile);