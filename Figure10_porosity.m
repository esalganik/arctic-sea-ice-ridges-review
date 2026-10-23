% Figure 10: linked rubble and keel macroporosity
% All usable observations from the updated compilation.
% Four supplied papers checked; other source entries retained as supplied.
% Output: 6.6 x 2.2 inches, PNG at 300 dpi, PNG only.
clear; close all; clc
T = table;
% Datasets
% Hoyland 2002
hi = []; hc = [];
meta.author = "Høyland, 2002";
meta.name = "Simulations of the consolidation process in first-year sea ice ridges";
meta.url = "https://doi.org/10.1016/S0165-232X(02)00002-2";

t  = datetime({'02-Mar-1998','10-Mar-1999'});
hi = [0.95 0.70];       % initial level ice thickness, m
hc = [1.19 0.91];       % initial consolidated layer thickness, m
hk = [4.4  5.0];          % keel depth, m
pr = [0.325 0.35];      % rubble porosity
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity incl. CL

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Bonnemaire et al., 2003
hi = []; hc = [];
meta.author = "Bonnemaire et al., 2003";
meta.name = "Barents Sea ridge";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime('06-May-2002');
hi = 1.35;    % level ice thickness, m
hc = 1.90;    % consolidated layer thickness, m
hk = 15.0;    % keel depth, m
pr = 0.297;   % rubble porosity
pt = 0.24;    % total ridge porosity
ps = 0.153;   % sail porosity
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Kharitonov, 2005
hi = []; hc = [];
meta.author = "Kharitonov, 2005";
meta.name = "Peculiarities of Fractional Composition of the Pechora Sea First-Year Ridges";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime('15-Apr-1999');  % measurement period: April 1999
hi = 0.70;                     % level ice thickness, m
hc = 0.54;                     % refrozen layer, used as CL analogue, m
hk = 6.09;                     % mean keel depth, m
pk = 0.17;                     % total ridge / bulk porosity
pr = pk .* hk ./ (hk - hc);     % rubble porosity assuming zero porosity in CL

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Kharitonov & Morev, 2005
hi = []; hc = [];
meta.author = "Kharitonov & Morev, 2005";
meta.name = "Central Arctic ridge observations";
meta.url = "https://poac.com/PapersOnline.html";

t  = repmat(datetime(2004,9,6),3,1);  % 5-9 Sep 2004, midpoint
pk = [0.12 0.16 0.15];               % void fraction in keel
hk = [3.82 5.95 4.98];  % average keel draft (Table 2)
hi = [2.15 1.98 2.27]; % Table 2
pr = nan(1,3); % Reported keel fractions are not rubble fractions

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Hoyland, 2007: Appendix A Tables 1-2; fieldwork early-mid May
hi = []; hc = [];
meta.author = "Høyland, 2007";
meta.name = "Morphology and small-scale strength of ridges in the North-Western Barents Sea";
meta.url = "https://doi.org/10.1016/j.coldregions.2006.10.010";
t = datetime([2002 2003 2004 2005],5,10); % Approximate May plotting dates
hi = [1.20 0.96 NaN 0.48]; % 2002: minimum floe thickness, not mean
pr = [0.30 0.10 0.36 0.45];
hc = [1.90 NaN NaN 1.05]; % Multiple method-dependent estimates in 2003/04
hk = nan(1,4); % No verified mean depths for a whole-keel conversion
pk = nan(1,4); % Do not use maximum keel depths as mean depths
T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Strub-Klein et al., 2009
hi = []; hc = [];
meta.author = "Strub-Klein et al., 2009";
meta.name = "Ridge porosity observations";
meta.url = "https://poac.com/PapersOnline.html";

t  = [datetime(2008,5,1); datetime(2008,9,7)];
pk = [0.275; 0.1157];  % keel macroporosity
pr = [NaN; NaN]; % Table 4 combines keel/rubble; do not duplicate as rubble
hk     = [8.0; 4.33];   % mean keel depth (approx)
hk_max = [8.20; 5.03];  % max keel depth

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Kharitonov, 2012
hi = []; hc = [];
meta.author = "Kharitonov, 2012";
meta.name = "Internal structure and porosity of ice ridges investigated at «North Pole‐38» drifting station";
meta.url = "https://doi.org/10.1016/j.coldregions.2012.05.018";

