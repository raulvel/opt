clc
clear all;
close all;

format long g;


P=362

p=132

niu=2309

i2=827

Pch4=8.5

qcnom=niu*P/Pch4

temp_abnom=530

P_abv_t_nom=1.1*p
P_abv_nom=p;

temp_absinom=480

O2nom=5

alpha=1.1;
a=1.09;
b=0.25;

i1=30;

q_aer_nom=qcnom*alpha*(a*Pch4+b)

q_ga_nom=qcnom+q_aer_nom

q_abv_nom=niu*P/(i2-i1)

q_apa_nom=q_abv_nom

Snom=10^(-8)

q_ij_nom=10^(-2)*q_abv_nom

q_pj_nom=10^(-3)*q_abv_nom

cos=0.825

S_G_nom=P/cos

Q_G_nom_2=S_G_nom^2 - P^2

Q_G_nom=sqrt(Q_G_nom_2)


X=Tabel(P);

U_Gnom=X(1)
U_E_nom=X(2)
U_PC_nom=X(3)
T_EE=X(4)
T_E=X(5)
T_G=X(6)

%La P=397
% U_Gnom=25
% 
% U_E_nom=500
% 
% U_PC_nom=360
% 
% T_EE=0.1
% 
% T_E=0.75
% 
% T_G=5

P_E_nom=0.0025*P

P_PC_nom=0.01*P_E_nom

i_E_nom=P_E_nom/U_E_nom*1000





%%

i_P_cnom=P_PC_nom/U_PC_nom*10^6

k11=P_abv_nom/qcnom

Tm11=600

T11=6000

H1=tf([k11],[T11 1],'ioDelay',600)

 k12=5/qcnom

Tm12=10

T12=60

 H12=tf([k12],[T12 1],'ioDelay',Tm12)

Tm15=540

T15=5400

k15=1.1*P_abv_nom/qcnom

H15=tf([k15],[T15 1],'ioDelay',Tm15)

Tm16=12*60
T16=120*60

k16=q_abv_nom/qcnom

H16=tf([k16],[T16 1],'ioDelay',Tm16)

Tm17=10*60
T17=100*60

k17=temp_absinom/qcnom

H17=tf([k17],[T17 1],'ioDelay',Tm17)

Tm18=12*60
T18=120*60

k18=temp_abnom/qcnom

H18=tf([k18],[T18 1],'ioDelay',Tm18)

Tm21=10*60
T21=100*60

k21=P_abv_nom/q_aer_nom

H21=tf([k21],[T21 1],'ioDelay',Tm21)

Tm22=10
T22=60

k22=O2nom/q_aer_nom

H22=tf([k22],[T22 1],'ioDelay',Tm22)

Tm23=10
T23=5

k23=-2/q_aer_nom

H23=tf([-k23],[T23 1],'ioDelay',Tm23)

Tm25=9*60
T25=90*60

k25=P_abv_t_nom/q_aer_nom

H25=tf([-k25],[T25 1],'ioDelay',Tm25)

Tm26=12*60
T26=120*60

k26=q_abv_nom/q_aer_nom

H26=tf([k26],[T26 1],'ioDelay',Tm26)

Tm27=10*60
T27=100*60

k27=temp_absinom/q_aer_nom

H27=tf([k27],[T27 1],'ioDelay',Tm27)

Tm28=12*60
T28=120*60

k28=temp_abnom/q_aer_nom

H28=tf([k28],[T28 1],'ioDelay',Tm28)

Tm33=5
T33=10

k33=-2/q_ga_nom

H33=tf([k33],[T33 1],'ioDelay',Tm33)

Tm44=20
T44=20

hnom=0.1

k44=hnom/q_apa_nom

H44=tf([k44],[T44 1],'ioDelay',Tm44) %NU E BINE in modelul rezolvat

Tm46=12*60
T46=120*60

k46=1

H46=tf([k46],[T46 1],'ioDelay',Tm46)

Tm49=60*60
T49=600*60

k49=1/q_apa_nom

H49=tf([k49],[T49 1],'ioDelay',Tm49)

Tm57=10
T57=10

k57=-100/q_ij_nom

H57=tf([k57],[T57 1],'ioDelay',Tm57)

Tm69=60
T69=60

k69=-1/q_pj_nom

H69=tf([k69],[T69 1],'ioDelay',Tm69)

k_cip=0.1

H_cip12=tf([k_cip],[1])

k_E12=qcnom/(1-0.2)

T_E12=1

H_E12=tf([k_E12],[T_E12 1])

K_M12=(10-2)/qcnom

T_sig12=10^(-2)

T_E12=1

K_ex12=1

H_R12=tf([T_E12 1],[2*T_sig12 0])

Vr=50

Ti12=0.02

