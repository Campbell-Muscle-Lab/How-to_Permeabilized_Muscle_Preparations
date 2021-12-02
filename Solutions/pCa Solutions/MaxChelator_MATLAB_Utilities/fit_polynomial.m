function error = fit_polynomial(p,x,y)

fit = polyval(p,x);

error=dot(fit-y,fit-y);