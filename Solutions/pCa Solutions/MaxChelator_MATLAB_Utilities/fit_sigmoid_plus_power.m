function error = fit_sigmoid_plus_power(p,x,y)

A1=p(1);
A2=p(2);
x0=p(3);
dx=p(4);

fit = A2 + (A1-A2)./(1 + exp((x-x0)./dx)) + p(5)*x.^p(6);;

error=dot(fit-y,fit-y);
