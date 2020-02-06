function [ E AppE] = Ferritepkg(a,b,e_fill,Ho,Ms,FillingFactor)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[Mu_o , e_o, e_r, v, a, b, f_operating, f_center, f_o, f_m, k_c, k_o, beta_o, x_postion]= getconstants(a,b,e_fill,Ho,Ms);
e=e_o*e_r;
%%%%%%Boundaries dimensions
t=FillingFactor*a;
c=x_postion-t/2;
d=a-c-t;
%%%%%%
Mu=Mu_o.*(1+((f_o.*f_m)./(f_o.^2-f_operating.^2)));
kappa=Mu_o.*((f_operating.*(f_m)./(f_o.^2-f_operating.^2)));
lamdaCut=(v)/(1.4*10^9);
lamdaCut=1;

[E]=Exact(Mu,kappa,f_operating,beta_o,e,c,Mu_o,d,t,k_o,f_center,lamdaCut);
[AppE]=App(Mu,kappa,FillingFactor,c,k_c,lamdaCut);


end

