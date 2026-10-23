%% Figure 23 - Ridge melt vs draft correlation (6.2 x 4.0 in)
close all; clear; clc
% Paths relative to this script
scriptDir = fileparts(mfilename('fullpath'));
dataDir = fullfile(scriptDir, 'data');
figDir = fullfile(scriptDir, 'figures');

if ~exist(figDir, 'dir')
    mkdir(figDir);
end
c{1} = [0.0000 0.4470 0.7410]; c{2} = [0.8500 0.3250 0.0980]; c{3} = [0.9290 0.6940 0.1250]; c{4} = [0.4940 0.1840 0.5560]; c{5} = [0.4660 0.6740 0.1880]; c{6} = [0.3010 0.7450 0.9330]; c{7} = [0.6350 0.0780 0.1840]; % colors
% import
load(fullfile(dataDir, 'ROV_regrid.mat'));
load(fullfile(dataDir, 'ROV_fast.mat'), 'x_edge', 'y_edge');
[in,~] = inpolygon(XX{1}(:),YY{1}(:),x_edge-4,y_edge);
inside = reshape(in,601,801);
good = ~isnan(ZZ{1}).*~isnan(ZZ{2}).*~isnan(ZZ{3}).*~isnan(ZZ{4}).*~isnan(ZZ{5}).*~isnan(ZZ{6}).*inside;
for i=1:7
    ZZ_clean{i} = ZZ{i};
    ZZ_clean{i}(good==0) = NaN;
