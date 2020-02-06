function [wf,hf] = Dimensions(Frasr,FillingFactor,a,b,Cf)
%%%%%%%%%THIS FUNCTION TO CALCUATE THE FERRITE SLAB DIMENSIONS

wf=sqrt(2*a*b*FillingFactor*Frasr);%%%WIDTH OF THE FERRITE 
hf=2*Cf*wf/(Frasr);%%%%HEIGHT OF THE FERRITE

end
