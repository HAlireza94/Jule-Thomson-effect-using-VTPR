clc
clear
close all

% Yi=[0.85 0.15];

yi=[0.71 8.64 70.85 ...
    8.53 4.95 1.26 0.75 ...
    0.4 0.41 0.46 ...
    0.61 0.71 0.39 1.33];Yi=yi*0.01; % GC1

% yi=[0.85 0.65 83.58 5.95 ...
%     2.91 1.11 0.45 0.48 0.36 0.60 ...
%     0.80 0.76 0.47 1.03];Yi=yi*0.01; % GC3

% yi=[0.46 3.36 62.23 ...
%     8.88 5.30 2.07 0.91 ...
%     0.85 0.73 1.04 ...
%     1.84 1.73 1.39 9.21];Yi=yi*0.01; %GC6

% yi=[0.40 0.10 45.40 4.20 ...
%     0.89 0.52 0.56 0.29 ...
%     0.65 1.01 2.88 4.11 ...
%     3.32 35.67];Yi=yi*0.01; %OIL2

Kij=[0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0];

    alpha_function=input('Enter name of alpha function :','s');


    Tc=[126.2 304.19 190.56 305.32 369.83 425.12 407.80 469.7 460.40 507.6 540.2 568.7 594.6 617.7];
    Pc=[34.6 73.82 45.99 48.72 42.48 37.96 36.40 33.7 33.80 30.25 27.4 24.9 22.9 21.1];
    w=[0.0377 0.228 0.012 0.1 0.152 0.2 0.184 0.252 0.228 0.301	0.35 0.4 0.444 0.492];
        Zc=[0.294 0.274 0.286 0.279 0.276 0.274 0.278 0.27 0.27 0.266 0.261 0.256 0.235 0.231];

% Tc=[190.56 305.32];
% Pc=[45.99 48.72];
% w=[0.012 0.1];
% Kij=[0 0;0 0];

N=numel(Yi);
    
    T=linspace(100,1250,1000)';

    OBJ=zeros(1000,1);
    for i=1:1000
        
   OBJ(i)=Calculation_T_Inv_SRK_EoS_for_Mixture(alpha_function,T(i),Tc,Pc,w,Kij,Yi,N,Zc);

        
    end
    
    
    
    
    plot(T,OBJ);xlabel('T');ylabel('alpha');
grid on
I=min(abs(OBJ));
disp('Objective Value, Inversion Temperature=');disp(I);


Andis=find(abs(OBJ)==I);
% [row,colm]=find(OBV==I)

T_Final=T(Andis);
disp('Temperature, T');disp(T_Final)

    
    
    