end
% defining flanks of ridge profiles:
filter_1 = zeros(size(XX{1})); filter_2 = zeros(size(XX{1})); filter_3 = zeros(size(XX{1})); ZZ_filter_1 = ZZ_clean; ZZ_filter_2 = ZZ_clean;
y_f1 =[109.5 110 111 111.5 112 112.5 113 113.5 114 114.5 115 115.5 116 116.5 117 117.5 118 118.5 119 119.5 120 120.5 121 121.5 122 122.5 123 123.5 124 124.5 125 125.5 126 126.5 127 127.5 128 128.5 129 129.5 130 130.5 131 131.5 132 132.5 133 133.5 134 134.5 135   135.5 136 136.5 137 137.5 138 138.5 139 139.5 140 140.5 141 141.5 142 142.5 143 143.5 144 144.5 145 145.5 146 146.5 147 147.5 148 159.0 159.5 160 160.5 161 161.5 162 162.5 163 163.5 164 164.5 165.0 165.5 166 166.5 167 167.5 168 168.5 169 169.5 170 170.5 171 171.5 172 172.5 173 173.5 174 174.5 175 175.5 176 176.5 177 177.5 178.0 178.5 179 179.5 180 180.5 181 181.5 182 182.5 183 183.5 184 184.5 185 185.5];
x1_f1=[201.5 186 181 180.5 182 188.5 186 187.5 190 188.0 191 190.0 190 184.5 189 190.0 190 190.0 191 192.0 190 192.0 195 189.5 192 194.5 194 198.0 203 202.5 198 198.0 199 203.0 203 202.0 203 203.5 199 202.0 199 202.5 203 202.0 199 204.0 199 200.0 201 200.5 200.5 203.0 202 202.5 203 202.5 203 204.0 201 201.0 199 201.5 203 203.5 202 208.0 208 209.0 210 209.0 205 207.5 212 206.5 209 208.0 216 202.5 202.5 203 202.0 202 202.5 203 200.5 203 202.0 203 203.5 203.0 202.5 203 200.0 201 201.0 196 197.5 200 198.0 200 199.5 213 212.0 211 211.5 211 211.0 210 211.5 201 199.0 200 200.0 201 202.5 201.5 202.0 203 203.0 203 202.0 203 207.5 210 209.0 210 211.0 213 212.5 211 213.0];
x2_f1=[205.5 203 209 207.5 208 209.0 207 206.5 207 205.0 204 205.5 207 206.5 207 205.0 206 211.0 209 210.5 211 212.0 212 212.0 213 212.0 212 211.5 212 212.0 213 207.0 208 208.0 212 209.0 210 211.5 212 212.0 212 208.5 209 209.0 209 209.5 211 210.5 210 209.5 210.5 209.5 211 210.5 211 210.5 213 210.0 216 212.0 216 216.0 216 216.0 217 216.0 216 216.0 217 217.0 217 217.0 217 216.5 221 220.0 221 211.0 211.0 211 211.0 221 221.0 220 221.0 221 220.5 220 219.5 221.0 221.5 226 223.5 227 224.5 228 229.0 224 229.5 224 224.0 224 225.0 225 224.0 223 224.0 223 223.0 222 222.0 223 222.5 222 223.5 225.0 223.0 224 222.5 224 224.0 223 225.5 224 226.0 225 226.0 227 224.0 226 226.0];
x3_f1=[229.5 230 230 230.0 231 229.0 230 230.0 230 229.5 230 230.0 230 230.0 230 230.0 231 228.5 223 221.5 223 224.5 225 230.0 230 228.5 229 224.0 224 226.5 214 225.5 212 223.0 215 215.0 216 216.5 216 215.5 217 217.0 217 216.5 217 216.0 216 215.5 215 214.5 214   219.5 218 222.5 221 220.0 220 222.0 220 220.0 220 217.0 217 219.0 219 222.0 223 222.0 222 221.5 224 224.5 225 224.5 223 225.5 223 225.5 226.0 225 230.0 227 227.5 228 227.0 228 227.5 228 231.5 230.0 232.0 231 230.5 250 250.5 251 251.0 250 250.5 249 250.0 250 250.5 251 251.5 240 244.0 240 240.0 241 240.0 252 253.5 253 253.0 253.0 253.5 255 255.0 255 257.5 258 255.5 255 255.0 254 254.5 256 253.5 255 254.0];
x4_f1=[239.0 239 238 239.0 236 239.5 239 239.0 238 238.0 239 239.5 236 239.5 237 237.5 239 240.0 236 236.5 238 237.0 238 237.0 239 234.0 230 231.0 231 228.0 228 227.5 227 228.0 221 228.0 229 228.5 229 228.5 229 229.0 229 224.0 225 228.0 229 229.5 229 228.5 229   229.0 229 232.0 230 228.5 229 227.5 230 231.0 231 230.0 231 229.0 231 232.0 232 232.0 232 233.0 232 234.0 229 231.5 232 231.5 231 241.0 240.0 239 240.0 239 239.0 239 239.0 239 238.0 238 238.0 238.5 237.5 237 237.0 258 259.0 259 265.0 265 264.5 264 263.0 264 263.0 264 263.5 269 269.0 265 263.5 271 270.5 269 267.0 269 266.5 267.0 266.0 268 265.5 266 264.0 265 264.5 264 264.5 263 262.5 264 262.0 263 261.5];
step = 7; B = ones(step)/step^2;
for i = 1:7
    ZZ_sm{i} = conv2(ZZ{i},B,'same');