T11=100*60

Tm11=10*60

K_cpi11=(10-2)/P_abv_nom

Vr11=0.8*T11/Tm11

Ti11=3*Tm11

H_R11=tf([Vr11*Ti11 1],[Ti11 0])

K_Cip43=(1-0.2)/(10-2)

H_Cip43=tf([K_Cip43],[1])

K_E43=q_apa_nom/(1-0.2)

T_E43=1

H_E43=tf([K_E43],[T_E43 1])

K_M43=(10-2)/q_apa_nom

K_m41=(10-2)/q_abv_nom

T_m46=12*60

T46=120*60

H46=tf([1],[T46 1],'ioDelay',T_m46)

H_Ext43=K_Cip43*H_E43*K_M43

T_sig43=10^(-2)

H_R43=tf([1 1],[2*T_sig43 0])

Vr=50
Ti=1

m_q_abv_nom=0.1
c_q_abv_nom=10

K_SMH=m_q_abv_nom/c_q_abv_nom

T_i_SMH=20
H_SMH=tf([K_SMH*T_i_SMH 1],[T_i_SMH 0])

Kv=q_abv_nom/m_q_abv_nom

H_v=tf([Kv],[1])

T_TG=10
K_TG=P/q_abv_nom

H_TG=tf([K_TG],[T_TG 1])

U_p=10
K_p=U_p/P

f=50
U_f=10

K_F=U_f/f

Pnom=0.4/P

H_Ex1=H_SMH*H_v*H_TG;

zpk(H_Ex1)

H_d=zpk(H_Ex1*K_p)


T_sig_n=0.01

H_ex=zpk(H_d*tf([1],[T_sig_n 1]))




H_rp=zpk(tf([1],conv([2*T_sig_n 0],[T_sig_n 1]))/H_ex)


df=0.4

S=-df/P

K_S=-1/(0.02*P*S)

I_Gnom=S_G_nom*10^6/(sqrt(3)*U_Gnom*10^3)

P_Gnom=S_G_nom*cos


P_E_nom=0.0025*P_Gnom

I_E_nom=P_E_nom*10^6/U_E_nom

P_PC_nom=1/100*P_E_nom*10^3

i_PC_nom=P_PC_nom/U_PC_nom*10^3

K_CCG=-11.25

K_EE=U_E_nom/U_PC_nom


H_EE=tf([K_EE],[T_EE 1])

K_E=I_E_nom/U_E_nom


H_E=tf([K_E],[T_E 1])

K_EG=U_Gnom*10^3/I_E_nom

H_EG=tf([K_EG],[1]);

K_G=I_Gnom/(U_Gnom*10^3)


H_G=tf([K_G],[T_G 1])

U_G_star=10

K_UG=U_G_star/(U_Gnom*10^3)

K_iG=0.5/I_Gnom

U_iEr=10

K_iE=U_iEr/I_E_nom

U_UEr=10

K_UE=U_UEr/U_E_nom

K_CCGPC=U_PC_nom/90*(-K_CCG)

H_new_Ex=K_CCGPC*H_EE*K_UE

T_sig=10^(-2)

H_ExA=H_new_Ex*tf([1],[T_sig 1])

H_RUE=zpk(tf([1],conv([2*T_sig 0],[T_sig 1]))/H_ExA)


H1=zpk(H_RUE*K_CCGPC*H_EE/(1+H_RUE*K_CCGPC*H_EE*K_UE))

%%

% H1=tf([50],[0.02 1])

H_Ex2=zpk(H1*H_E*K_iE)

T_sig=10^(-2)

H_ExB=H_Ex2*tf([1],[T_sig 1])

H_RIE=zpk(tf([1],conv([2*T_sig 0],[T_sig 1]))/H_ExB)

% H_RIE=tf( conv([0.02 1],[0.5 1]),[0.02 0])

%%

T_I_RIE=0.02*26

T_D_RIE=1/(2*26)

H2=zpk(H_RIE*H1*H_E/(1+H_RIE*H1*H_E*K_iE))

% H2=tf([9925],[1 50])
% 
% H2=tf([9925/50],[1/50 1])

H_reactie=zpk(K_UG-H_G*K_iG)

H_direct=zpk(H2*K_EG)

T_sig=10^(-2)

H_sig=tf([1],[T_sig 1]);

H_ex3=zpk(H_reactie*H_direct*H_sig)

H_rug=zpk(tf([1],conv([2*T_sig 0],[T_sig 1]))/H_ex3)

V_RUG=50.2
T_i_RUG=5.02
T_d_RUG=0.037
T_N=0.19


%%

C1_ales=4.7*10^(-6)
R1=T_N/C1_ales

R1_1_ales=100*10*3
R1_2_ales=12*10^3