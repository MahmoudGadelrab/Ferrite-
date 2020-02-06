clc
clear all
close all
%%%%WG dimensions
a=6.66;
b=3.41;
%%%%Ferrite properties
Ms=300;
Ho=120;
%%%%Filling Material in WG
e_fill=1;
FillingFactor=0.009;
Frasr=5;
Cf=1;
d9=load('0.009.txt');
x=d9(:,1)*10^9;
y9=d9(:,2)';
d8=load('0.008.txt');
y8=d8(:,2)';
d7=load('0.007.txt');
y7=d7(:,2)';
d6=load('0.006.txt');
y6=d6(:,2)';
d5=load('0.005.txt');
y5=d5(:,2)';

lamdaCut=(3*10^8)/(1.4*10^9);
%[Exact App] = Ferritepkg(a,b,e_fill,Ho,Ms,FillingFactor);
%[Exact App] = Horizontal_Slab(Frasr,FillingFactor,a,b,e_fill,Ms,Ho,Cf);
f_low=1.1*10^9;%%%LOWERFrequency 
f_up=1.7*10^9;%%%UPPERFrequency
s=(1.7-1.1)*10^9;
f_operating=f_low:s/1000:f_up;
figure()
[Exact App] = Ferritepkg(a,b,e_fill,Ho,Ms,0.009);
z9=100*abs(y9-App)/360;
yyaxis left
plot(f_operating,y9,'b',f_operating,App,'r')
yyaxis right
plot(x,z9);
ylim([0 10])
figure()
[Exact App] = Ferritepkg(a,b,e_fill,Ho,Ms,0.008);
z8=100*abs(y8-App)/360;
yyaxis left
plot(f_operating,y8,'b',f_operating,App,'r')
yyaxis right
plot(x,z8);
ylim([0 10])
figure()
[Exact App] = Ferritepkg(a,b,e_fill,Ho,Ms,0.005);
z5=100*abs(y5-App)/360;
yyaxis left
plot(f_operating,y5,'b',f_operating,App,'r')
yyaxis right
plot(x,z5);
ylim([0 10])
figure()
[Exact App] = Ferritepkg(a,b,e_fill,Ho,Ms,0.007);
z7=100*abs(y7-App)/360;
yyaxis left
plot(f_operating,y7,'b',f_operating,App,'r')
yyaxis right
plot(x,z7);
ylim([0 10])
figure()
[Exact App] = Ferritepkg(a,b,e_fill,Ho,Ms,0.006);
z6=100*abs(y6-App)/360;
yyaxis left
plot(f_operating,y6,'b',f_operating,App,'r')
yyaxis right
plot(x,z6);
ylim([0 10])
%plot(f_operating,Exact,'b',f_operating,App,'r');
% hold on 
% plot(x,y*lamdaCut,'k')
%ylim([0 10])