end
% calculating angles
filter_1 = zeros(size(XX{1})); filter_2 = zeros(size(XX{1})); filter_3 = zeros(size(XX{1})); ZZ_filter1 = ZZ_clean; ZZ_filter2 = ZZ_clean;
filter_11 = zeros(size(XX{1})); filter_12 = zeros(size(XX{1})); filter_21 = zeros(size(XX{1})); filter_22 = zeros(size(XX{1}));
for i = 1:length(y_f1)
    filter_11 = zeros(size(XX{1})); filter_12 = zeros(size(XX{1})); filter_21 = zeros(size(XX{1})); filter_22 = zeros(size(XX{1}));
    filter_11(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x1_f1(i)-0.4 & XX{1} < x1_f1(i)+0.5) = 1;
    Z11 = ZZ{1}; Z11(filter_11==0) = NaN; Z_11(i) = mean(Z11,'all','omitnan');
    Z11_6 = ZZ{6}; Z11_6(filter_11==0) = NaN; Z_11_6(i) = mean(Z11_6,'all','omitnan');
    filter_12(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x2_f1(i)-0.4 & XX{1} < x2_f1(i)+0.5) = 1;
    Z12 = ZZ{1}; Z12(filter_12==0) = NaN; Z12_raw{i} = Z12; Z_12(i) = mean(Z12,'all','omitnan');
    Z12_6 = ZZ{6}; Z12_6(filter_12==0) = NaN; Z_12_6(i) = mean(Z12_6,'all','omitnan');
    filter_21(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x3_f1(i)-0.4 & XX{1} < x3_f1(i)+0.5) = 1;
    Z21 = ZZ{1}; Z21(filter_21==0) = NaN; Z_21(i) = mean(Z21,'all','omitnan');
    Z21_6 = ZZ{6}; Z21_6(filter_21==0) = NaN; Z_21_6(i) = mean(Z21_6,'all','omitnan');
    filter_22(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x4_f1(i)-0.4 & XX{1} < x4_f1(i)+0.5) = 1;
    Z22 = ZZ{1}; Z22(filter_22==0) = NaN; Z_22(i) = mean(Z22,'all','omitnan');
    Z22_6 = ZZ{6}; Z22_6(filter_22==0) = NaN; Z_22_6(i) = mean(Z22_6,'all','omitnan');
    filter_1(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x1_f1(i) & XX{1} < x2_f1(i)) = 1;
    filter_2(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x2_f1(i) & XX{1} < x3_f1(i)) = 1;
    filter_3(YY{1} > y_f1(i)-0.4 & YY{1} < y_f1(i)+0.5 & XX{1} > x3_f1(i) & XX{1} < x4_f1(i)) = 1;
end
for i=1:7
    ZZ_filter1{i} = ZZ{i}; ZZ_filter1{i}(filter_1==0) = NaN;
    ZZ_filter2{i} = ZZ{i}; ZZ_filter2{i}(filter_2==0) = NaN;
    ZZ_filter3{i} = ZZ{i}; ZZ_filter3{i}(filter_3==0) = NaN;
end
% filtering with conditions
for i = 1:length(y_f1)
    filter_1(YY{1} > y_f1(i)-0.6 & YY{1} < y_f1(i)+0.5 & XX{1} > x1_f1(i) & XX{1} < x2_f1(i)) = 1;
    filter_2(YY{1} > y_f1(i)-0.6 & YY{1} < y_f1(i)+0.5 & XX{1} > x2_f1(i) & XX{1} < x3_f1(i)) = 1;
    filter_3(YY{1} > y_f1(i)-0.6 & YY{1} < y_f1(i)+0.5 & XX{1} > x3_f1(i) & XX{1} < x4_f1(i)) = 1;
end
for i=1:7
    ZZ_filter_1{i} = ZZ_clean{i}; ZZ_filter_1{i}(filter_1==0) = NaN;
    ZZ_filter_2{i} = ZZ_clean{i}; ZZ_filter_2{i}(filter_2==0) = NaN;
    ZZ_filter_3{i} = ZZ_clean{i}; ZZ_filter_3{i}(filter_3==0) = NaN;
end

figure
tile = tiledlayout(8,3); tile.TileSpacing = 'compact'; tile.Padding = 'none';
nexttile([3 3])
step = 1; B = ones(step)/step^2; % ZZ_sm = ZZ_clean; ZZ_sm = ZZ_fyi; % smoothing parameters
for i = 1:7
    ZZ_sm{i} = conv2(ZZ{i},B,'same');
