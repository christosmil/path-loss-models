function [LdB] = COST231WalfischIkegamiModel(fc, hBS, hMS, d, LOS, hroof, citySize)
% user input:
%   -frequency in MHz [800, 2000]
%   -distance in km [0.02, 5]
%   -hBS in m [4, 50]
%   -hMS in m [1, 3]
%   -LOS is equal to 0 if NLOS; other values indicate LOS link
%       hroof in m
%       citySize can be small cities (=0), or metropolitan centers (=any other value)
%       Important Note: if LOS link then "hroof" and "citySize" can have any
%                       value; it does not affect the result
if (fc < 800) || (fc > 2000)
    disp("Error frequency must be in the range [800MHz, 2000MHz]");
    LdB = 0;
    return;
end
if (d < 0.02) || (d > 5)
    disp("Error Tx-Rx distance must be in the range [0.02km, 5km]");
    LdB = 0;
    return;
end
if (hBS < 4) || (hBS > 50)
    disp("Error Base Station antenna height must be in the range [4m, 50m]");
    LdB = 0;
    return;
end
if (hMS < 1) || (hMS > 3)
    disp("Error Mobile Station antenna height must be in the range [1m, 3m]");
    LdB = 0;
    return;
end
if (LOS ~= 0)
    LdB = 42.6 + 26*log10(d) + 20*log10(fc);
    return;
else
    b = 80; % b is the distance between buildings in m - we expect that it's
            % the same for every pair of buildings

    phi = 45;   % phi is the angle that is created from the diffraction of
                % the signal to the last rooftop before it reaches Rx (in deg)
    
    w = b/2;    % w is the distance between the last building before the Rx
                % and the first building after the Rx. This distance is
                % expected to be half the typical in between distance of
                % the building that intervene in Tx - Rx link and is
                % important because the last building will give a reflected
                % subsignal that will reach the Rx.
    Lfreespace = 32.45 + 20*log10(fc) + 20*log10(d);
    if (hBS > hroof)
        Lbsh = -18*log10(1 + (hBS - hroof));
        ka = 54;
        kd = 18;
    else
        Lbsh = 0;
        if (d >= 0.5)
            ka = 54 - 0.8*(hBS - hroof);
        else
            ka = 54 - 0.8*(hBS - hroof)*d/0.5;
        end
        kd = 18 - 15*(hBS - hroof)/hroof;
    end
    if (citySize == 0)
        kf = -4 + 0.7*(fc/925 - 1); 
    else
        kf = -4 + 1.5*(fc/925 - 1);
    end
    Lmsd = Lbsh + ka + kd*log10(d) + kf*log10(fc) - 9*log10(b);
    if (phi < 35)
        Lori = -10 + 0.354*phi;
    elseif (phi < 55)
        Lori = 2.5 + 0.075*(phi - 35);
    else
        Lori = 4 + 0.114*(phi - 55);
    end
    Lrts = -8.2 - 10*log10(w) + 10*log10(fc) + 20*log10(hroof - hMS) + Lori;
    if (Lmsd + Lrts > 0)
        LdB = Lfreespace + Lmsd + Lrts;
    else
        LdB = Lfreespace;
    end
    return;
end
end