t  = datetime({'08-Apr-2011','24-May-2011','04-Jun-2011'});  % midpoints of measurement periods
hi = [1.02 1.7 1.7];         % level ice thickness, m; R1 range 0.86-1.18, mean approximated as 1.02
hc = [3.00 5.4 1.8];         % consolidated layer thickness, m
hk = [6.67 12.65 9.40];      % mean keel depth, m
pk = [0.18 0.08 0.09];       % keel porosity incl. CL
pr = hk ./ (hk - hc) .* pk;  % derived rubble porosity

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Sand et al., 2015
hi = []; hc = [];
meta.author = "Sand et al., 2015";
meta.name = "ColdTech field data";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime({'19-Mar-2011';'29-Mar-2011';'14-Mar-2012';'27-Apr-2013';'28-Apr-2013';'29-Apr-2013'});
pk = [0.11; 0.13; 0.06; 0.04; 0.14; 0.16];  % keel macroporosity / void fraction
hi = [0.37 0.80 0.94 0.64 0.62 0.61]; % Table 2
hc = [NaN 1.48 1.80 1.19 1.48 1.54];
pr = nan(6,1); % Table 5 reports keel, not rubble, porosity
hk = 0.59 * [5.1; 6.8; 6.7; 3.4; 6.8; 7.6];        % max keel depth (Table 2) + Hk_avg ≈ 0.59 Hk_max (Strub-Klein & Sudom, 2012)

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Bonath 2018
hi = []; hc = [];
meta.author = "Bonath, 2018";
meta.name = "Morphology, internal structure and formation of ice ridges in the sea around Svalbard";
meta.url = "https://doi.org/10.1016/j.coldregions.2018.08.011";

t  = datetime({'29-Mar-2011','29-Mar-2011','29-Mar-2011','14-Mar-2012','14-Mar-2012','14-Mar-2012','28-Apr-2013','28-Apr-2013','28-Apr-2013'});
hi = [0.80 0.94 1.14 0.64 0.62 0.62 0.62 0.67 0.67];  % level ice thickness, m
hc = [2.02 2.82 1.64 1.36 1.84 1.85 1.33 1.73 1.92];  % consolidated layer thickness, m
pk = [0.05 0.02 0.01 0.03 0.06 0.05 0.02 0.08 0.12];  % keel macroporosity
pr = [0.31 0.22 0.20 0.27 0.34 0.31 0.19 0.38 0.51];  % rubble porosity
hk = 0.59 * [5.1 5.1 5.1 6.7 6.7 6.7 6.8 6.8 6.8];    % max keel depth per ridge + Hk_avg = 0.59 Hk_max (Strub-Klein & Sudom, 2012)
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity (Estimated as reported keel porosity seems too low)

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Ervik, N-ICE 2018
hi = []; hc = [];
meta.author = "Ervik et al., 2018";
meta.name = "On the decay of first-year ice ridges: Measurements and evolution of rubble macroporosity, ridge drilling resistance and consolidated layer strength";
meta.url = "https://doi.org/10.1016/j.coldregions.2018.03.024";

t  = datetime({'22-May-2015','03-Jun-2015','24-May-2015','31-May-2015','10-Jun-2015','12-Jun-2015'});
hi = [1.40 1.24 1.30 1.30 0.64 0.64];  % level ice thickness, m; check source, not from Ervik Table 2
hc = [2.50 2.70 0.80 0.80 2.30 3.00];  % consolidated layer thickness from drilling, m
hk = [10.8 10.6 3.2 3.3 4.8 7.3];     % maximum keel depth, m
pk = [0.06 0.06 0.12 0.04 0.08 0.08];  % keel macroporosity incl. CL
pr = [0.11 0.10 0.25 0.16 0.22 0.27];  % rubble macroporosity

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Salganik et al., 2023
hi = []; hc = [];
meta.author = "Salganik et al., 2023";
meta.name = "Different mechanisms of Arctic first-year sea-ice ridge consolidation observed during the MOSAiC expedition";
meta.url = "https://doi.org/10.1525/elementa.2023.00008";