end
x_lf_unit = 0:0.02:mean(x2_f1-x1_f1); z_lf1_int = zeros(length(x_lf_unit),length(y_f1)); z_lf6_int = zeros(length(x_lf_unit),length(y_f1));
x_mf_unit = mean(x2_f1-x1_f1):0.02:mean(x3_f1-x1_f1); z_mf1_int = zeros(length(x_mf_unit),length(y_f1)); z_mf6_int = zeros(length(x_mf_unit),length(y_f1));
x_rf_unit = mean(x3_f1-x1_f1):0.02:mean(x4_f1-x1_f1); z_rf1_int = zeros(length(x_rf_unit),length(y_f1)); z_rf6_int = zeros(length(x_rf_unit),length(y_f1));
for i = 1:length(y_f1)
    cross = y_f1(i); line = find(YY{1}(:,1) == cross); pnt = find(y_f1(1,:) == cross);
    x = XX{1}(line,:); z1 = ZZ_sm{1}(line,:); z6 = ZZ_sm{6}(line,:);
    x_lf = x(x >= x1_f1(pnt) & x <= x2_f1(pnt)); z_lf1 = z1(x >= x1_f1(pnt) & x <= x2_f1(pnt)); z_lf6 = z6(x >= x1_f1(pnt) & x <= x2_f1(pnt)); % left flank draft
    x_mf = x(x >= x2_f1(pnt) & x <= x3_f1(pnt)); z_mf1 = z1(x >= x2_f1(pnt) & x <= x3_f1(pnt)); z_mf6 = z6(x >= x2_f1(pnt) & x <= x3_f1(pnt)); % middle draft
    x_rf = x(x >= x3_f1(pnt) & x <= x4_f1(pnt)); z_rf1 = z1(x >= x3_f1(pnt) & x <= x4_f1(pnt)); z_rf6 = z6(x >= x3_f1(pnt) & x <= x4_f1(pnt)); % right flank draft
    x_lf_stretch = linspace(0,mean(x2_f1-x1_f1),length(x_lf)); x_mf_stretch = linspace(mean(x2_f1-x1_f1),mean(x3_f1-x1_f1),length(x_mf)); x_rf_stretch = linspace(mean(x3_f1-x1_f1),mean(x4_f1-x1_f1),length(x_rf));
    z_lf1_int(:,i) = interp1(x_lf_stretch,z_lf1,x_lf_unit,'linear','extrap'); % interpolation, left, 1
    z_lf6_int(:,i) = interp1(x_lf_stretch,z_lf6,x_lf_unit,'linear','extrap'); % interpolation, left, 6
    z_mf1_int(:,i) = interp1(x_mf_stretch,z_mf1,x_mf_unit,'linear','extrap'); % interpolation, middle, 1
    z_mf6_int(:,i) = interp1(x_mf_stretch,z_mf6,x_mf_unit,'linear','extrap'); % interpolation, middle, 6
    z_rf1_int(:,i) = interp1(x_rf_stretch,z_rf1,x_rf_unit,'linear','extrap'); % interpolation, right, 1
    z_rf6_int(:,i) = interp1(x_rf_stretch,z_rf6,x_rf_unit,'linear','extrap'); % interpolation, right, 6
end
% draft
fill([0 x_lf_unit(end) x_lf_unit(end) 0],[0 0 6 6],1,'FaceColor',c{5},'EdgeColor','none'); alpha(.07); hold on % shade
fill([x_lf_unit(end) x_mf_unit(end) x_mf_unit(end) x_lf_unit(end)],[0 0 6 6],1,'FaceColor',c{6},'EdgeColor','none'); alpha(.07); hold on % shade
fill([x_mf_unit(end) x_rf_unit(end) x_rf_unit(end) x_mf_unit(end)],[0 0 6 6],1,'FaceColor',c{7},'EdgeColor','none'); alpha(.07); hold on % shade
plot(x_lf_unit,-mean(z_lf1_int,2),'Color',c{1}); hold on
plot(x_lf_unit,-mean(z_lf6_int,2),'Color',c{2});
plot(x_mf_unit,-mean(z_mf1_int,2),'Color',c{1});
plot(x_mf_unit,-mean(z_mf6_int,2),'Color',c{2});
plot(x_rf_unit,-mean(z_rf1_int,2),'Color',c{1});
plot(x_rf_unit,-mean(z_rf6_int,2),'Color',c{2});
plot([-5 0],-[mean(z_lf1_int(1,:)) mean(z_lf1_int(1,:))],'Color',c{1}); % FYI, 1
plot([-5 0],-[mean(z_lf6_int(1,:)) mean(z_lf6_int(1,:))],'Color',c{2}); % FYI, 6
plot([mean(x4_f1)-mean(x1_f1) 45],-[mean(z_rf1_int(end,:)) mean(z_rf1_int(end,:))],'Color',c{1}); % SYI, 1
plot([mean(x4_f1)-mean(x1_f1) 45],-[mean(z_rf6_int(end,:)) mean(z_rf6_int(end,:))],'Color',c{2}); % SYI, 6

