function r_sq = calculate_r_squared(y,y_fit)

sum_y=sum(y);
sum_squares_residuals=sum((y_fit-y).^2);

y_mean=mean(y);

sum_squares_mean=sum((y-y_mean).^2);

r_sq = 1-sum_squares_residuals/sum_squares_mean;
