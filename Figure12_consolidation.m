%% Figure 12 - Degree of consolidation vs time
clear; clc; close all
% Paths relative to this script
scriptDir = fileparts(mfilename('fullpath'));
dataDir = fullfile(scriptDir, 'data');
figDir = fullfile(scriptDir, 'figures');

if ~exist(figDir, 'dir')
    mkdir(figDir);
end

font = 9;

% ridge historical data
t_guz2=['01-Jan-2020';'01-Feb-2020';'01-Mar-2020';'01-Apr-2020';'01-May-2020';'01-Jun-2020';'01-Jul-2020';'01-Aug-2020']; % Guzenko, Lyuba ridge, 2025, 1 ridge
hi_guz2 = [1.16 1.36 1.51 1.66 1.77 1.83 1.81 1.57]; % Guzenko, 2025, Lyuba ridge
hc_guz2 = [1.42 1.69 2.32 2.37 2.53 2.69 2.93 2.80]; % Guzenko, 2025, Lyuba ridge
t_guz =['13-Apr-2020';'12-Apr-2020';'28-Apr-2020';'02-Jun-2020';'13-May-2020';'15-May-2020';'23-May-2020';'07-May-2020';'30-Mar-2020';'25-Mar-2020']; % Guzenko et al., 2024
hi_guz  = [0.89 0.94 1.51 1.38 0.97 1.15 1.46 1.55 1.76 1.65]; % Guzenko et al., 2026
hc_guz  = [1.54 1.39 1.96 2.18 1.69 2.16 3.02 2.61 2.51 2.38]; % Guzenko et al., 2026
por_guz = [0.24 0.31 0.28 0.25 0.36 0.26 0.27 0.25 0.29 0.20]; % Guzenko et al., 2026, 103 ridges
t_bon =['29-Mar-2020';'14-Mar-2020';'14-Mar-2020';'14-Mar-2020';'28-Apr-2020';'28-Apr-2020';'28-Apr-2020';'29-Apr-2020';'29-Apr-2020']; % Bonath 2018
hi_bon =  [0.80 0.94 1.14 0.64 0.62 0.62 0.62 0.67 0.67]; % Bonath 2018
hc_bon =  [2.02 2.82 1.64 1.36 1.84 1.85 1.33 1.73 1.92]; % Bonath 2018
por_bon = [ .31  .22  .20  .27  .34  .31  .19  .38  .51]; % Bonath 2018, 6 ridges
t_erv=['22-May-2020';'03-Jun-2020';'24-May-2020';'31-May-2020';'10-Jun-2020';'12-Jun-2020']; % Ervik, N-ICE 2018
hi_erv =  [1.4 1.24 1.3 1.3 0.64 0.64]; % Ervik, N-ICE 2018
hc_erv =  [2.5 2.70 0.8 0.8 2.30 3.00]; % Ervik, N-ICE 2018
por_erv = [.11  .10 .25 .16  .22  .27]; % Ervik, N-ICE 2018, 4 ridges
% t_hoy=['02-Mar-2020';'10-Mar-2020';'10-May-2020';'10-May-2020';'10-May-2020';'10-May-2020']; % Hoyland 2002,2007
% hi_hoy =  [0.95  0.70   0.47 NaN 0.96 1.20]; % Hoyland 2002,2007
% hc_hoy =  [1.19  0.91   1.05 1.5 1.40 1.90]; % Hoyland 2002,2007
% por_hoy = [0.325 0.35   0.45 .36 0.10 0.30]; % Hoyland 2002,2007, 6 ridges

t_hoy02=['02-Mar-2020';'10-Mar-2020']; % Høyland 2002
hi_hoy02 = [0.95 0.70]; % Høyland 2002
hc_hoy02 = [1.19 0.91]; % Høyland 2002
por_hoy02 = [0.325 0.35]; % Høyland 2002, 2 ridges

t_hoy07=['10-May-2020';'10-May-2020';'10-May-2020';'10-May-2020']; % Høyland 2007
hi_hoy07 = [0.47 NaN 0.96 1.20]; % Høyland 2007
hc_hoy07 = [1.05 1.50 1.40 1.90]; % Høyland 2007
por_hoy07 = [0.45 0.36 0.10 0.30]; % Høyland 2007, 4 ridges

t_sal = ['05-Feb-2020';'26-Jul-2020']; % Salganik 2023, 1 ridge (AR)
hi_sal =  [1.17 1.07]; % Salganik 2023, AR
hc_sal =  [1.70 3.90]; % Salganik 2023, AR
por_sal = [0.29 0.15]; % Salganik 2023, AR
t_kha = ['17-Mar-2020';'06-Jun-2020';'19-Jun-2020']; % Kharitonov, 2012
hi_kha =  [1.02 1.7 1.7]; % Kharitonov, 2012
hc_kha =  [3.00 5.4 1.8]; % Kharitonov, 2012
por_keel_kha = [0.18 0.08 0.09]; % Kharitonov, 2012, 3 ridges
hk_kha =  [6.67 12.65 9.4]; % Kharitonov, 2012
por_kha = hk_kha./(hk_kha-hc_kha).*por_keel_kha; % Kharitonov, 2012
t_kha05 = '15-Apr-2020'; % Kharitonov, 2005
hi_kha05 =  0.70; % Kharitonov, 2005
hc_kha05 =  0.54; % Kharitonov, 2005
por_kha05 = 0.17; % Kharitonov, 2005, 1 ridge
hc_tru =  [2.9 1.4 3.2]; % Truskov, 1996, Sakhalin
por_keel_tru = [0.23 0.25 0.20]; % Truskov, 1996, Sakhalin
hk_tru =  [8.5 5.6 5.5]; % Truskov, 1996, Sakhalin
por_tru = hk_tru./(hk_tru-hc_tru).*por_keel_tru; % Truskov, 1996, Sakhalin, 3 ridges
hi_sum =  [hi_kha(2:3) hi_sal(2)]; % summer
hc_sum =  [hc_kha(2:3) hc_sal(2)]; % summer
por_sum = [por_kha(2:3) por_sal(2)]; % summer
t_bla = ['20-Jan-2020';'05-Mar-2020';'25-Apr-2020';'01-Jun-2020']; % Blanchet, 1998
hi_bla = [1.03 1.43 1.59 1.91]; % Blanchet, 1998
hc_bla = [1.43 2.26 2.67 3.50]; % Blanchet, 1998, 1 ridge
hi_vol = [0.49 0.40 0.42 0.69 1.02 0.99 0.79 0.92 0.43 0.52 0.61 2.21 0.77 0.36 1.07 0.41 0.72 1.08 0.94 0.61 0.75 0.58 1.13 1.13 0.38 0.52 0.61 0.91 0.61 0.87 0.46 0.49 0.46 0.91 0.68]; % Voelker et al., 1981a
hc_vol = [2.59 2.89 1.22 2.89 5.70 2.07 1.46 2.29 1.52 1.34 1.55 3.81 1.89 1.28 3.35 0.91 2.89 4.21 1.52 3.20 1.68 2.74 1.89 1.22 0.76 1.52 0.91 0.91 1.07 1.52 0.91 2.13 1.46 1.34 1.58];
t_vol = '15-Apr-2020'; for i = 1:35; t_vol(i,1:11) = t_vol(1,1:11); end

