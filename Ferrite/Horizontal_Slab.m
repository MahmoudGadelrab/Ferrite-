function [B AppE] = Horizontal_Slab(Frasr,FillingFactor,a,b,e_fill,Ms,Ho,Cf)
%%%%%%THIS FUNCTION IS TO CALCULATE THE HORIONTAL SLABS BETA DIFFERENCE

%%%%%Getting The constants
[Mu_o e_o e_r v a, b f_operating f_center f_o f_m k_c k_o beta_o x_postion]= getconstants(a,b,e_fill,Ho,Ms); 
%%%%%%%Getting the Dimensions
[Wf,Hf] = Dimensions(Frasr,FillingFactor,a,b,Cf);%%%TO Calculate the Dimensions of The Ferrite Slab

lamdaCut=(v)/(1.4*10^9);
Mu=(Hf/b).*(Mu_o.*(1+(f_m.*f_o)./(f_o.^2-f_operating.^2)))+(1-Hf/b)*Mu_o;%%%The Effective permeability 
kappa=(Hf*Mu_o/b).*((f_m.*f_operating)./(f_o.^2-f_operating.^2));%%% The Effective Kappa
eff=((Hf*e_o*e_r)/b)+(1-Hf/b)*e_o;%%%The Effective Permittivity

c=x_postion-Wf/2;%%%%%%%Place of The Ferrite Slab
d=a-c-Wf;%%%%%the distance from slab to the end

[B]=Exact(Mu,kappa,f_operating,beta_o,eff,c,Mu_o,d,Wf,k_o,f_center,lamdaCut );
[AppE]= App(Mu,kappa,FillingFactor,c,k_c,lamdaCut);
end



