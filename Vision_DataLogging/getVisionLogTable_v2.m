function VisionLog202002111818 = getVisionLogTable_v2(filename, dataLines)
%IMPORTFILE Import data from a text file
%  VISIONLOG202002111818 = IMPORTFILE(FILENAME) reads data from text
%  file FILENAME for the default selection.  Returns the data as a table.
%
%  VISIONLOG202002111818 = IMPORTFILE(FILE, DATALINES) reads data for
%  the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  VisionLog202002111818 = importfile("C:\Users\Martin\Documents\FRC_2020\GIT\Matlab_2020\Vision_DataLogging\Vision_Log2020-02-11_18_18.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 11-Feb-2020 18:46:55

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 9);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Time", "TargetLocked", "VisionDriveActive", "Distance", "DistanceError", "AngleError", "AngleError_DB", "Speed", "Omega"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
VisionLog202002111818 = readtable(filename, opts);

end