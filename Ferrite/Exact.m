function [ Exact ] = Exact( Mu,kappa,f_operating,beta_o,e,c,Mu_o,d,t,k_o,f_center,lamdaCut )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
beta_o=sqrt((2*pi*((1.9*10^9)/(3*10^8)))^2-18.5713^2);
%%%TheSolution of The Exact
betaPos=f_operating*0;%%%%Array to Find the +ve Beta Solution
betaNeg=f_operating*0;%%%%Array to Find the -ve Beta Solution
count=1;%%%%Counter

fun1 = @(betax) transcendental(betax,f_operating(count),kappa (count),Mu(count),Mu_o, e, c, d, t,k_o,1);
fun2 = @(betax) transcendental(betax,f_operating(count),kappa (count),Mu(count),Mu_o, e, c, d, t,k_o,-1);


betaPos(count)=fzero(fun1,beta_o);%%%%VECTOR TO GET THE +VE BETA
betaNeg(count)=fzero(fun2,beta_o);%%%%VECTOR TO GET THE -VE BETA

%%%%Loop to find the Solution
for count =2:1: length(f_operating)
    fun1 = @(betax) transcendental(betax,f_operating(count),kappa (count),Mu(count),Mu_o, e, c, d, t,k_o,1);
    fun2 = @(betax) transcendental(betax,f_operating(count),kappa (count),Mu(count),Mu_o, e, c, d, t,k_o,-1);

    betaPos(count)=fzero(fun1,betaPos(count-1));
    betaNeg(count)=fzero(fun2,betaNeg(count-1));

end 
betaAns1=abs(betaPos-betaNeg);%%%%The Beta Difference1
betaAns1=betaAns1.*lamdaCut;
Exact=betaAns1.*(180/pi);


end

