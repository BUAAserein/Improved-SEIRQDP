%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cred = [210,32,39]/255;
Cblue_d = [56,89,137]/255;
Cblue_g = [127,165,183]/255;

Cblue = [77,33,189]/255;
Corange = [247,144,61]/255;
Cgreen = [89,169,90]/255;
cl = [Cred; Cblue_d; Cblue_g; Cblue; Corange; Cgreen];

% Call of the function SEIQRDP.m with the fitted parameters
testalpha = [0.,0.01,0.02,-0.01,-0.02];
figure
subplot(1,3,1)

semilogy(time,Active,'ro','MarkerEdgeColor',cl(1,:));
hold on
semilogy(time2,Active2,'r+','MarkerEdgeColor',cl(2,:));

for i = 1:length(testalpha)
    [S,E,I,Q,R,D,P] = SEIQRDP(alpha1+testalpha(i),beta1,beta_21,gamma1,delta1,Lambda1,Kappa1,...
        Npop,E0,I0,Q0,R0,D0,t,lambdaFun,kappaFun);
    semilogy(time1,Q,'Color',cl(i,:));
    hold on
    
    % ylim([0,1.1*Npop])
    ylabel('Number of cases')
    xlabel('time (days)')
    
    set(gcf,'color','w')
    
    
    grid on
    axis tight
    set(gca,'yscale','lin')
    title('中国地区 \alpha 敏感性分析');
    %  toc
    pause(1)
end

leg = {'确诊 (reported)',...
    '确诊 (validated)','基准数据 (fitted)',...
    '\alpha+0.01 (fitted)','\alpha+0.02 (fitted)','\alpha-0.01 (fitted)',...
    '\alpha-0.02 (fitted)'};
legend(leg{:},'location','northeast');

% 治愈率 死亡率 确诊的时间折线图

% 敏感性分析（中国）alpha delta beta

% 3.1 3.10


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cred = [210,32,39]/255;
Cblue_d = [56,89,137]/255;
Cblue_g = [127,165,183]/255;

Cblue = [77,33,189]/255;
Corange = [247,144,61]/255;
Cgreen = [89,169,90]/255;
cl = [Cred; Cblue_d; Cblue_g; Cblue; Corange; Cgreen];

% Call of the function SEIQRDP.m with the fitted parameters
testdelta = [0.,0.05,0.1,-0.05,-0.1];
subplot(1,3,2)

semilogy(time,Active,'ro','MarkerEdgeColor',cl(1,:));
hold on
semilogy(time2,Active2,'r+','MarkerEdgeColor',cl(2,:));

for i = 1:length(testdelta)
    [S,E,I,Q,R,D,P] = SEIQRDP(alpha1,beta1,beta_21,gamma1,delta1+testdelta(i),Lambda1,Kappa1,...
        Npop,E0,I0,Q0,R0,D0,t,lambdaFun,kappaFun);
    semilogy(time1,Q,'Color',cl(i,:));
    hold on
    
    % ylim([0,1.1*Npop])
    ylabel('Number of cases')
    xlabel('time (days)')
    
    set(gcf,'color','w')
    
    
    grid on
    axis tight
    set(gca,'yscale','lin')
    title('中国地区 \delta 敏感性分析');
    %  toc
    pause(1)
end

leg = {'确诊 (reported)',...
    '确诊 (validated)','基准数据 (fitted)',...
    '\delta+0.05 (fitted)','\delta+0.1 (fitted)','\delta-0.05 (fitted)',...
    '\delta-0.1 (fitted)'};
legend(leg{:},'location','northeast');

% 治愈率 死亡率 确诊的时间折线图

% 敏感性分析（中国）alpha delta beta

% 3.1 3.10


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cred = [210,32,39]/255;
Cblue_d = [56,89,137]/255;
Cblue_g = [127,165,183]/255;

Cblue = [77,33,189]/255;
Corange = [247,144,61]/255;
Cgreen = [89,169,90]/255;
cl = [Cred; Cblue_d; Cblue_g; Cblue; Corange; Cgreen];

% Call of the function SEIQRDP.m with the fitted parameters
testdelta = [0.,0.05,0.1,-0.05,-0.1];
subplot(1,3,3)

semilogy(time,Active,'ro','MarkerEdgeColor',cl(1,:));
hold on
semilogy(time2,Active2,'r+','MarkerEdgeColor',cl(2,:));

for i = 1:length(testdelta)
    [S,E,I,Q,R,D,P] = SEIQRDP(alpha1,beta1,beta_21,gamma1+testdelta(i),delta1,Lambda1,Kappa1,...
        Npop,E0,I0,Q0,R0,D0,t,lambdaFun,kappaFun);
    semilogy(time1,Q,'Color',cl(i,:));
    hold on
    
    % ylim([0,1.1*Npop])
    ylabel('Number of cases')
    xlabel('time (days)')
    
    set(gcf,'color','w')
    
    
    grid on
    axis tight
    set(gca,'yscale','lin')
    title('中国地区 \gamma 敏感性分析');
    %  toc
    pause(1)
end

leg = {'确诊 (reported)',...
    '确诊 (validated)','基准数据 (fitted)',...
    '\gamma+0.05 (fitted)','\gamma+0.1 (fitted)','\gamma-0.05 (fitted)',...
    '\gamma-0.1 (fitted)'};
legend(leg{:},'location','northeast');


