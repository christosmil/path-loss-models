function [PLdB] = WINNERIIModel(d, f, propagationScenario)
% for input arguments:
%   -d in m with range depending on propagation scenario
%   -f in GHz with range [2GHz, 6GHz]
%   - propagationScenario may vary a lot; here we test 5 scenarios:
%       -3D - Urban Microcells LOS (10m < d < 5km)  (=0)
%		-3D - Urban Macrocells LOS (10m < d < 5km)  (=1)
%		-3D - Rural Macrocells LOS (10m < d < 10km) (=2)
%		-3D - Indoor Hotspot LOS (3m < d < 150m)    (=3)
%		-3D - Indoor Hotspot NLOS (10m < d < 150m)  (any other value)
if (propagationScenario == 0) || (propagationScenario == 1)
    if ((d < 10) || (d > 5000)) && ((f < 2) || (f > 6))
        disp("Distance should be in [10m, 5000m]\nFrequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    elseif (d < 10) || (d > 5000)
        disp("Distance should be in [10m, 5000m]");
        PLdB = 0;
        return;
    elseif (f < 2 || f > 6)
        disp("Frequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    else
        PLdB = 22*log10(d) + 28 + 20*log10(f);
        return;
    end
elseif (propagationScenario == 2)
    if ((d < 10 || d > 10000)) && ((f < 2 || f > 6))
        disp("Distance should be in [10m, 10000m]\nFrequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    elseif (d < 10) || (d > 10000 )
        disp("Distance should be in [10m, 10000m]");
        PLdB = 0;
        return;
    elseif (f < 2) || (f > 6)
        disp("Frequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    else
        PLdB = 20*log10(40*pi*d*f/3) + 10*log10(d) - 14.77 + 0.002*log10(5)*d;
        return;
    end
elseif (propagationScenario == 3)
    if ((d < 3 || d > 150)) && ((f < 2 || f > 6))
        disp("Distance should be in [3m, 150m]\nFrequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    elseif (d < 3) || (d > 150)
        disp("Distance should be in [3m, 150m]");
        PLdB = 0;
        return;
    elseif (f < 2 || f > 6)
        disp("Frequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    else
        PLdB = 16.9*log10(d) + 32.8 + 20*log10(f);
        return;
    end
else
    if ((d < 10 || d > 150)) && ((f < 2 || f > 6))
        disp("Distance should be in [10m, 150m]\nFrequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    elseif (d < 10) || (d > 150 )
        disp("Distance should be in [10m, 150m]");
        PLdB = 0;
        return;
    elseif (f < 2) || (f > 6)
        disp("Frequency should be in [2GHz, 6GHz]");
        PLdB = 0;
        return;
    else
        PLdB = 43.3*log10(d) + 11.5 + 20*log10(f);
        return;
    end
end
end