% Alli's Ridge data
load(fullfile(dataDir, 'T61.mat'));
load(fullfile(dataDir, 'PS_meteo.mat'));
load(fullfile(dataDir, 'PS_ocean.mat'));
load(fullfile(dataDir, 'DTC26.mat'));
z = 0:-0.02:-4.78; z = z + 0.8; z_T61 = z; % depth SIMBA T61
c{1} = [0.0000 0.4470 0.7410]; c{2} = [0.8500 0.3250 0.0980]; c{3} = [0.9290 0.6940 0.1250]; c{4} = [0.4940 0.1840 0.5560]; c{5} = [0.4660 0.6740 0.1880]; c{6} = [0.3010 0.7450 0.9330]; c{7} = [0.6350 0.0780 0.1840]; % colors
T = T_T61; t = t_T61;
t_hc =  [  1   9  50 100 140 150 175 200 225 250 275 290 300 310 315 325 330 340 350 375 400 425 450 475 525 550 689];
hc_T = -[104 106 118 130 132 134 142 144 149 156 166 167 172 181 187 205 217 222 227 251 273 306 329 352 376 384 392]/100;
hc_T_int = interp1(datenum(t_T61(t_hc)),hc_T,datenum(t_T61),'linear'); % Experimental interpolation
t_hs =  [ 1 50 100 200 250 275 325 350 385 485 600 620 640 650 659 675 689];
hs_T =  [70 70  66  70  68  68  74  74  74  70  66  36  36  32  30  14   8]/100; % sail elevation (snow-ice interface)
hs_T_int = interp1(datenum(t_T61(t_hs)),hs_T,datenum(t_T61),'linear'); % Experimental interpolation
% t_hs_2 = [t_T61(1) t_T61(30)  t_T61(50) t_T61(110) t_T61(180) t_T61(230) t_T61(255) t_T61(320) t_T61(370) t_T61(420) t_T61(430)  t_T61(465) t_T61(550) t_T61(628)]; % snow thickness
% hs_T_2 = [0.06          0.11       0.24       0.23       0.51       0.52       0.68       0.58       0.58       0.40       0.23        0.07       0.04       0.04]; % snow thickness
t_hs_2 = [t_T61(1) t_T61(30) t_T61(50) t_T61(110) t_T61(180) t_T61(230) t_T61(255) t_T61(320) t_T61(370) t_T61(430) t_T61(465) t_T61(550) t_T61(628)]; % snow thickness
hs_T_2 = [0.06          0.11      0.24       0.23       0.51       0.52       0.68       0.58       0.58       0.23       0.07       0.04       0.04]; % snow thickness
t_hc_DTC =  [  1  15  30  60 160 200 240 300 330 375 440 500 550 600 630 656];
hc_DTC =   -[210 210 210 210 214 222 224 238 238 242 238 256 242 238 224 214]/100;
hc_DTC_int = interp1(datenum(t_DTC26(t_hc_DTC)),hc_DTC,datenum(t_DTC26),'linear','extrap');
t_hs_DTC =  [ 1 15 30 40 50 100 200 300 385 405 415 425 445 465 475 500 521 540 570 585 600 620 630 640 650 656];
hs_DTC =    [56 56 62 72 88 090 084 086 076 074 070 072 070 062 074 082 078 052 044 030 030 022 016 014 014 010]/100;
hs_DTC_int = interp1(datenum(t_DTC26(t_hs_DTC)),hs_DTC,datenum(t_DTC26),'linear','extrap');
t_hsi_DTC_dT = [836 898 939 951 959 962 965 972 973 977 983 989 998] + 737000;
hsi_DTC_dT =   [ 28  28  28  30  36  52  52  36  26  26  16   8   0]/100;
hsi_DTC_dT_int = interp1(t_hsi_DTC_dT,hsi_DTC_dT,datenum(t_DTC26),'linear','extrap');
hsi_DTC_SIMBA = interp1(t_hsi_DTC_dT,hsi_DTC_dT,datenum(t_T61),'linear','extrap');
t_hs_DTC_dT = [836 840 842 844 847 859 865 884 909 936 940 950 953 965 969 973 977 980 984 989 992 994 997 998] + 737000;
hs_DTC_dT =   [052 054  62  72  88 090 086 084 086 088 080 078 080 078 056 054 044 030 030 022 016 014 014 010]/100;
hs_DTC_dT_int = interp1(t_hs_DTC_dT,hs_DTC_dT,datenum(t_DTC26),'linear','extrap');
t_hc_DTC_dT =  [836 840 848 864 875 887 898 911 923 937 949 968 977 984 993 998] + 737000;
hc_DTC_dT =   -[204 206 210 216 220 226 228 232 238 248 250 248 238 230 222 218]/100;
hc_DTC_dT_int = interp1(t_hc_DTC_dT,hc_DTC_dT,datenum(t_DTC26),'linear','extrap');
t_hk_DTC_dT = [836 889 907 925 946 958 965 971 983 994 998] + 737000;
hk_DTC_dT =  -[594 594 594 594 594 590 584 580 574 566 562]/100;
hk_DTC_dT_int = interp1(t_hk_DTC_dT,hk_DTC_dT,datenum(t_DTC26),'pchip','extrap');
hk_DTC_dT_lin_int = interp1(t_hk_DTC_dT,hk_DTC_dT,datenum(t_DTC26),'linear','extrap');
% OHF for level ice
load(fullfile(dataDir, 'T66.mat'));
load(fullfile(dataDir, 'T62.mat'));
load(fullfile(dataDir, 'T56.mat'));
load(fullfile(dataDir, 'T60.mat'));
c{1} = [0.0000 0.4470 0.7410]; c{2} = [0.8500 0.3250 0.0980]; c{3} = [0.9290 0.6940 0.1250]; c{4} = [0.4940 0.1840 0.5560];	c{5} = [0.4660 0.6740 0.1880]; c{6} = [0.3010 0.7450 0.9330]; c{7} = [0.6350 0.0780 0.1840]; % colors
err = [899:904 927:940 943 947:971]; T_T62([err],:) = []; t_T62([err]) = []; % remove errors
cut = 1097; t_T66 = t_T66(1:cut); T_T66 = T_T66(1:cut,:);
td_0_T66 = (datenum(t_T66)- datenum(t_T66(1))); % time of experiment [d]
bot_t_dir_T66 = [ 0  4  5 24 45 64  99 154 195 212 244 261 272]; % Direct time of measurements [d]
bot_dir_T66 =  -[37 44 46 58 70 86 108 144 158 158 150 142 130]/100 + 0.04; % Thickness for interpolation (m)
bot_int_T66 = interp1(bot_t_dir_T66,bot_dir_T66,td_0_T66,'pchip'); % Experimental bottom interpolation
top_t_dir_T66 = [0 212 215 223 225 233 241 246 254 262 266 269 272]; % Direct time of measurements [d]
top_dir_T66 =  -[0   0   6  12   0   2   0  12  22  40  42  52  54]/100; % Thickness for interpolation [m]
top_int_T66 = interp1(top_t_dir_T66,top_dir_T66,td_0_T66,'pchip'); % Experimental bottom interpolation
td_0_T62 = (datenum(t_T62)- datenum(t_T62(1))); % time of experiment [d]
td_T62 = datenum(t_T62); % time of experiment [d]
td_T66 = datenum(t_T66); td_T56 = datenum(t_T56); % time of experiment [d]
bot_t_dir_T56 = [ 1  17 173 193 265 325 424 540 644 788 836 924 940 960]; % Direct time of measurements [d]
bot_dir_T56 =  -[44  48  86  90 106 116 134 154 172 182 184 178 174 166]/100; % Thickness for interpolation (m)
bot_int_T56 = interp1(td_T56(bot_t_dir_T56),bot_dir_T56,td_T56,'pchip'); % Experimental bottom interpolation
bot_t_dir_T66 = [ 0  4  5 24 45 64  99 154 195 212 244 261 272]; % Direct time of measurements [d]
bot_dir_T66 =  -[37 44 46 58 70 86 108 144 158 158 150 142 130]/100 + 0.04; % Thickness for interpolation (m)
bot_t_dir_T66_lin = [ 0  5 24 45 64  99 154 195 212 244 261 272]; % Direct time of measurements [d]
bot_dir_T66_lin =  -[42 46 58 70 86 108 144 158 158 150 142 130]/100 + 0.04; % Thickness for interpolation (m)
bot_int_T66_lin = interp1(bot_t_dir_T66_lin,bot_dir_T66_lin,td_0_T66,'linear','extrap'); % Experimental bottom interpolation
bot_t_dir_T62 = [0   5  46  81 129 185 220 230 266]; % Direct time of measurements [d]
bot_dir_T62 =  -[98 98 106 126 152 178 178 174 170]/100; % Thickness for interpolation (m)
bot_int_T62 = interp1(bot_t_dir_T62,bot_dir_T62,td_0_T62,'pchip'); % Experimental bottom interpolation
% heat fluxes T56
k_si = 2.0; rho_si = 930; rho_i = 917; phi_m = 0.87;
ql_T56 = rho_si*334000*phi_m*diff(bot_int_T56)/24/3600./diff(td_T56); ql_T56 = [ql_T56(1) ql_T56']; % latent heat flux T56
a = 3; b = 8;
for i = 1:size(T_T56,1) % time
    T_bot_T56_1(i) = T_T56(i,-1 + round((0.76 - bot_int_T56(i))*50)); % T at the ice bottom sensor
    T_bot_T56_2(i) = T_T56(i,-4 + round((0.76 - bot_int_T56(i))*50)); % T at the ice bottom sensor + 8 cm
    T_bot_T56_a(i) = T_T56(i,-a + round((0.76 - bot_int_T56(i))*50)); % T at the ice bottom sensor
    T_bot_T56_b(i) = T_T56(i,-b + round((0.76 - bot_int_T56(i))*50)); % T at the ice bottom sensor + 8 cm
end
qc_T56 = -k_si*(T_bot_T56_1-T_bot_T56_2)./(0.02*3);
qc_T56_ab = -k_si*(T_bot_T56_a-T_bot_T56_b)./(0.02*(b-a));
week = 4*15; % number of days for averaging of OHF
qo_T56_week = accumarray(ceil((1:numel(ql_T56-qc_T56))/(week))',ql_T56(:)-qc_T56(:),[],@mean); t_T56_week = t_T56(1:week:end); % 2-week mean
% heat fluxes T66
a = 3; b = 8;
T_bot_T66_1 = zeros(1,size(T_T66,1)); T_bot_T66_2 = zeros(1,size(T_T66,1)); % preallocation
for i = 1:size(T_T66,1) % time
    T_bot_T66_1(i) = T_T66(i,-1 + round((0.96 - bot_int_T66(i))*50)); % T at the ice bottom sensor
    T_bot_T66_2(i) = T_T66(i,-4 + round((0.96 - bot_int_T66(i))*50)); % T at the ice bottom sensor + 8 cm
    T_bot_T66_a(i) = T_T66(i,-a + round((0.96 - bot_int_T66(i))*50)); % T at the ice bottom sensor
    T_bot_T66_b(i) = T_T66(i,-b + round((0.96 - bot_int_T66(i))*50)); % T at the ice bottom sensor + 8 cm
end
qc_T66 = -k_si*(T_bot_T66_1-T_bot_T66_2)./(0.02*3);
qc_T66_ab = -k_si*(T_bot_T66_a-T_bot_T66_b)./(0.02*(b-a));
ql_T66 = rho_si*334000*phi_m*diff(bot_int_T66)/24/3600./diff(td_T66); ql_T66 = [ql_T66(1) ql_T66'];
ql_T66_lin = rho_si*334000*phi_m*diff(bot_int_T66_lin)/24/3600./diff(td_T66); ql_T66_lin = [ql_T66_lin(1) ql_T66_lin'];
qo_T66_week_1 = accumarray(ceil((1:numel(ql_T66-qc_T66))/(week))',ql_T66(:)-qc_T66(:),[],@mean); t_T66_week = t_T66(1:week:end); % 2-week mean
qo_T66_week = accumarray(ceil((1:numel(ql_T66-qc_T66_ab))/(week))',ql_T66(:)-qc_T66_ab(:),[],@mean);
qo_T66_week_3 = accumarray(ceil((1:numel(ql_T66_lin-qc_T66_ab))/(week))',ql_T66_lin(:)-qc_T66_ab(:),[],@mean);
% heat fluxes T62
bot_t_dir_T62_new = [1  20 184 324 516 650 750 890 900 905 910 930 980 1040 1064]; % Direct time of measurements [d]
bot_dir_T62_new =  -[98 98 106 126 152 172 182 180 180 142 126  94  90   90   90]/100; % Thickness for interpolation (m)
bot_int_T62_new = interp1(td_T62(bot_t_dir_T62_new),bot_dir_T62_new ,td_T62,'pchip'); % Experimental bottom interpolation
ql_T62 = rho_si*334000*phi_m*diff(bot_int_T62)/24/3600./diff(td_T62); ql_T62 = [ql_T62(1) ql_T62']; % latent heat flux T62
ql_T62_new = rho_si*334000*phi_m*diff(bot_int_T62_new)/24/3600./diff(td_T62); ql_T62_new = [ql_T62_new(1) ql_T62_new']; % latent heat flux T62
a = 3; b = 8; 
for i = 1:size(T_T62,1) % time
    T_bot_T62_a(i) = T_T62(i,-a + round((0.92 - bot_int_T62(i))*50)); % T at the ice bottom sensor
    T_bot_T62_b(i) = T_T62(i,-b + round((0.92 - bot_int_T62(i))*50)); % T at the ice bottom sensor + 8 cm
end
qc_T62 = -k_si*(T_bot_T62_a-T_bot_T62_b)./(0.02*(b-a));
qo_T62_week = accumarray(ceil((1:numel(ql_T62-qc_T62))/(week))',ql_T62(:)-qc_T62(:),[],@mean); t_T62_week = t_T62(1:week:end); % 2-week mean
qo_T62_week_new = accumarray(ceil((1:numel(ql_T62_new-qc_T62))/(week))',ql_T62_new(:)-qc_T62(:),[],@mean); % 2-week mean
% heat fluxes T60 (Fort ridge keel melt)
por = 0.07;
t_hk =  [  1  10  80  90 100 102 105];
hk_T = -[860 848 848 844 840 836 836]/100;
hk_T_int = interp1(datenum(t_h30_T60(t_hk)),hk_T,datenum(t_T60),'linear','extrap'); 
Li = 333400; rhoi=916.7;
qo_T60 = rhoi*Li*0.85*(1-por)*diff(hk_T_int)./diff(datenum(t_T60))/24/3600; qo_T60 = [qo_T60(1); qo_T60]; % ocean heat flux for keel, Fort ridge
qo_T60_week = accumarray(ceil((1:numel(qo_T60))/(week))',qo_T60(:),[],@mean); t_T60_week = t_T60(1:week:end); % 2-week mean
t_T56_week(18:19) = t_T66_week(18:19); qo_T56_week(18:19) = NaN; t_T62_week(19) = t_T66_week(19); qo_T62_week(19) = NaN;

por = 0; qo_DTC = rhoi*Li*0.85*(1-por)*diff(hk_DTC_dT_int)./diff(datenum(t_DTC26))/24/3600; qo_DTC = [qo_DTC(1); qo_DTC]; % ocean heat flux for keel, Allis ridge, DTC
qo_DTC_lin = rhoi*Li*0.85*(1-por)*diff(hk_DTC_dT_lin_int)./diff(datenum(t_DTC26))/24/3600; qo_DTC_lin = [qo_DTC_lin(1); qo_DTC_lin];
qw_avg = (ql_T62(31:915)-qc_T62(31:915)+ql_T56(15:899)-qc_T56(15:899)+ql_T66(30:914)-qc_T66_ab(30:914))/3; 
qw_avg(886:886+182) = ql_T66(915:1097)-qc_T66_ab(915:1097); t_mean = t_T66(30:end); qw_avg = qw_avg';
qw_avg_smth = smooth(qw_avg,215,'sgolay');

% Density for Allis ridge, SIMBA temperatures
load(fullfile(dataDir, 'Coring_AR.mat'));
z = z_T61; % depth SIMBA T61
S_rho = interp1(z_S,S,z,'linear','extrap');
rho_int = interp1(z_S,rho_lab,z,'linear','extrap');
vg_pr_old = interp1(z_S,vg_lab,z,'linear','extrap'); % gas volume for T_lab
T_lab = ones(size(T_T61)) * -15; % Lab temperature
F1_pr_rho = -4.732-22.45*T_lab - 0.6397*T_lab.^2 - 0.01074*T_lab.^3;    
F2_pr_rho = 8.903*10^-2 - 1.763*10^-2*T_lab - 5.33*10^-4*T_lab.^2 - 8.801*10^-6*T_lab.^3;
vb_pr_rho = rho_int .* S_rho ./ F1_pr_rho; % brine volume for T_lab
rhoi_pr = (917-1.403*10^-1*T_lab); % pure ice density, Pounder (1965)
vg_pr = max((1-rho_int.*(F1_pr_rho-rhoi_pr.*S_rho/1000.*F2_pr_rho)./(rhoi_pr.*F1_pr_rho))*1000,0,'includenan'); % gas volume for T_lab    
F3_pr = rhoi_pr.*S_rho/1000./(F1_pr_rho-rhoi_pr.*S_rho/1000.*F2_pr_rho);
rhoi_rho = (917-1.403*10^-1*T_T61); % pure ice density, Pounder (1965) for T_insitu
F1_rho = -4.732-22.45*T_T61 - 0.6397*T_T61.^2 - 0.01074*T_T61.^3; % Cox and Weeks (1983)  
F1_rho(T_T61>-2) = -4.1221*10^-2 + -1.8407*10^1*T_T61(T_T61>-2).^1 + 5.8402*10^-1*T_T61(T_T61>-2).^2 + 2.1454*10^-1*T_T61(T_T61>-2).^3; % F1 from Lepparanta and Manninen (1988)
F2_rho = 8.903*10^-2 - 1.763*10^-2*T_T61 - 5.33*10^-4*T_T61.^2 - 8.801*10^-6*T_T61.^3; % Cox and Weeks (1983)
F2_rho(T_T61>-2) = 9.0312*10^-2 + -1.6111*10^-2*T_T61(T_T61>-2).^1 + 1.2291*10^-4*T_T61(T_T61>-2).^2 + 1.3603*10^-4*T_T61(T_T61>-2).^3; % F2 from Lepparanta and Manninen (1988)
F3_rho = rhoi_rho.*S_rho/1000./(F1_rho-rhoi_rho.*S_rho/1000.*F2_rho);
vb_rho = vb_pr_rho .* F1_pr_rho ./ F1_rho; % Brine volume for T_insitu, CW + LM
vg = max(0,(1-(1-vg_pr/1000).*(rhoi_rho./rhoi_pr).*(F3_pr.*F1_pr_rho./F3_rho./F1_rho))*1000,'includenan'); % Gas volume for T_insitu, CW + LM
rho_si = (-vg/1000+1).*rhoi_rho.*F1_rho./(F1_rho-rhoi_rho.*S_rho/1000.*F2_rho);

% Density for Allis ridge, DTC temperatures
T_DTC = T_DTC_all_new{60}(1:368,:);
T_DTC_clean = T_DTC_all_new{60}(1:368,4:end);
indices = find(T_DTC_clean>10); T_DTC_clean(indices) = NaN;
filter = ~(any(isnan(T_DTC_clean(:,:)),1)); filter(422) = 0; filter(1:3) = 0;
t_DTC_clean = t_DTC26(filter); T_DTC_clean = T_DTC_clean(:,filter); T_DTC_clean = T_DTC_clean';
z = z_DTC_new; % depth DTC 26 (368 elements)
S_rho = interp1(z_S,S,z,'linear','extrap');
rho_int = interp1(z_S,rho_lab,z,'linear','extrap');
vg_pr_old = interp1(z_S,vg_lab,z,'linear','extrap'); % gas volume for T_lab
T_lab = ones(size(T_DTC_clean)) * -15; % Lab temperature
F1_pr_rho = -4.732-22.45*T_lab - 0.6397*T_lab.^2 - 0.01074*T_lab.^3;    
F2_pr_rho = 8.903*10^-2 - 1.763*10^-2*T_lab - 5.33*10^-4*T_lab.^2 - 8.801*10^-6*T_lab.^3;
vb_pr_rho = rho_int .* S_rho ./ F1_pr_rho; % brine volume for T_lab
rhoi_pr = (917-1.403*10^-1*T_lab); % pure ice density, Pounder (1965)
vg_pr = max((1-rho_int.*(F1_pr_rho-rhoi_pr.*S_rho/1000.*F2_pr_rho)./(rhoi_pr.*F1_pr_rho))*1000,0,'includenan'); % gas volume for T_lab    
F3_pr = rhoi_pr.*S_rho/1000./(F1_pr_rho-rhoi_pr.*S_rho/1000.*F2_pr_rho);
rhoi_rho = (917-1.403*10^-1*T_DTC_clean); % pure ice density, Pounder (1965) for T_insitu
F1_rho = -4.732-22.45*T_DTC_clean - 0.6397*T_DTC_clean.^2 - 0.01074*T_DTC_clean.^3; % Cox and Weeks (1983)  
F1_rho(T_DTC_clean>-2) = -4.1221*10^-2 + -1.8407*10^1*T_DTC_clean(T_DTC_clean>-2).^1 + 5.8402*10^-1*T_DTC_clean(T_DTC_clean>-2).^2 + 2.1454*10^-1*T_DTC_clean(T_DTC_clean>-2).^3; % F1 from Lepparanta and Manninen (1988)
F2_rho = 8.903*10^-2 - 1.763*10^-2*T_DTC_clean - 5.33*10^-4*T_DTC_clean.^2 - 8.801*10^-6*T_DTC_clean.^3; % Cox and Weeks (1983)
F2_rho(T_DTC_clean>-2) = 9.0312*10^-2 + -1.6111*10^-2*T_DTC_clean(T_DTC_clean>-2).^1 + 1.2291*10^-4*T_DTC_clean(T_DTC_clean>-2).^2 + 1.3603*10^-4*T_DTC_clean(T_DTC_clean>-2).^3; % F2 from Lepparanta and Manninen (1988)
F3_rho = rhoi_rho.*S_rho/1000./(F1_rho-rhoi_rho.*S_rho/1000.*F2_rho);
vb_rho = vb_pr_rho .* F1_pr_rho ./ F1_rho; % Brine volume for T_insitu, CW + LM
vg = max(0,(1-(1-vg_pr/1000).*(rhoi_rho./rhoi_pr).*(F3_pr.*F1_pr_rho./F3_rho./F1_rho))*1000,'includenan'); % Gas volume for T_insitu, CW + LM
rho_si_DTC = (-vg/1000+1).*rhoi_rho.*F1_rho./(F1_rho-rhoi_rho.*S_rho/1000.*F2_rho);

% temperature of air and water
Ta_PS_cor = Ta_PS(14902:454102); t_PS_cor = t_PS(14902:454102); t_PS_cor(Ta_PS_cor == 9) = []; Ta_PS_cor(Ta_PS_cor == 9) = [];
Tf_PS_new = gsw_CT_freezing(Sw_PS_new,0,1); % freezing point from salinity for PS
t_PS_6h = t_PS_new(1:36:end);
Tw_PS_new_cor = fillmissing(Tw_PS_new,'constant',-1.82);
Tw_PS_6h = accumarray(ceil((1:numel(Tw_PS_new_cor))/36)',Tw_PS_new_cor(:),[],@mean);
Tf_PS_6h = accumarray(ceil((1:numel(Tf_PS_new))/36)',Tf_PS_new(:),[],@mean);
Tw_PS_6h(999:1004) = Tw_PS_6h(998); % correction
Ta_PS_6h = accumarray(ceil((1:numel(Ta_PS_cor))/360)',Ta_PS_cor(:),[],@mean); t_PS_a_6h = t_PS_cor(1:360:end); % 6h mean Ta from PS
Tw_PS_6h_int = interp1(datenum(t_PS_6h),Tw_PS_6h,datenum(t_T61),'linear'); % interpolation
Ta_PS_6h_int = interp1(datenum(t_PS_a_6h),Ta_PS_6h,datenum(t_T61),'linear'); % interpolation
t_ASFS_hour = t_ASFS(1:360:end);
Ta_ASFS_hour = accumarray(ceil((1:numel(Ta_ASFS_clean))/360)',Ta_ASFS_clean(:),[],@mean);
Ta_ASFS_int = interp1(datenum(t_ASFS_hour),Ta_ASFS_hour,datenum(t_T61(453:496)),'linear','extrap');
Ta_PS_6h_int(453:496) = Ta_ASFS_int; % substituting PS air temperature by ASFS, 29 may - 08 jun
Ta_PS_6h_DTC = interp1(datenum(t_T61),Ta_PS_6h_int,datenum(t_DTC26(4:end)),'linear'); % interpolation

% degree of consolidation vs time (ridge overview paper for Mats)
hsn_DTC_SIMBA = interp1(datenum(t_DTC26(4:end)),hs_DTC_dT_int(4:end)-hsi_DTC_dT_int(4:end),datenum(t_T61),'pchip'); % interpolation
dhc = 2.7672; % assumed consolidation from drilling for SIMBA
hc_avg = -1.7 + dhc*(hc_T_int-hc_T_int(1))/(hc_T_int(1)-hc_T_int(end)); % CL from SIMBA, normalized for drilling
hsn_avg = hsn_DTC_SIMBA + hs_T_int; hs_avg = hs_T_int; % snow from DTC and sail from SIMBA
d_hk = 0.333; % assumed keel melt for SIMBA
t0 = 370; t1 = 1059; hk_avg = interp1(datenum(t_mean(t0:t1)),cumsum(qw_avg_smth(t0:t1))/sum(qw_avg_smth(t0:t1))*d_hk-5.6,datenum(t_T61),'pchip'); % keel melt prop. to qw for level ice
rhos = 350; por = 0.29; rhow = 1020;
rhosi_s = mean(rho_si(:,36:40),2); % Sail density
rhosi_c = mean(rho_si(:,41:166),2); % CL density
rhosi_k = mean(rho_si(:,166:240),2); % Rubble density
grav = (hsn_avg-hs_avg)*rhos + hs_avg*(1-por).*rhosi_s + -hc_avg.*rhosi_c + (hc_avg-hk_avg)*(1-por).*rhosi_k;
buoy = -hc_avg*rhow + (hc_avg-hk_avg)*(1-por)*rhow;
fb = (grav-buoy)/rhow;
d_li = -0.9*(0.5*top_int_T66(399:1087) - bot_int_T66(399:1087)); t_li = t_T66(399:1087);
d_li_all = -0.9*(0.5*top_int_T66(1:1087) - bot_int_T66(1:1087)); t_li_all = t_T66(1:1087);
% ridge initial stage
for i = 1:length(t_PS_a_6h(383:512))
    FDD(i) = (datenum(t_PS_a_6h(382+i))-datenum(t_PS_a_6h(382)))*(-1.8-mean(Ta_PS_6h(382:383+i)));
end
FDD = [0 FDD(1:end-1)];
coef = 24*3600;
por = 0.36355; Lc = Li*por;
k = sqrt(2*2.1/rhoi/Lc*coef);
hc = k * sqrt(FDD);
% level ice projection for August and September
t0_ext = 963-120;
t_li_ext = t_T66(t0_ext:1097) + (1097-t0_ext+1)/4; % August
dh = max(0,bot_int_T66(t0_ext:1097)-min(bot_int_T66(t0_ext:1097)));
h_li_ext = -bot_int_T66(end) - (-flipud(dh)+dh(end));
t_li_ext_cor = [t_T66; t_li_ext]; h_li_ext_cor = [-bot_int_T66; h_li_ext];
h_li_ext_cor(830:end) = (h_li_ext_cor(830:end)-h_li_ext_cor(830))*2+h_li_ext_cor(830); clear t0_ext h_li_ext dh t_li_ext
h_k_ext = interp1(datenum([t_T66(270); t_T61]),[hk_avg(1)-fb(1); hk_avg-fb],datenum(t_T66),'pchip'); % Experimental keel interpolation
h_k_ext(1087:1352) = hk_avg(end)-fb(end) - (h_li_ext_cor(1087:end)-h_li_ext_cor(1087))*2*2*0.9;
% h_c_ext = interp1(datenum([t_T66(270); t_T61]),[hc_avg(1)-fb(1); hc_avg-fb],datenum(t_T66),'pchip'); % Experimental CL interpolation
h_c_ext = interp1(datenum([t_PS_a_6h(383:512); t_T61]),[-hc'; hc_avg-fb],datenum(t_T66),'pchip'); % Experimental CL interpolation
h_c_ext(1087:1352) = max(hc_avg(end)-fb(end) - (h_li_ext_cor(1087:end)-h_li_ext_cor(1087))*2*0.9,h_k_ext(1087:1352));

fig = figure('Units','inches', 'Position',[1 3 10 3.2],'Color','w');
tile = tiledlayout(1,2); tile.TileSpacing = 'compact'; tile.Padding = 'none';
nexttile
msz = 5.5; C = linspecer(10);
porosity = 0.26;
fill([datetime('01-Jan-2020') datetime('01-Jun-2020') datetime('01-Jun-2020') datetime('01-Jan-2020')],[0 0 1/sqrt(porosity) 1/sqrt(porosity)],1,'FaceColor',c{1},'EdgeColor','none'); alpha(.1); hold on
fill([datetime('01-Jan-2020') datetime('01-Jun-2020') datetime('01-Jun-2020') datetime('01-Jan-2020')],[1/sqrt(porosity) 1/sqrt(porosity) 5 5],1,'FaceColor',c{2},'EdgeColor','none'); alpha(.1);
fill([datetime('01-Jun-2020') datetime('01-Aug-2020') datetime('01-Aug-2020') datetime('01-Jun-2020')],[0 0 5 5],1,'FaceColor',c{3},'EdgeColor','none'); alpha(.1);
plot([datetime('01-Jan-2020') datetime('01-Jun-2020')],[1/sqrt(porosity), 1/sqrt(porosity)],'k--');
plot([datetime('01-Jun-2020') datetime('01-Jun-2020')],[0, 5],'k--');
p = text(datetime('15-Mar-2020'),0.2,'Winter consolidation'); set(p,'Color',c{1},'HorizontalAlignment','center','FontSize',font);
p = text(datetime('15-Mar-2020'),5-0.2,'Spring consolidation'); set(p,'Color',c{2},'HorizontalAlignment','center','FontSize',font);
p = text(datetime('28-Jul-2020'),5-0.2,'Summer'); set(p,'Color',c{3},'HorizontalAlignment','right','FontSize',font);
p = text(datetime('28-Jul-2020'),5-0.5,'melt'); set(p,'Color',c{3},'HorizontalAlignment','right','FontSize',font);

plot(t_li_ext_cor(270:399),-h_c_ext(270:399)./h_li_ext_cor(270:399)*0.9,'--','color',C(8,:),'linewidth',0.5); hold on % extended CL draft
plot(t_li_ext_cor(399:1087),-h_c_ext(399:1087)./h_li_ext_cor(399:1087)*0.9,'-','color',C(8,:),'linewidth',0.5); % extended CL draft
% h = plot(datetime(t_vol(1,:)),mean(hc_vol./hi_vol),'o','LineWidth',0.5,'color',C(1,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color')); hold on
% h = plot(datetime(t_bla),hc_bla./hi_bla,'o','LineWidth',0.5,'color',C(2,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_hoy02),hc_hoy02./hi_hoy02,'o','LineWidth',0.5,'color',C(3,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_hoy07),hc_hoy07./hi_hoy07,'o','LineWidth',0.5,'color',C(4,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_kha),hc_kha./hi_kha,'o','LineWidth',0.5,'color',C(5,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_bon),hc_bon./hi_bon,'o','LineWidth',0.5,'color',C(6,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_erv),hc_erv./hi_erv,'o','LineWidth',0.5,'color',C(7,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_sal),hc_sal./hi_sal,'o','LineWidth',0.5,'color',C(8,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_guz2),hc_guz2./hi_guz2,'o','LineWidth',0.5,'color',C(9,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
% h = plot(datetime(t_guz),hc_guz./hi_guz,'o','LineWidth',0.5,'color',C(10,:)); h.MarkerSize = msz; set(h,'markerfacecolor',get(h,'color'));
h = plot(datetime(t_vol(1,:)),mean(hc_vol./hi_vol),'o','LineWidth',0.3,'color',C(1,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]); hold on
h = plot(datetime(t_bla),hc_bla./hi_bla,'o','LineWidth',0.3,'color',C(2,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_hoy02),hc_hoy02./hi_hoy02,'o','LineWidth',0.3,'color',C(3,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_hoy07),hc_hoy07./hi_hoy07,'o','LineWidth',0.3,'color',C(4,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_kha),hc_kha./hi_kha,'o','LineWidth',0.3,'color',C(5,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_bon),hc_bon./hi_bon,'o','LineWidth',0.3,'color',C(6,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_erv),hc_erv./hi_erv,'o','LineWidth',0.3,'color',C(7,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_sal),hc_sal./hi_sal,'o','LineWidth',0.3,'color',C(8,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_guz2),hc_guz2./hi_guz2,'o','LineWidth',0.3,'color',C(9,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);
h = plot(datetime(t_guz),hc_guz./hi_guz,'o','LineWidth',0.3,'color',C(10,:)); h.MarkerSize = msz; set(h,'MarkerFaceColor',get(h,'color'),'MarkerEdgeColor',[0.80 0.80 0.80]);

ylim([0 5]);
hYLabel = ylabel('Degree of consolidation, {\it h_c / h_i}'); set([hYLabel gca],'FontSize',font,'FontWeight','normal');
leg = legend('','','','','','','','Voelker et al., 1981','Blanchet, 1998','Høyland, 2002','Høyland, 2007','Kharitonov, 2012','Bonath et al., 2018','Ervik et al., 2018','Salganik et al., 2023','Guzenko et al., 2025','Guzenko et al., 2026','box','off');
set(leg,'FontSize',font-2,'Location','eastoutside'); leg.ItemTokenSize = [6,18*0.01];
title('Ridge consolidation observations','FontSize',font,'FontWeight','normal');
annotation('textbox',[0 .51 0.02 .51],'String','(a)','EdgeColor','none','HorizontalAlignment','center','FontSize',font);
ax = gca; ax.XTick = datetime(['01-Jan-2020';'01-Feb-2020';'01-Mar-2020';'01-Apr-2020';'01-May-2020';'01-Jun-2020';'01-Jul-2020';'01-Aug-2020']); datetick('x','mmm','keepticks'); xtickangle(0); % time

nexttile
water_ext=0.03*cos(2*pi*(1/15)*datenum(t_li_ext_cor)); plot(t_li_ext_cor,water_ext,'color',[0.6 0.6 0.6],'LineWidth',0.5); hold on % waterline
fill([t_li_ext_cor; fliplr(t_li_ext_cor')'],[water_ext; fliplr(-0.9*h_li_ext_cor')'],1,'FaceColor',c{1},'EdgeColor','none'); alpha(.1); hold on % shaded LI
fill([t_li_ext_cor(399:end); fliplr(t_li_ext_cor(399:end)')'],[-0.9*h_li_ext_cor(399:end); fliplr(h_c_ext(399:end)')'],1,'FaceColor',c{4},'EdgeColor','none'); alpha(.1); % shaded CL
fill([t_T61; fliplr(t_T61')'],[hc_avg-fb; fliplr(hk_avg'-fb')'],1,'FaceColor',c{5},'EdgeColor','none'); alpha(.1); % shaded rubble
fill([t_T66(270:300); t_PS_a_6h(383+100:512); t_T61(1); t_T66(270)],[d_li_all(270:300); -hc(1+100:end)'; hk_avg(1)-fb(1); hk_avg(1)-fb(1)],1,'FaceColor',c{5},'EdgeColor','none'); alpha(.1); % shaded rubble
fill([t_T66(270+30:399)' fliplr(t_PS_a_6h(383+30:512)')],[d_li_all(270+30:399)' fliplr(-hc(1+30:130))],1,'FaceColor',c{4},'EdgeColor','none'); alpha(.1); % shaded rubble
fill([t_li_ext_cor(1087:1179); fliplr(t_li_ext_cor(1087:1179)')'],[h_c_ext(1087:1179); fliplr(h_k_ext(1087:1179)')'],1,'FaceColor',c{5},'EdgeColor','none'); alpha(.1); % shaded extended rubble

plot(t_T61,hc_avg-fb,'-','color',c{4},'LineWidth',1.5); % CL draft
plot(t_T61,hk_avg-fb,'-','color',c{5},'LineWidth',1.5); % Keel draft
plot(t_li_ext_cor(1:1097),-0.9*h_li_ext_cor(1:1097),'-','color',c{1},'linewidth',1.5); % FYI draft
plot(t_PS_a_6h(383:512),-hc,'--','color',c{4},'LineWidth',0.5); % modelled initial ridge consolidation
plot([t_T66(270) t_T61(1)],[hk_avg(1)-fb(1) hk_avg(1)-fb(1)],'-','color',c{5},'LineWidth',1.5); % extrapolated keel draft
plot(t_li_ext_cor(1098:end),-0.9*h_li_ext_cor(1098:end),'--','color',c{1},'linewidth',1.0); % extended FYI draft
plot(t_li_ext_cor(1087:end),h_k_ext(1087:end),'--','color',c{5},'linewidth',0.5); % extended keel draft
plot(t_li_ext_cor(1087:1179),h_c_ext(1087:1179),'--','color',c{4},'linewidth',0.5); % extended CL draft

plot([t_T66(270) t_T66(270)],[-6 1],':','color',[0.6 0.6 0.6],'LineWidth',1.0); % ridge formation
plot([t_T66(690) t_T66(690)],[-6 1],':','color',[0.6 0.6 0.6],'LineWidth',1.0); % snow consolidation
plot([t_T66(854) t_T66(854)],[-6 1],':','color',[0.6 0.6 0.6],'LineWidth',1.0); % ice melt onset

p = text(t_T61(280),-0.60,'Level ice'); set(p,'Color',c{1},'HorizontalAlignment','right','FontSize',font-1);
p = text(t_T61(280),-1.5,'Consolidated'); set(p,'Color',c{4},'HorizontalAlignment','right','FontSize',font-1);
p = text(t_T61(280),-1.8,'layer'); set(p,'Color',c{4},'HorizontalAlignment','right','FontSize',font-1);
p = text(t_T66(250),-1.0,'Ridge'); set(p,'Color','k','HorizontalAlignment','right','FontSize',font-1);
p = text(t_T66(250),-1.3,'formation'); set(p,'Color','k','HorizontalAlignment','right','FontSize',font-1);
p = text(t_T61(280),-5.3,'Rubble'); set(p,'Color',c{5},'HorizontalAlignment','right','FontSize',font-1);
p = text(t_T61(100),-2.3,'Winter'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);
p = text(t_T61(100),-2.6,'consolidation'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);
p = text(t_T61(370),-3.9,'Spring'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);
p = text(t_T61(370),-4.2,'consoli-'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);
p = text(t_T61(370),-4.5,'dation'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);
p = text(t_T61(580),-4.4,'Summer'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);
p = text(t_T61(580),-4.7,'melt'); set(p,'Color','k','HorizontalAlignment','center','FontSize',font-1);

ylim([-6.0 0.2]); hYLabel = ylabel('Draft (m)'); set([hYLabel gca],'FontSize',font,'FontWeight','normal');
ax = gca; ax.XTick = datetime(['01-Nov-2019';'01-Dec-2019';'01-Jan-2020';'01-Feb-2020';'01-Mar-2020';'01-Apr-2020';'01-May-2020';'01-Jun-2020';'01-Jul-2020';'01-Aug-2020';'01-Sep-2020';'01-Oct-2020']); datetick('x','mmm','keepticks'); xtickangle(0); % time
annotation('textbox',[0.39 .51 0.40 .51],'String','(b)','FontSize',font,'EdgeColor','none','HorizontalAlignment','center');
title('Seasonal evolution of first-year ridge','FontSize',font,'FontWeight','normal');

% Export figure
outFile = fullfile(figDir, 'Figure12_degree_consolidation_upd.png');
drawnow;
print(fig, outFile, '-dpng', '-r300');
fprintf('Figure saved: %s\n', outFile);