p = text(5.8,1.45,'Upstream'); set(p,'Color',c{5},'HorizontalAlignment','left','FontSize',9);
p = text(6.8,1.85,'flank'); set(p,'Color',c{5},'HorizontalAlignment','left','FontSize',9);
p = text(37.8,1.75,'Downstream'); set(p,'Color',c{7},'HorizontalAlignment','right','FontSize',9);
p = text(36.2,2.15,'flank'); set(p,'Color',c{7},'HorizontalAlignment','right','FontSize',9);
p = text(22.5,2.85,'Keel'); set(p,'Color',c{6},'HorizontalAlignment','center','FontSize',9);
p = text(22.5,3.25,'bottom'); set(p,'Color',c{6},'HorizontalAlignment','center','FontSize',9);
p = text(27.5,4.75,'Draft, 24 June'); set(p,'Color',c{1},'HorizontalAlignment','center','FontSize',9);
p = text(22.5,3.95,'Draft, 21 July'); set(p,'Color',c{2},'HorizontalAlignment','center','FontSize',9);
hXLabel = xlabel('Keel width (m)'); hYLabel = ylabel('Ice draft (m)'); set([hXLabel hYLabel gca],'FontSize',8,'FontWeight','normal');
set(gca,'YDir','reverse'); % reverse y-axis for image
ylim([1 6]); xticks(-5:5:50); xlim([-5 45]); yticks(0:1:6);
p1 = [5 5.0]; p2 = [0 5.0]; dp = p2-p1; quiver(p1(1),p1(2),dp(1),dp(2),1.2,'k','MaxHeadSize',0.3); % arrow, drift
p = text(2.5,4.7,'Ice drift'); set(p,'Color','k','HorizontalAlignment','center','FontSize',9);
p = text(2.5,5.2,'direction'); set(p,'Color','k','HorizontalAlignment','center','FontSize',9);

nexttile([2 3])
fill([0 x_lf_unit(end) x_lf_unit(end) 0],[0 0 6 6],1,'FaceColor',c{5},'EdgeColor','none'); alpha(.07); hold on % shade
fill([x_lf_unit(end) x_mf_unit(end) x_mf_unit(end) x_lf_unit(end)],[0 0 6 6],1,'FaceColor',c{6},'EdgeColor','none'); alpha(.07); hold on % shade
fill([x_mf_unit(end) x_rf_unit(end) x_rf_unit(end) x_mf_unit(end)],[0 0 6 6],1,'FaceColor',c{7},'EdgeColor','none'); alpha(.07); hold on % shade
plot(x_lf_unit,-mean(z_lf1_int,2)+mean(z_lf6_int,2),'k'); hold on
plot(x_mf_unit,-mean(z_mf1_int,2)+mean(z_mf6_int,2),'k');
plot(x_rf_unit,-mean(z_rf1_int,2)+mean(z_rf6_int,2),'k');
plot([-5 0],[-mean(z_lf1_int(1,:))+mean(z_lf6_int(1,:)) -mean(z_lf1_int(1,:))+mean(z_lf6_int(1,:))],'k'); % FYI melt
plot([mean(x4_f1)-mean(x1_f1) 45],[-mean(z_rf1_int(end,:))+mean(z_rf6_int(end,:)) -mean(z_rf1_int(end,:))+mean(z_rf6_int(end,:))],'k'); % SYI melt

p = text(5.8,1.3,'0.8 ± 0.3 m'); set(p,'Color',c{5},'HorizontalAlignment','left','FontSize',9);
p = text(37.8,1.1,'0.7 ± 0.3 m'); set(p,'Color',c{7},'HorizontalAlignment','right','FontSize',9);
p = text(22.5,1.3,'1.0 ± 0.2 m'); set(p,'Color',c{6},'HorizontalAlignment','center','FontSize',9);

