function [Mu_o e_o e_r v a b f_operating f_center f_o f_m k_c k_o beta_o x_postion]= getconstants(a1,b1,e_fill,Ho,Ms)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%%%%Constants
Mu_o=4*pi*10^-7;%%%permeability of the Air
e_o=8.85*(10^-12);%%%permmitivity of the Air
e_r=14.7;%%%permmitivity of the ferrite
c=3*10^8;%%%Speed of light
conv_in=0.0254;%%%To convert from inch to metre
%%%%WG Dimensions IN METRE
a=a1*conv_in;
b=b1*conv_in;
%%%Speed of the wave in the WG 
v=c/sqrt(e_fill);
%%%Frequency Calculations  %%% THESE ARE SPECIAL FOR WR_650
f_low=1.1*10^9;%%%LOWERFrequency 
f_up=1.7*10^9;%%%UPPERFrequency
s=(1.7-1.1)*10^9;
f_operating=f_low:s/1000:f_up;%%%%BW
f_center=(f_low+f_up)/2;
%%%LARMOR FREQUENCY
f_o=2.8*(10^6)*Ho;
f_m=2.8*(10^6)*Ms;
%%%%propagation constants in WG
k_c=pi/a;%%%Cuttoff frequency of the empty guide
k_o=2*pi*((1.4*10^9)/c);
beta_o=sqrt(k_o^2-k_c^2);%%%Propagation constant in air
%%%place of the Circular Polarization Point
x_postion=atan(k_c/beta_o)/k_c;
end

