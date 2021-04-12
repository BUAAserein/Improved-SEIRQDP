clear;clc;
T = readtable('.\插值615(2).csv');

Cred = [210,32,39]/255;
Cblue_d = [56,89,137]/255;
Cblue_g = [127,165,183]/255;

Cblue = [77,33,189]/255;
Corange = [247,144,61]/255;
Cgreen = [89,169,90]/255;

for jjj = 2:4
    hubei = 3;
    tims = 144;
    % slCharacterEncoding('UTF-8');
    Dis = ["湖北" "武汉" "湖北*" "中国" "中国*" "北京" "上海"];
    Ntotal = [59270000 11200000 48070000 1400050000 1340800000 21536000 22500000];
    Dis(jjj)
    area = 3+4*(jjj-1);
    T1 = cell2mat(table2cell(T(1:tims,area:area+2)));
    T2 = cell2mat(table2cell(T(tims+1:144,area:area+2)));
    Npop= Ntotal(jjj);
    Confirmed = T1(:,1)';
    Recovered = T1(:,2)';
    Deaths = T1(:,3)';
    Active =  Confirmed-Recovered-Deaths;
    Cure = diff(Recovered);
    Cure(84) = [];
    Cure(21) = [];
    
    Death = diff(Deaths);
    Death(84) = [];
    Death(21) = [];
    
    Active = Active(1:143);
    Active(84) = [];
    Active(21) = [];
    
    Confirmed = Confirmed(1:141);
    
    Curerate = Cure./Active.*100;
    Deathrate = Death./Confirmed.*100;
    
    dt = 1; % time step
    time = datetime(2020,01,25):dt:datetime(2020,06,13);
    
    
    if jjj == 2
        figure
        subplot(3, 1, 1);
        plot(time,Curerate,'-*', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cblue)
        ylabel('治愈率(%)');
        ylim([0,60]);
        hold on
        
        subplot(3, 1, 2);
        plot(time,Deathrate,'-*', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cblue);
        ylabel('死亡率(%)');
        hold on
        
        subplot(3, 1, 3);
        plot(time,Confirmed,'-*', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cblue);
        ylabel('确诊人数');
        hold on
        
        pause(1);
    end
    
    if jjj == 3
        subplot(3, 1, 1);
        plot(time,Curerate,'-d', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cred);
        hold on
        
        subplot(3, 1, 2);
        plot(time,Deathrate,'-d', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cred);
        hold on
        
        subplot(3, 1, 3);
        plot(time,Confirmed,'-d', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cred);
        hold on
        
        pause(1);
    end
    
    if jjj == 4
        subplot(3, 1, 1);
        plot(time,Curerate,'-^', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cblue_d);
        legend('武汉', '湖北*', '中国');
        hold on
        
        subplot(3, 1, 2);
        plot(time,Deathrate,'-^', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cblue_d);
        legend('武汉', '湖北*', '中国');
        hold on
        
        subplot(3, 1, 3);
        plot(time,Confirmed,'-^', 'MarkerSize', 2, 'color',[0.5 0.5 0.5], 'MarkerEdgeColor',Cblue_d);
        legend('武汉', '湖北*', '中国');
        hold on
        
        pause(1);
    end
    
end
