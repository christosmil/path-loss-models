function cost231_HataPlot()

%Frequency in MHz, distance/heights in meters,
%flag=1 medium size cities,
%flag=2 metropolitan centers

%%%%%%%%%%%%%%%%%%
%%default values%%
%%%%%%%%%%%%%%%%%%
d=1000; %d:[1000,20000]
fc=1800; %fc:[1500,2000]
hBS=120; %hBS:[30,200]
hMS=5; %hMS:[1,10]
flag=2; %{1,2}

if (fc>=1500 && fc<=2000) && (hBS>=30 && hBS<=200) && (hMS>=1 && hMS<=10) && (d>=1000 && d<=20000) && (flag==1 || flag==2)
    
    d=1000; %d:[1000,20000]
    fc=1800; %fc:[1500,2000]
    hBS=120; %hBS:[30,200]
    hMS=5; %hMS:[1,10]
    flag=2; %{1,2} - we dont use it, always check for both occasions 
    
    choice=input('Choose variable: (distance [1] / hMS [2] / hBS [3] / fc [4]) / general study [5]) ');
    
    if (choice==1)
        %distance is the variable
        X=1000:100:20000; %distance in meters
        Ymedium=zeros(1,length(X));
        Ymetropolitan=zeros(1,length(X));
        for i=1:length(X)
            [x, Ymedium(1,i)]=cost231_Hata(X(i),fc,hBS,hMS,1);
            [x, Ymetropolitan(1,i)]=cost231_Hata(X(i),fc,hBS,hMS,2);
        end
        semilogx(X,Ymedium, X,Ymetropolitan);
        xlim([1000 20000]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities','Metropolitan Centers')
        title('Path Loss(dB) - Distance(m)');
        xlabel('Distance(m)');
        ylabel('Path Loss(dB)');
        %------------------------------------------------------------------
        %logarithmic diagram for Path Loss - we don't need it because
        %the range of Path Loss values are around 10^2 (~120-160dB) so we
        %won't notice any difference
        %------------------------------------------------------------------
        %figure;
        %semilogy(X,Ymedium, X,Ymetropolitan);
        %xlim([1000 20000]);
        %ylim([0 200]);
        %grid on;
        %legend('Medium Size Cities','Metropolitan Centers')
        %title('Losses - distance(m)');
        %xlabel('distance(m)');
        %ylabel('Losses');
        figure;
        plot(X,Ymedium, X,Ymetropolitan);
        xlim([1000 20000]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities','Metropolitan Centers')
        title('Path Loss(dB) - Distance(m)');
        xlabel('Distance(m)');
        ylabel('Path Loss(dB)');
        
    elseif (choice==2) 
        %Mobile Station Height is the variable
        X=1:1:10; %Mobile Station Height in meters
        
        %linear behavior expected as there is no exponential or logarithmic
        %factor of Mobile Station Height
        %------------------------------------------------------------------
        %we will test for various frequencies because in Cost231-Hata model
        %the hMS factor is multiplied by (1.1*log10(fc)-0.7)
        %->eventually we will notice that nothing changes regardless of fc
        
        %frequency={1500MHz, 1800MHz, 2000MHz};
        Ymedium1=zeros(1,length(X));
        Ymetropolitan1=zeros(1,length(X));
        Ymedium2=zeros(1,length(X));
        Ymetropolitan2=zeros(1,length(X));
        Ymedium3=zeros(1,length(X));
        Ymetropolitan3=zeros(1,length(X));
        for i=1:length(X)
            [x, Ymedium1(1,i)]=cost231_Hata(d,1500,hBS,X(i),1);
            [x, Ymetropolitan1(1,i)]=cost231_Hata(d,1500,hBS,X(i),2);
            [x, Ymedium2(1,i)]=cost231_Hata(d,1800,hBS,X(i),1);
            [x, Ymetropolitan2(1,i)]=cost231_Hata(d,1800,hBS,X(i),2);
            [x, Ymedium3(1,i)]=cost231_Hata(d,2000,hBS,X(i),1);
            [x, Ymetropolitan3(1,i)]=cost231_Hata(d,2000,hBS,X(i),2);
        end
        
        %------------------------------------------------------------------
        %important note: Mobile Station Height is used without logarithm in
        %Cost231-Hata equation, thus we do not need semilog graph for hMS
        %------------------------------------------------------------------
        
        plot(X,Ymedium1, X,Ymetropolitan1, X,Ymedium2, X,Ymetropolitan2, X,Ymedium3, X,Ymetropolitan3);
        xlim([1 10]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities, fc=1500','Metropolitan Centers, fc=1800', 'Medium Size Cities, fc=1800','Metropolitan Centers, fc=1500', 'Medium Size Cities, fc=2000','Metropolitan Centers, fc=2000')
        title('Path Loss(dB) - Mobile Station Height(m)');
        xlabel('Mobile Station Height(m)');
        ylabel('Path Loss(dB)');
        
        %Path Loss(dB)-Mobile Station Height(m) graph for fc=1800MHz
        figure;
        plot(X,Ymedium2, X,Ymetropolitan2);
        xlim([1 10]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities','Metropolitan Centers')
        title('Path Loss(dB) - Mobile Station Height(m)');
        xlabel('Mobile Station Height(m)');
        ylabel('Path Loss(dB)');
        
    elseif (choice==3) 
        %Base Station Height is the variable
        X=30:1:200; %Base Station Height in meters
        
        %we test for various Tx-Rx distances to demonstrate the similarity
        %of the occasions - only the value of Path Loss(dB) changes, the
        %behavior is always the same
        
        %distance={1000m, 2500m, 5000m, 10000m, 20000m}
        Ymedium1=zeros(1,length(X));
        Ymetropolitan1=zeros(1,length(X));
        Ymedium2=zeros(1,length(X));
        Ymetropolitan2=zeros(1,length(X));
        Ymedium3=zeros(1,length(X));
        Ymetropolitan3=zeros(1,length(X));
        Ymedium4=zeros(1,length(X));
        Ymetropolitan4=zeros(1,length(X));
        Ymedium5=zeros(1,length(X));
        Ymetropolitan5=zeros(1,length(X));
        for i=1:length(X)
            [x, Ymedium1(1,i)]=cost231_Hata(1000,fc,X(i),hMS,1);
            [x, Ymetropolitan1(1,i)]=cost231_Hata(1000,fc,X(i),hMS,2);
            [x, Ymedium2(1,i)]=cost231_Hata(2500,fc,X(i),hMS,1);
            [x, Ymetropolitan2(1,i)]=cost231_Hata(2500,fc,X(i),hMS,2);
            [x, Ymedium3(1,i)]=cost231_Hata(5000,fc,X(i),hMS,1);
            [x, Ymetropolitan3(1,i)]=cost231_Hata(5000,fc,X(i),hMS,2);
            [x, Ymedium4(1,i)]=cost231_Hata(10000,fc,X(i),hMS,1);
            [x, Ymetropolitan4(1,i)]=cost231_Hata(10000,fc,X(i),hMS,2);
            [x, Ymedium5(1,i)]=cost231_Hata(20000,fc,X(i),hMS,1);
            [x, Ymetropolitan5(1,i)]=cost231_Hata(20000,fc,X(i),hMS,2);
        end
        
        plot(X,Ymedium1, X,Ymetropolitan1, X,Ymedium2, X,Ymetropolitan2, X,Ymedium3, X,Ymetropolitan3, X,Ymedium4, X,Ymetropolitan4, X,Ymedium5, X,Ymetropolitan5);
        xlim([30 200]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities (distance=1000m)','Metropolitan Centers(distance=1000m)','Medium Size Cities (distance=2000m)','Metropolitan Centers(distance=2000m)','Medium Size Cities (distance=5000m)','Metropolitan Centers(distance=5000m)','Medium Size Cities (distance=10000m)','Metropolitan Centers(distance=10000m)','Medium Size Cities (distance=20000m)','Metropolitan Centers(distance=20000m)')
        title('Path Loss(dB) - Base Station Height(m)');
        xlabel('Base Station Height(m)');
        ylabel('Path Loss(dB)');
        set(legend,'Location','best');
        
        %only metropolitan centers for distance={1000m,5000m,20000m}
        figure;
        plot(X,Ymetropolitan1, X,Ymetropolitan3, X,Ymetropolitan5);
        xlim([30 200]);
        ylim([0 200]);
        grid on;
        legend('Metropolitan Centers(distance=1000m)','Metropolitan Centers(distance=5000m)','Metropolitan Centers(distance=20000m)')
        title('Path Loss(dB) - Base Station Height(m)');
        xlabel('Base Station Height(m)');
        ylabel('Path Loss(dB)');
        
        %only metropolitan centers for distance={1000m,5000m,20000m}
        %---semilog graph for Base Station Height---
        figure;
        semilogx(X,Ymetropolitan1, X,Ymetropolitan3, X,Ymetropolitan5);
        xlim([30 200]);
        ylim([0 200]);
        grid on;
        legend('Metropolitan Centers(distance=1000m)','Metropolitan Centers(distance=5000m)','Metropolitan Centers(distance=20000m)')
        title('Path Loss(dB) - Base Station Height(m)');
        xlabel('Base Station Height(m)');
        ylabel('Path Loss(dB)');
        
    elseif (choice==4)
        %fc is the variable
        X=1500:100:2000;
        Ymedium=zeros(1,length(X));
        Ymetropolitan=zeros(1,length(X));
        for i=1:length(X)
            [x, Ymedium(1,i)]=cost231_Hata(d,X(i),hBS,hMS,1);
            [x, Ymetropolitan(1,i)]=cost231_Hata(d,X(i),hBS,hMS,2);
        end
        plot(X,Ymedium, X,Ymetropolitan);
        xlim([1500 2000]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities','Metropolitan Centers')
        title('Path Loss(dB) - fc(MHz)');
        xlabel('fc(MHz)');
        ylabel('Path Loss(dB)');
        %---semilog graph for frequency---
        %no difference - frequency range only 500MHz
        figure;
        semilogx(X,Ymedium, X,Ymetropolitan);
        xlim([1500 2000]);
        ylim([0 200]);
        grid on;
        legend('Medium Size Cities','Metropolitan Centers')
        title('Path Loss(dB) - fc(dB(MHz))');
        xlabel('fc(dB(MHz))');
        ylabel('Path Loss(dB)');
        
    elseif (choice==5)
        %general study - main factors: distance, hMS, hBS
        %fc fixed - 1800MHz
        fc=1800;
        
        %Mobile Station Height=2m
        hMS=2;
        X=1000:100:20000;
        Y11=zeros(1,length(X));
        Y12=zeros(1,length(X));
        Y13=zeros(1,length(X));
        Y14=zeros(1,length(X));
        for i=1:length(X)
            [x, Y11(1,i)]=cost231_Hata(X(i),fc,30,hMS,1);
            [x, Y12(1,i)]=cost231_Hata(X(i),fc,80,hMS,1);
            [x, Y13(1,i)]=cost231_Hata(X(i),fc,150,hMS,1);
            [x, Y14(1,i)]=cost231_Hata(X(i),fc,200,hMS,1);
        end
        
        %Mobile Station Height=5m
        hMS=5;
        X=1000:100:20000;
        Y21=zeros(1,length(X));
        Y22=zeros(1,length(X));
        Y23=zeros(1,length(X));
        Y24=zeros(1,length(X));
        for i=1:length(X)
            [x, Y21(1,i)]=cost231_Hata(X(i),fc,30,hMS,1);
            [x, Y22(1,i)]=cost231_Hata(X(i),fc,80,hMS,1);
            [x, Y23(1,i)]=cost231_Hata(X(i),fc,150,hMS,1);
            [x, Y24(1,i)]=cost231_Hata(X(i),fc,200,hMS,1);
        end
        
        %Mobile Station Height=10m
        hMS=10;
        X=1000:100:20000;
        Y31=zeros(1,length(X));
        Y32=zeros(1,length(X));
        Y33=zeros(1,length(X));
        Y34=zeros(1,length(X));
        for i=1:length(X)
            [x, Y31(1,i)]=cost231_Hata(X(i),fc,30,hMS,1);
            [x, Y32(1,i)]=cost231_Hata(X(i),fc,80,hMS,1);
            [x, Y33(1,i)]=cost231_Hata(X(i),fc,150,hMS,1);
            [x, Y34(1,i)]=cost231_Hata(X(i),fc,200,hMS,1);
        end
        
        plot(X,Y11, X,Y23, X,Y34);
        xlim([1000 20000]);
        ylim([0 200]);
        grid on;
        legend('MS height=2m, BS height=30m','MS height=5m, BS height=150m','MS height=10m, BS height=200m');
        title('Path Loss(dB) - Distance(m)');
        xlabel('Distance(m)');
        ylabel('Path Loss(dB)');
        set(legend,'Location','best');
        
        %semilog graph for distance
        figure;
        semilogx(X,Y11, X,Y23, X,Y34);
        xlim([1000 20000]);
        ylim([0 200]);
        grid on;
        legend('MS height=2m, BS height=30m','MS height=5m, BS height=150m','MS height=10m, BS height=200m');
        title('Path Loss(dB) - Distance(m)');
        xlabel('Distance(m)');
        ylabel('Path Loss(dB)');
        set(legend,'Location','best');
        
    else
        disp('Invalid Choice!');
    end
else
    disp('Wrong input values!');
end
end