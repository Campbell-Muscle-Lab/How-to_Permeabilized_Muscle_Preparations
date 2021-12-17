function process

file_string='C:\Users\Greg Milburn\Documents\MaxChelator\37C_pCa_mixing_list_MaxChelator_output.txt'
% output_file_string='c:\ken\maxchelator\pH70_7_5mM_ADP_15C\matlab_mixing_table_output_45_values.txt'
output_file_string='C:\Users\Greg Milburn\Documents\MaxChelator\mix_mix_output.txt'
% able_output_45_values.txt'
% pCa_90_Total_Ca=15.3e-6
% pCa_45_Total_Ca=7.00e-3
pCa_90_Total_Ca=1.86e-5
pCa_45_Total_Ca=7.01e-3

% Load MaxChelator output file

mc=load_maxchelator_output(file_string);
mc.pCa_values=-log10(mc.FCa2);

% Plot output

figure(1);
subplot(2,1,1);
plot(mc.pCa_values,mc.TCa2,'ro');

% Fit output

p_order=2;
p=[0.002 -1e-6 3 0.45 1*ones(p_order,1)']
fit_options=optimset('TolFun',1e-7,'MaxFunEvals',5e3);
[p,fval,exitflag,search_output]=fminsearch(@fit_sigmoid_plus_power,p,fit_options,mc.pCa_values,mc.TCa2)

x=mc.pCa_values;
A1=p(1);
A2=p(2);
x0=p(3);
dx=p(4);
fit_TCa2 = A2 + (A1-A2)./(1 + exp((x-x0)./dx)) + p(5)*x.^p(6);

line(mc.pCa_values,fit_TCa2,'Color',[0 1 0]);
func_evaluations=search_output.funcCount
r_sq=calculate_r_squared(fit_TCa2,mc.TCa2)

% Calculate pCa points

pCa_values = 7.0:-0.05:4.0;
pCa_TCa2 = A2 + (A1-A2)./(1 + exp((pCa_values-x0)./dx)) + p(5)*pCa_values.^p(6);
hold on;
plot(pCa_values,pCa_TCa2,'b^');
hold off;

% Calculate Proportions

prop_45 = (pCa_TCa2-pCa_90_Total_Ca)./(pCa_45_Total_Ca-pCa_90_Total_Ca);
prop_90 = 1 - prop_45;

% Display & output

subplot(2,1,2);
plot(pCa_values,prop_45,'ro',pCa_values,prop_90,'b^');

output_file=fopen(output_file_string,'w');
fprintf(output_file,'Input file: %s\n\n',file_string);
fprintf(output_file,'pCa 9.0 Total Ca2 (M): %g\n',pCa_90_Total_Ca);
fprintf(output_file,'pCa 4.5 Total Ca2 (M): %g\n',pCa_45_Total_Ca);
fprintf(output_file,'\n\n');
fprintf(output_file,'pCa\tFCa2\t\tTCa2\t\tProp 90\tProp 45\n\n');
for i=1:length(pCa_values)
    fprintf(output_file,'%g\t%.4g\t\t%g\t\t%g\t%g\n', ...
        pCa_values(i),10.^-pCa_values(i),pCa_TCa2(i),prop_90(i),prop_45(i));
end
fprintf(output_file,'\nr_squared: %g\n',r_sq);
fclose(output_file);
