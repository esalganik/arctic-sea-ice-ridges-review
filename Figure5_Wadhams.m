%% Figure 5 - illustration from Wadhams: https://doi.org/10.1016/j.polar.2012.03.002
close all; clear; clc;
keel = 6:23;
N1 = [0.848 0.722 0.639 0.496 0.472 0.428 0.322 0.270 0.188 0.147 0.103 0.071 0.045 0.061 0.041 0.026 0.022 0.014];
N2 = [0.645 0.487 0.365 0.243 0.178 0.166 0.109 0.070 0.077 0.049 0.041 0.009 0.006 0.006 0.005 0.001 0.005 0.006];
N = [N1; N2];
logN1 = -[0.176 0.340 0.453 0.692 0.755 0.856 1.133 1.309 1.674 1.926 2.291 2.644 3.110 2.820 3.210 3.601 3.865 4.293];
logN2 = -[0.441 0.718 0.995 1.410 1.712 1.788 2.216 2.644 2.556 2.996 3.160 4.658 4.935 4.935 5.376 6.043 5.363 4.948];
logN = [logN1; logN2];
figure 
tile = tiledlayout(1,2); tile.TileSpacing = 'compact'; tile.Padding = 'compact';
nexttile
b = bar(keel,N,'FaceColor','flat','EdgeColor','none','BarWidth',1); b(1).FaceColor = "#fe6347"; b(2).FaceColor = "#20b1aa";
hXLabel = xlabel('Keel depth (m)'); hYLabel = ylabel('Number of ridges N (km^-^1)'); set([hXLabel hYLabel gca],'FontSize',8,'FontWeight','normal');
leg = legend('North Greenland','Beaufort Sea','box','off','NumColumns',1); set(leg,'FontSize',8,'Location','northeast'); leg.ItemTokenSize = [30*0.7,18*0.7];
yticks(0:0.1:0.9); ylim([0 0.9]); xticks(6:1:23); xlim([5.5 23.5]); set(gca, 'XTickLabelRotation', 0);

nexttile
b = bar(keel,logN,'FaceColor','flat','EdgeColor','none','BarWidth',1);  b(1).FaceColor = "#fe6347"; b(2).FaceColor = "#20b1aa";
hXLabel = xlabel('Keel depth (m)'); hYLabel = ylabel('ln N'); set([hXLabel hYLabel gca],'FontSize',8,'FontWeight','normal');
leg = legend('North Greenland','Beaufort Sea','box','off','NumColumns',1); set(leg,'FontSize',8,'Location','southwest'); leg.ItemTokenSize = [30*0.7,18*0.7];

annotation('textbox',[0.00 .51 0.02 .51],'String','(a)','EdgeColor','none','HorizontalAlignment','center','FontSize',8);
annotation('textbox',[0.33 .51 0.33 .51],'String','(b)','EdgeColor','none','HorizontalAlignment','center','FontSize',8);
xticks(6:1:23); xlim([5.5 23.5]); set(gca, 'XTickLabelRotation', 0);

% Save figure
scriptDir = fileparts(mfilename('fullpath'));
figDir = fullfile(scriptDir, 'figures');
if ~exist(figDir, 'dir')
    mkdir(figDir);
end
outFile = fullfile(figDir, 'Figure5_wadhams.png');
set(gcf, 'Units', 'inches', 'Position', [1 1 8 2.6]);
exportgraphics(gcf, outFile, 'Resolution', 300);
fprintf('Figure saved: %s\n', outFile);