hXLabel = xlabel('Keel width (m)'); hYLabel = ylabel('Ice melt (m)'); set([hXLabel hYLabel gca],'FontSize',8,'FontWeight','normal');
ylim([0 1.8]); xticks(-5:5:50); xlim([-5 45]); yticks(0:0.4:1.8);
yyaxis right
set(gca,'ytick',0:40:160,'ylim',[0,160],'Ycolor','k'); set(gca,'YDir','normal');
hYLabel = ylabel('Ocean heat flux (W m^{-2})'); set([hXLabel hYLabel gca],'FontSize',8,'FontWeight','normal');

nexttile([3 1]) % left flank
i = 1; j = 7;
y = -ZZ_filter_1{i}(~isnan(ZZ_filter_1{i}))+ZZ_filter_1{j}(~isnan(ZZ_filter_1{i})); % left flank
x = -ZZ_filter_1{i}(~isnan(ZZ_filter_1{i}));
y(isnan(x)) = []; x(isnan(x)) = [];
N = hist3([x,y],'Nbins',[30 60]);
N_pcolor = N';
N_pcolor(size(N_pcolor,1)+1,size(N_pcolor,2)+1) = 0;
xl = linspace(min(x),max(x),size(N_pcolor,2)); % Columns of N_pcolor
yl = linspace(min(y),max(y),size(N_pcolor,1)); % Rows of N_pcolor
imagesc(xl,yl,N_pcolor); hold on % contourplot
load(fullfile(dataDir, 'oslo.mat')); colormap(flipud(oslo));
ax = gca; ax.ZTick(ax.ZTick < 0) = [];
set(gcf, 'renderer', 'opengl');
title('Upstream flank','FontSize',9,'FontWeight','normal','Color',c{5});
xlim([1 6]); ylim([-1 5]); xticks(1:1:6); yticks(-1:1:6);
hXLabel = xlabel('Ice draft (m)'); hYLabel = ylabel('Ice melt (m)'); set([hXLabel hYLabel gca],'FontSize',8,'FontWeight','normal'); set(gca,'YDir','normal');

[xxx,ind] = sort(x); yyy = y(ind); [p,S] = polyfit(xxx,yyy,1); [y_fit,~] = polyval(p,xxx,S); plot(xxx,y_fit,'--','color','k','LineWidth',2.5); % linear regression
R = corrcoef(xxx,yyy); R2 = round(R(1,2)^2,2);
XL = get(gca,'XLim'); YL = get(gca,'YLim');
p = text(XL(1)+(XL(2)-XL(1))*0.05,YL(2)*0.92,sprintf('R^2 = %.2f',R2)); set(p,'Color','k','HorizontalAlignment','left','FontSize',9);

nexttile([3 1]) % ridge middle
y = -ZZ_filter_2{i}(~isnan(ZZ_filter_2{i}))+ZZ_filter_2{j}(~isnan(ZZ_filter_2{i})); % ridge middle
x = -ZZ_filter_2{i}(~isnan(ZZ_filter_2{i}));
y(isnan(x)) = []; x(isnan(x)) = [];
y(x>5.5) = []; x(x>5.5) = []; y(x<2.5) = []; x(x<2.5) = [];
N = hist3([x,y],'Nbins',[15 60]);
N_pcolor = N';
N_pcolor(size(N_pcolor,1)+1,size(N_pcolor,2)+1) = 0;
xl = linspace(min(x),max(x),size(N_pcolor,2)); % Columns of N_pcolor
yl = linspace(min(y),max(y),size(N_pcolor,1)); % Rows of N_pcolor
imagesc(xl,yl,N_pcolor); hold on % contourplot
colormap(flipud(oslo));
ax = gca; ax.ZTick(ax.ZTick < 0) = [];
set(gcf, 'renderer', 'opengl');
title('Keel bottom','FontSize',9,'FontWeight','normal','Color',c{6});
xlim([1 6]); ylim([-1 5]); xticks(1:1:6); yticks(-1:1:6);
hXLabel = xlabel('Ice draft (m)'); set([hXLabel gca],'FontSize',8,'FontWeight','normal'); set(gca,'YDir','normal');

