function [PL,PLdB] = cost231_Hata(d,fc,hBS,hMS,flag)

%Frequency in MHz, distance/heights in meters,
%flag=1 medium size cities,
%flag=2 metropolitan centers

if (fc>=1500 && fc<=2000) && (hBS>=30 && hBS<=200) && (hMS>=1 && hMS<=10) && (d>=1000 && d<=20000) && (flag==1 || flag==2)
    
    %calculate equation parts (A, B, C)
    ahMS=(1.1*log10(fc)-0.7)*hMS-(1.56*log10(fc)-0.8);
    
    A=46.3+33.9*log10(fc)-13.82*log10(hBS)-ahMS;
    
    B=44.9-6.55*log10(hBS);
    
    if flag==1
        %medium size cities => C=0dB
        C=0;
    else
        %metropolitan centers => C=3dB
        C=3;
    end
    
    %final equation
    PLdB=A+B*log10(d/1000)+C;
    PL=10^(PLdB/10);

%error message for invalid input
else
    disp('Invalid Input!');
    PL=-1; PLdB=-1;
end
end