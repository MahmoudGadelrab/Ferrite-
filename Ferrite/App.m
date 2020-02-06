function AppE = App(Mu,kappa,FillingFactor,c,k_c,lamdaCut)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


AppE=abs((2*k_c.*kappa.*sin(2*k_c*c)*FillingFactor)./(Mu));
AppE=AppE.*lamdaCut;
AppE=AppE.*(180/pi);


end

