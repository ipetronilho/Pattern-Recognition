function [covariance] = calculate_covariance(data)
% matrix 23x23 that calculates the covariance between the 23 variables
    
    covariance = cov(data.X'); % 23 x 23: d�-me a covari�ncia entre as vari�veis. posso tirar aquelas que t�m maior
    correlation = corrcoef(data.X');
    %figure;
    %imagesc(covariance)
    %figure;
    %imagesc(correlation)
    
    % select the correlated features with > 90%
    
    
end