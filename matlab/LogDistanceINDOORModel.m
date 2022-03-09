function [PLdB] = LogDistanceINDOORModel(d, environmentChoice)
% distance in meters
% environment choice:
% 1. hallways (waveguide)
% 2. big, open rooms (LOS)
% 3. full of furniture rooms (NLOS)
% 4. multiple floors (attenuation)
if (environmentChoice == 1)
    n = 1.5;
    PLd0 = 42.12;
elseif (environmentChoice == 2)
    n = 2;
    PLd0 = 37.5;
elseif (environmentChoice == 3)
    n = 4;
    PLd0 = 33.3;
elseif (environmentChoice == 4)
    n = 5.3;
    PLd0 = 37.23;
else
    disp("Invalid input!");
    PLdB = 0;
    return;
end
PLdB = PLd0 + 10*n*log10(d);
end