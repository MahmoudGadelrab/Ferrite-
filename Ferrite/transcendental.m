function f = transcendental(betax,f_operating,kappa ,Mu,Mu_o, e, c, d, t,k_o,sign)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
w=2*pi*f_operating;
kappa=sign.*kappa;%%%%THIS STEP TO GET ONE FOR THE +VE BETA OF THE -VE BETA DEPEND ON THE SIGN
Me=(Mu.^2-kappa.^2)./Mu;
kf=sqrt(w.^2.*Me.*e-betax.^2);%%%CUTOFF IN THE FERRITE
ka=sqrt(k_o.^2-betax.^2);%%%%CUTOFF IN THE AIR REGION
term1=(kf./Me).^2;
term2=((kappa.*betax)./(Mu.*Me)).^2;
term31=ka.*cot(ka.*c);
term321=kf.*cot(kf.*t);
term32=(term321./(Mu_o.*Me));
term33=(kappa.*betax)./(Mu_o.*Me.*Mu);
term3=term31.*(term32-term33);
term41=(ka./Mu_o).^2;
term42=cot(ka.*c).*cot(ka.*d);
term4=term41*term42;
term51=ka.*cot(ka.*d);
term5=term51.*(term32+term33);
f=(term1+term2-term3-term4-term5);
end

