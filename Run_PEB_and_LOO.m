%% This script will reproduce the DCM results in the Steward et al., paper.

% Please ensure that your SPM12 folder (r7771) is listed in your MATLAB set
% path. These results were obtained using Matlab R2019b. Values may
% slightly differ from the manuscript depending on your OS and version of
% Matlab.

% The first section runs BMR on the estimated full models whose data are
% saved in the GCM.mat file and generates the results displayed in Figure
% 3.

% The second section runs a PEB model containing a parameter to quantify
% the effects of PTQ scores (saved in M_PSQ.mat) on each of the DCM
% modulatory {'B'} pathways. MPFC-to-MD modulatory effects are tested
% using leave-one-out cross validation to generate the results depicted in
% Figure 4.

%% Load GCM & M.mat file and run BMR
clear
load('GCM.mat')
load('M_BMR.mat')

[PEB,P]=spm_dcm_peb(GCM, M, {'A','B'});
[BMA,BMR] = spm_dcm_peb_bmc(PEB);

spm_dcm_peb_review (BMA,GCM);

%% Run PSQ PEB and leave-one-out validation
load('M_PSQ.mat'); % This contains participant PSQ values 
M = struct ();
M.Q = 'all';
M.X = X;
M.Xnames = labels;

[PEB_PSQ , RCM_PSQ] = spm_dcm_peb (GCM ,M ,{'B'});

[BMA_PSQ, BMR_PSQ]= spm_dcm_peb_bmc(PEB_PSQ);

spm_dcm_peb_review (BMA_PSQ ,GCM);

[qE ,qC ,Q] = spm_dcm_loo (GCM ,M, {'B(1,4,2)'} );