t  = datetime({'05-Feb-2020','26-Jul-2020'});
hi = [1.17 1.07];  % level ice thickness at coring site, m
hc = [1.70 3.90];  % consolidated layer thickness, mean ridge values, m
hk = [5.60 4.70];  % mean keel depth, m
pr = [0.29 0.15];  % rubble macroporosity; summer value = max flank / remaining rubble
pk = [0.22 0.03];  % total keel macroporosity incl. CL; summer all-transect mean

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Guzenko et al., 2025
hi = []; hc = [];
meta.author = "Guzenko et al., 2025";
meta.name = "Formation and Consolidation of a First-year Ridge Based on Nine Months of Observations at the Drifting Station 'North Pole-41'";
meta.url = "https://doi.org/10.17736/ijope.2025.jc943";

t  = datetime({'15-May-2020','05-Jul-2020','01-Aug-2020','15-May-2020','05-Jul-2020','01-Aug-2020','15-May-2020','05-Jul-2020','01-Aug-2020'});
hc = [2.45 2.65 2.34 2.58 2.95 2.64 2.29 2.75 2.46];           % consolidated layer thickness, m
cl_hi = [1.4 1.5 1.5 1.5 1.6 1.7 1.3 1.5 1.6];                 % CL / level ice thickness
hi = hc ./ cl_hi;                                               % derived level ice thickness, m
hk = [2.81 2.89 2.17 3.75 3.65 2.34 3.82 3.43 2.30];           % keel thickness / draft, m
pr = [0.020 0.022 0.000 0.121 0.302 0.000 0.111 0.066 0.000];  % rubble porosity
pk = pr .* (hk - hc) ./ hk;                                     % keel-average porosity incl. CL

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Guzenko et al., 2026
hi = []; hc = [];
meta.author = "Guzenko et al., 2026";
meta.name = "Morphometry and internal structure of large ice ridges and stamukhas in the Kara, Laptev and East Siberian seas";
meta.url = "https://doi.org/10.1016/j.joes.2026.03.004";

t  = datetime({'13-Apr-2014','12-Apr-2015','28-Apr-2014','02-Jun-2015','13-May-2014','15-May-2015','23-May-2014','07-May-2015','30-Mar-2017','25-Mar-2017'},'InputFormat','dd-MMM-yyyy');
hi = [0.89 0.94 1.51 1.38 0.97 1.15 1.46 1.55 1.76 1.65];  % level ice thickness, m
hc = [1.54 1.39 1.96 2.18 1.69 2.16 3.02 2.61 2.51 2.38];  % consolidated layer thickness, m
pr = [0.24 0.31 0.28 0.25 0.36 0.26 0.27 0.25 0.29 0.20];  % rubble porosity
hk = [5.12 4.88 6.21 6.80 5.02 5.45 5.68 5.71 4.33 5.58];  % keel thickness / draft, m
pk = pr .* (hk - hc) ./ hk;                                 % keel-average porosity incl. CL

T = addData(T,t,pk,hk,pr,hi,hc,meta);

% Provenance and seasonal classification
% Preserve input values before any eligibility decisions.
T.prInput = T.pr;
T.pkInput = T.pk;
T.note = repmat("",height(T),1);
% User-defined calendar groups, regardless of observed local melt onset.
T.season = repmat("new season",height(T),1);
T.season(month(T.time)<6) = "pre-melt";
T.season(month(T.time)>=6 & month(T.time)<=8) = "melt";
rows = T.author=="Guzenko et al., 2025";
% With no remaining rubble, zero is not a measurement of rubble porosity.
emptyRubble = rows & T.hc>=T.hk;
T.pr(emptyRubble) = NaN;
T.note(emptyRubble) = "No remaining rubble indicated by hc>=hk; rubble porosity undefined";
rows = T.author=="Strub-Klein et al., 2009";
T.note(rows) = "Table 4 keel/rubble aggregate; plotted only in c; September summarizes five ridges";
rows = T.author=="Høyland, 2007";
T.note(rows) = "May date approximate; melting documented; pk unavailable without compatible mean geometry";
T.note(rows & year(T.time)==2002) = "hi=1.20 is minimum floe thickness; May approximate; melting documented";
T.note(T.author=="Sand et al., 2015") = "Reported keel porosity; pre-melt inferred; possible overlap with Bonath campaigns";
T.note(T.author=="Kharitonov & Morev, 2005") = "September dates approximate; second-year floes; no separate rubble porosity";
T.note(T.author=="Bonnemaire et al., 2003") = "Melt status unverified; possible overlap with Hoyland 2002 campaign in 2007 paper";
T.note(T.author=="Bonath, 2018") = "User interpretation restored: original arrays and derived whole-keel porosity";
T.pkBasis = repmat("derived",height(T),1);
T.pkBasis(ismember(T.author,["Kharitonov, 2005","Kharitonov & Morev, 2005", ...
    "Kharitonov, 2012","Sand et al., 2015","Ervik et al., 2018", ...
    "Salganik et al., 2023"])) = "entered directly";