[xxx,ind] = sort(x); yyy = y(ind); [p,S] = polyfit(xxx,yyy,1); [y_fit,~] = polyval(p,xxx,S); plot(xxx,y_fit,'--','color','k','LineWidth',2.5); % linear regression
R = corrcoef(xxx,yyy); R2 = round(R(1,2)^2,2);
XL = get(gca,'XLim'); YL = get(gca,'YLim');
p = text(XL(1)+(XL(2)-XL(1))*0.05,YL(2)*0.92,sprintf('R^2 = %.2f',R2)); set(p,'Color','k','HorizontalAlignment','left','FontSize',9);
% [brob,~] = robustfit(x,y);
% plot([min(x) max(x)],brob(1)+brob(2)*[min(x) max(x)],'--','Color','k','LineWidth',2.5);

nexttile([3 1]) % right flank
y = -ZZ_filter_3{i}(~isnan(ZZ_filter_3{i}))+ZZ_filter_3{j}(~isnan(ZZ_filter_3{i})); % right flank
x = -ZZ_filter_3{i}(~isnan(ZZ_filter_3{i}));
y(isnan(x)) = []; x(isnan(x)) = [];
N = hist3([x,y],'Nbins',[30 60]);
N_pcolor = N';
N_pcolor(size(N_pcolor,1)+1,size(N_pcolor,2)+1) = 0;
xl = linspace(min(x),max(x),size(N_pcolor,2)); % Columns of N_pcolor
yl = linspace(min(y),max(y),size(N_pcolor,1)); % Rows of N_pcolor
imagesc(xl,yl,N_pcolor); hold on % contourplot
colormap(flipud(oslo));
ax = gca; ax.ZTick(ax.ZTick < 0) = [];
set(gcf, 'renderer', 'opengl');
title('Downstream flank','FontSize',9,'FontWeight','normal','Color',c{7});
xlim([1 6]); ylim([-1 5]); xticks(1:1:6); yticks(-1:1:6);
hXLabel = xlabel('Ice draft (m)'); set([hXLabel gca],'FontSize',8,'FontWeight','normal'); set(gca,'YDir','normal');

[xxx,ind] = sort(x); yyy = y(ind); [p,S] = polyfit(xxx,yyy,1); [y_fit,~] = polyval(p,xxx,S); plot(xxx,y_fit,'--','color','k','LineWidth',2.5); % linear regression
R = corrcoef(xxx,yyy); R2 = round(R(1,2)^2,2);
XL = get(gca,'XLim'); YL = get(gca,'YLim');
p = text(XL(1)+(XL(2)-XL(1))*0.05,YL(2)*0.92,sprintf('R^2 = %.2f',R2)); set(p,'Color','k','HorizontalAlignment','left','FontSize',9);

annotation('textbox',[0.00 .51 0.02 .51],'String','(a)','FontSize',8,'EdgeColor','none','HorizontalAlignment','center');
annotation('textbox',[0.00 .31 0.02 .32],'String','(b)','FontSize',8,'EdgeColor','none','HorizontalAlignment','center');
annotation('textbox',[0.00 .19 0.02 .19],'String','(c)','FontSize',8,'EdgeColor','none','HorizontalAlignment','center');
annotation('textbox',[0.22 .19 0.23 .19],'String','(d)','FontSize',8,'EdgeColor','none','HorizontalAlignment','center');
annotation('textbox',[0.43 .19 0.43 .19],'String','(e)','FontSize',8,'EdgeColor','none','HorizontalAlignment','center');

% Export figure
outFile = fullfile(figDir, 'Figure23_ridge_melt.png');
set(gcf, 'Units', 'inches', 'Position', [1 3 8 5]);
exportgraphics(gcf, outFile, 'Resolution', 300);
fprintf('Figure saved: %s\n', outFile);
