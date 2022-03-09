function [LdB] = BuildingPenetration(f)
% frequency in MHz
LdB = 37 - 7.9*log10(f);
end