T.pkBasis(T.author=="Strub-Klein et al., 2009") = "reported keel/rubble aggregate";
T.pkBasis(~isfinite(T.pk)) = "unavailable";
T.plotDay = datenum(datetime(2020,month(T.time),day(T.time)));
T.useA = isfinite(T.hi) & isfinite(T.pr) & month(T.time)<9;
T.useB = isfinite(T.pr) & month(T.time)<9;
T.useC = isfinite(T.pk) & T.pk>=0 & month(T.time)<9;

% Identify underlying ice features, independently of number of plotted rows.
T.featureIDs = cell(height(T),1);
T.unknownN = false(height(T),1);
for j=1:height(T), T.featureIDs{j}=strings(0,1); end
T = assignIDs(T,"Høyland, 2002",["Svartodden1998","CampMorton1999"]);
T = assignIDs(T,"Bonnemaire et al., 2003","Hopen2002");
T = assignIDs(T,"Høyland, 2007",["Hopen2002","Hopen2003","Hopen2004","Hopen2005"]);
T = assignIDs(T,"Kharitonov, 2012",["NP38_R1","NP38_R2","NP38_R3"]);
T = assignIDs(T,"Sand et al., 2015", ...
    ["ColdTech_R1_2011","ColdTech_R2_2011","ColdTech_R2_2012", ...
     "ColdTech_R1_2013","ColdTech_R2_2013","ColdTech_R3_2013"]);
T = assignIDs(T,"Bonath, 2018", ...
    ["ColdTech_R2_2011",repmat("ColdTech_R2_2012",1,3), ...
     repmat("ColdTech_R2_2013",1,3),repmat("ColdTech_R3_2013",1,2)]);
T = assignIDs(T,"Ervik et al., 2018", ...
    ["NICE_R1","NICE_R1","NICE_R2","NICE_R2","NICE_R3","NICE_R4"]);
