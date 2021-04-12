clear;clc;

slCharacterEncoding('UTF-8');
T = readtable('.\²åÖµ615.csv');
T1 = cell2mat(table2cell(T(1:68,7:9)));
Confirmed = T1(:,1)';
Recovered = T1(:,2)';
Deaths = T1(:,3)';
Active =  Confirmed-Recovered-Deaths;


T2 = cell2mat(table2cell(T(69:144,7:9)));
Confirmed2 = T2(:,1)';
Recovered2 = T2(:,2)';
Deaths2 = T2(:,3)';
Active2 =  Confirmed2-Recovered2-Deaths2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dt = 1; % time step
time = datetime(2020,01,24):dt:datetime(2020,03,31);
time2 = datetime(2020,04,01):dt:datetime(2020,06,15);

Npop= 11200000;

% Definition of the first estimates for the parameters
alpha_guess = 0.06; % protection rate
beta_guess = 0.8; % Infection rate
beta_2_guess = 0.8; % Infection rate
LT_guess = 5; % latent time in days
Q_guess = 0.5; % rate at which infectious people enter in quarantine
lambda_guess = [0.01,0.01,10]; % recovery rate
kappa_guess = [0.005,0.005,10]; % death rate

guess = [alpha_guess,beta_guess,beta_2_guess,1/LT_guess, Q_guess,lambda_guess,kappa_guess];

% Initial conditions
Q0 = Confirmed(1)-Recovered(1)-Deaths(1);
I0 = 0.2*Q0; % Initial number of infectious cases. Unknown but unlikely to be zero.
E0 = Q0; % Initial number of exposed cases. Unknown but unlikely to be zero.
R0 = Recovered(1);
D0 = Deaths(1);

[alpha1,beta1,beta_21, gamma1,delta1,Lambda1,Kappa1,lambdaFun,kappaFun] = ...
    fit_SEIQRDP(Active,Recovered,Deaths,Npop,E0,I0,time,guess,'Display','off');


dt = 1/24; % time step
time1 = datetime(time(1), 'Locale', 'en_US'):dt:datetime(datetime(2020,06,01), 'Locale', 'en_US');
N = numel(time1);
t = [0:N-1].*dt;


% Call of the function SEIQRDP.m with the fitted parameters
[S,E,I,Q,R,D,P] = SEIQRDP(alpha1,beta1,beta_21,gamma1,delta1,Lambda1,Kappa1,...
    Npop,E0,I0,Q0,R0,D0,t,lambdaFun,kappaFun);


figure

semilogy(time1,Q,'r',time1,R,'b',time1,D,'k');
hold on
semilogy(time,Active,'ro',time,Recovered,'bo',time,Deaths,'ko');
hold on
semilogy(time2,Active2,'co',time2,Recovered2,'go',time2,Deaths2,'yo');
% ylim([0,1.1*Npop])
ylabel('Number of cases')
xlabel('time (days)')
leg = {'Confirmed (fitted)',...
    'Recovered (fitted)','Deceased (fitted)',...
    'Confirmed (reported)','Recovered (reported)','Deceased (reported)',...
    'Confirmed2 (reported)','Recovered2 (reported)','Deceased2 (reported)'};
legend(leg{:},'location','southoutside');
set(gcf,'color','w')


grid on
axis tight
set(gca,'yscale','lin')
toc

pause(1)