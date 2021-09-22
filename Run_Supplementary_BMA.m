%% This script will reproduce the Supplementary DCM results in the Steward et al., paper.

% Please ensure that your SPM12 folder (r7771) is listed in your MATLAB set
% path. These results were obtained using Matlab R2019b. Values may
% slightly differ from the manuscript depending on your OS and version of
% Matlab.

% The first section displays the BMR results fir the estimated full models of the
% connections between the caudate, preSMA, dlPFC, vmPFC whose data are
% saved in the BMA.mat file. This generates the results displayed in
% Supplementary Figure 3.

%% Load GCM & M.mat file and run BMR
clear
load('Supplementary_BMA.mat')

spm_dcm_peb_review (BMA);