T = assignIDs(T,"Salganik et al., 2023",repmat("MOSAiC_Alli",1,2));
T = assignIDs(T,"Guzenko et al., 2025",repmat("NP41_Lyuba",1,9));
T = assignIDs(T,"Strub-Klein et al., 2009",["Barents2008","Fram2008_aggregate"]);
T = assignIDs(T,"Kharitonov, 2005","Kharitonov2005_assumed_one");
% User-requested counting convention; the source reports a regional aggregate.
T.note(T.author=="Kharitonov, 2005")="Counted as one ridge by user convention; actual unique ridge count not reported";
% Guzenko Table 3: nine ridge groups and one group of 15 stamukhas.
rows=find(T.author=="Guzenko et al., 2026");
groupN=[11 11 6 4 16 8 4 6 22 15];
for k=1:numel(rows)
    if k==10, prefix="S_G26_"; else, prefix="R_G26_"; end
    T.featureIDs{rows(k)}=prefix+string(k)+"_"+string((1:groupN(k))');
end
% De-duplicate overlapping publications without averaging incompatible summaries.
% a,b: use Hoyland 2007 for Hopen2002, not the Bonnemaire duplicate.
r=T.author=="Bonnemaire et al., 2003";
T.useA(r)=false; T.useB(r)=false;
% c: keep Bonnemaire because Hoyland 2007 has no usable pk in this compilation.
% c: retain Sand only for the two ridges absent from the selected Bonath profiles.
rows=find(T.author=="Sand et al., 2015");
T.useC(rows([2 3 5 6]))=false;

% Figure settings
figWidth = 10; figHeight = 3.2; font = 9; ms = 4;
% Output folder relative to this script
scriptDir = fileparts(mfilename('fullpath'));
outFolder = fullfile(scriptDir, 'figures');

if ~exist(outFolder, 'dir')
    mkdir(outFolder);
end
sources = unique(T.author,'stable');
if exist('linspecer','file'), C=linspecer(numel(sources));
else, C=lines(numel(sources)); end
displayScale = 1;
fig = figure('Units','inches', ...
    'Position',[0.5 1 figWidth*displayScale figHeight*displayScale],'Color','w');
tile = tiledlayout(1,3);
tile.TileSpacing = 'compact';
tile.Padding = 'none';

% (a) Rubble macroporosity vs level-ice thickness

ax1=nexttile(tile,1); hold(ax1,'on');

% Regression and summary use all plotted February-August observations.
r=T.useA;

x=T.hi(r); y=T.pr(r); [x,ix]=sort(x); y=y(ix);

if numel(x)>=3 && numel(unique(x))>=2

    mdl=fitlm(x,y);

    xf=linspace(min(x),max(x),100)';

    yf=predict(mdl,xf);

    % Fitted line +/- one sample standard deviation of residuals.

    residualSD=std(mdl.Residuals.Raw,0,'omitnan');

    ci=[yf-residualSD yf+residualSD];

    fill(ax1,[xf;flipud(xf)],[ci(:,1);flipud(ci(:,2))],'k', ...
        'FaceAlpha',0.07,'EdgeColor','none','HandleVisibility','off');

    plot(ax1,xf,yf,'--k','LineWidth',1.2,'HandleVisibility','off');

    text(ax1,0.97,0.96,{sprintf('R^2 = %.2f',mdl.Rsquared.Ordinary), ...
        pLabel(mdl.Coefficients{2,4}), ...
        sprintf('Mean = %.2f %s %.2f',mean(y),char(177),std(y))}, ...
        'Units','normalized','HorizontalAlignment','right', ...
        'VerticalAlignment','top','FontSize',font);

end

plotRubble(ax1,T,'hi',T.useA,sources,C,ms);

xlabel(ax1,'Level ice thickness (m)');
ylabel(ax1,'Rubble macroporosity');

xlim(ax1,[0.4 max(1.8,ceil(max(T.hi(T.useA))*5)/5)]);

xticks(ax1,0.4:0.4:2.4);
ylim(ax1,[0 0.6]);

% (b) Rubble porosity vs time: seasonal means +/- SD
ax2=nexttile(tile,2); hold(ax2,'on');
seasons=["pre-melt","melt"]; styles={'-','--'}; mu=nan(1,2); sd=mu;
for k=1:2
    r=T.useB & T.season==seasons(k);
    if nnz(r)>=2
        mu(k)=mean(T.pr(r)); sd(k)=std(T.pr(r));
        bounds=[datenum(2020,2,1) datenum(2020,6,1) datenum(2020,8,15)];
        bandMean(ax2,bounds(k),bounds(k+1),mu(k),sd(k),styles{k});
    end
end
plotRubble(ax2,T,'plotDay',T.useB,sources,C,ms);
text(ax2,0.97,0.96,{sprintf('Pre-melt: %.2f %s %.2f',mu(1),char(177),sd(1)), ...
    sprintf('Melt: %.2f %s %.2f',mu(2),char(177),sd(2))}, ...
    'Units','normalized','HorizontalAlignment','right', ...
    'VerticalAlignment','top','FontSize',font);
xlim(ax2,[datenum(2020,2,1) datenum(2020,8,15)]);
xticks(ax2,datenum(2020,[2 4 6 8],1));
xticklabels(ax2,{'Feb','Apr','Jun','Aug'});
xlabel(ax2,'Month'); ylim(ax2,[0 0.6]);

% (c) Keel macroporosity vs time, with linear regression
% Use the checked compilation. September is a DIFFERENT season.
% Regression uses February-August observations; September is excluded.
% It is a pooled association, not a tracked single-ridge evolution rate.
K=T;
ax3=nexttile(tile,3); hold(ax3,'on');
newSeason=month(K.time)>=9;
r=K.useC & ~newSeason;
x=K.plotDay(r); y=K.pk(r);
% Center numeric dates for stable regression; evaluate over observed range.
x0=min(x); xc=x-x0;
mdlC=fitlm(xc,y);
xf=linspace(min(x),max(x),100)';
yf=predict(mdlC,xf-x0);
% Fitted line +/- one sample standard deviation of residuals.
residualSD=std(mdlC.Residuals.Raw,0,'omitnan');
ci=[yf-residualSD yf+residualSD];
fill(ax3,[xf;flipud(xf)],[ci(:,1);flipud(ci(:,2))],'k', ...
    'FaceAlpha',0.07,'EdgeColor','none','HandleVisibility','off');
plot(ax3,xf,yf,'--k','LineWidth',1.2,'HandleVisibility','off');
for j=1:numel(sources)
    for k=1:2
        if k==1, season="pre-melt"; mk='o'; face=C(j,:);
        else, season="melt"; mk='^'; face='none'; end
        r=K.useC & K.author==sources(j) & K.season==season;
        plot(ax3,K.plotDay(r),K.pk(r),mk,'LineStyle','none', ...
            'Color',C(j,:),'MarkerFaceColor',face, ...
            'MarkerSize',ms,'LineWidth',0.6,'HandleVisibility','off');
    end
end
text(ax3,0.97,0.96,{sprintf('R^2 = %.2f',mdlC.Rsquared.Ordinary), ...
    pLabel(mdlC.Coefficients{2,4}), ...
    sprintf('Mean = %.2f %s %.2f',mean(y),char(177),std(y))}, ...
    'Units','normalized','HorizontalAlignment','right', ...
    'VerticalAlignment','top','FontSize',font);
xlim(ax3,[datenum(2020,2,1) datenum(2020,8,15)]);
xticks(ax3,datenum(2020,[2 4 6 8],1));
xticklabels(ax3,{'Feb','Apr','Jun','Aug'});
xlabel(ax3,'Month'); ylabel(ax3,'Keel macroporosity');
ylim(ax3,[-0.01 0.36]); yticks(ax3,0:0.1:0.3);

% Legend with shared colors
hs=gobjects(numel(sources),1);
for j=1:numel(sources)
    hs(j)=plot(ax3,NaN,NaN,'o','Color',C(j,:), ...
        'MarkerFaceColor',C(j,:),'MarkerSize',ms);
end
hPre=plot(ax3,NaN,NaN,'ok','MarkerFaceColor','k','MarkerSize',ms);
hMelt=plot(ax3,NaN,NaN,'^k','MarkerFaceColor','none','MarkerSize',ms);
shown=false(numel(sources),1);
for j=1:numel(sources)
    shown(j)=any(T.author==sources(j) & (T.useA | T.useB | T.useC));
end
leg=legend(ax3,[hs(shown);hPre;hMelt], ...
    [cellstr(sources(shown)); {'Pre-melt (<1 Jun)'; 'Melt (≥1 Jun)'}], ...
    'Location','eastoutside','Box','off','FontSize',font-1);
leg.ItemTokenSize=[4 6]; leg.AutoUpdate='off';
leg.Location='eastoutside';

% All panels: filled circles before 1 June; open triangles from 1 June.
% September observations are neither displayed nor fitted.
axs=[ax1 ax2 ax3]; labels={'(a)','(b)','(c)'};
for k=1:3
    set(axs(k),'FontSize',font,'Box','on','FontWeight','normal');
    xtickangle(axs(k),0);
    text(axs(k),-0.18,0.98,labels{k},'Units','normalized', ...
        'VerticalAlignment','bottom','FontSize',font,'Clipping','off');
end

% Export
outFile = fullfile(outFolder, 'Figure10_porosity_upd.png');
set(fig,'PaperUnits','inches','PaperPosition',[0 0 figWidth figHeight], ...
    'PaperSize',[figWidth figHeight],'PaperPositionMode','manual');
drawnow;
print(fig, outFile, '-dpng', '-r300');
fprintf('Figure saved: %s\n', outFile);

% Command Window report: n=plotted entries; N=distinct underlying features.
fprintf('\nFIGURE 10: COUNTS AFTER REMOVING OVERLAPPING CONTRIBUTIONS\n');
fprintf('N refers to features represented, not statistical independence.\n');
fprintf('Kharitonov 2005: N=1 by simplifying assumption; source reports 78 drilling records.\n');
fprintf('Guzenko 2026: 10 aggregate points represent 88 ridges and 15 stamukhas.\n\n');
fprintf('%-29s %4s %4s %4s  %s\n','Study','n(a)','n(b)','n(c)','Unique features represented across panels');
for j=1:numel(sources)
    r=T.author==sources(j);
    used=r & (T.useA | T.useB | T.useC);
    if ~any(used), continue; end
    fprintf('%-29s %4d %4d %4d  %s\n',char(sources(j)), ...
        nnz(r & T.useA),nnz(r & T.useB),nnz(r & T.useC),featureSummary(T,used));
end
fprintf('\nPANEL AND STATISTICAL-SUBSET COUNTS\n');
printSample(T,'Panel (a): all plotted',T.useA,'pr');
printSample(T,'Panel (a): fitted pre-melt',T.useA & T.season=="pre-melt",'pr');
printSample(T,'Panel (b): all plotted',T.useB,'pr');
printSample(T,'Panel (b): pre-melt (<1 Jun)',T.useB & T.season=="pre-melt",'pr');
printSample(T,'Panel (b): melt (>=1 Jun)',T.useB & T.season=="melt",'pr');
printSample(T,'Panel (c): plotted and fitted',T.useC,'pk');
printSample(T,'Panel (c): pre-melt (<1 Jun)',T.useC & T.season=="pre-melt",'pk');
printSample(T,'Panel (c): melt (>=1 Jun)',T.useC & T.season=="melt",'pk');
fprintf('\nALL PANELS COMBINED: %s\n',featureSummary(T,T.useA | T.useB | T.useC));
fprintf('Totals include the assumed single ridge for Kharitonov 2005.\n');
fprintf('Do not sum panel or study N: features can occur in several panels/studies.\n');
fprintf('Means/SD give each plotted entry equal weight; profiles and aggregates differ.\n');

%% Helpers
function T=addData(T,t,pk,hk,pr,hi,hc,meta)
    n=numel(pk);
    if isempty(hi), hi=nan(n,1); end
    if isempty(hc), hc=nan(n,1); end
    if isempty(hk), hk=nan(n,1); end
    if isempty(pr), pr=nan(n,1); end
    if isscalar(hi), hi=repmat(hi,n,1); end
    if isscalar(hc), hc=repmat(hc,n,1); end
    if isscalar(hk), hk=repmat(hk,n,1); end
    if isscalar(pr), pr=repmat(pr,n,1); end
    Ti=table(t(:),pk(:),hk(:),pr(:),hi(:),hc(:), ...
        repmat(meta.author,n,1),repmat(meta.name,n,1),repmat(meta.url,n,1), ...
        'VariableNames',{'time','pk','hk','pr','hi','hc','author','name','url'});
    T=[T;Ti];
end
function plotRubble(ax,T,xvar,eligible,sources,C,ms)
    groups=["pre-melt","melt","unclassified","new season"];
    markers={'o','^','d','s'};
    for j=1:numel(sources)
        for k=1:numel(groups)
            r=eligible & T.author==sources(j) & T.season==groups(k);
            face=C(j,:); if k==2 || k==3, face='none'; end
            plot(ax,T.(xvar)(r),T.pr(r),markers{k},'LineStyle','none', ...
                'Color',C(j,:),'MarkerFaceColor',face,'MarkerSize',ms, ...
                'LineWidth',0.5,'HandleVisibility','off');
        end
    end
end
function bandMean(ax,x1,x2,mu,sd,style)
    fill(ax,[x1 x2 x2 x1],[mu-sd mu-sd mu+sd mu+sd],'k', ...
        'FaceAlpha',0.07,'EdgeColor','none','HandleVisibility','off');
    plot(ax,[x1 x2],[mu mu],'Color','k','LineStyle',style, ...
        'LineWidth',1,'HandleVisibility','off');
end

function label=pLabel(p)
    if p<0.01
        label='p < 0.01';
    else
        label=sprintf('p = %.2f',p);
    end
end

function T=assignIDs(T,author,ids)
    rows=find(T.author==author);
    assert(numel(rows)==numel(ids),'Feature ID count mismatch for %s',author);
    for k=1:numel(rows), T.featureIDs{rows(k)}=string(ids(k)); end
end
function result=featureSummary(T,rows)
    ids=strings(0,1);
    idx=find(rows);
    for k=1:numel(idx), ids=[ids;T.featureIDs{idx(k)}(:)]; end
    ids=unique(ids);
    nStam=nnz(startsWith(ids,"S_G26_"));
    nRidge=numel(ids)-nStam;
    result=sprintf('%d known ridges',nRidge);
    if nStam>0, result=[result sprintf(' + %d stamukhas',nStam)]; end
    nUnknown=nnz(T.unknownN & rows);
    if nUnknown>0
        result=[result sprintf(' + unknown ridge N (%d aggregate)',nUnknown)];
    end
end
function printSample(T,label,rows,variable)
    v=T.(variable)(rows);
    fprintf('%-34s n=%3d; %-65s mean=%.4f; SD=%.4f\n', ...
        label,nnz(rows),featureSummary(T,rows),mean(v),std(v));
end
