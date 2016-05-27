function [data] = scaling(data)
     %normalized data = (data - mean)/standard deviation
    
    size_rows = size(data.X,1);      % 23
    size_columns = size(data.X, 2);  % 30000
   
    % calculate means
    means = mean(data.X, 2);    % column vector with the mean of each row
    [row_means, column_means] = size(means);
    
    means = mean(data.X);
    [row_means, column_means] = size(means);

    %find standard deviation
    deviation = std(data.X');  % row vector with the standard deviation of each row
    %deviation = deviation';    % column vector ...
    
    for i=1:size_rows
        for j=1:size_columns
            data.X(i,j) = (data.X(i,j)-means(i)) ./ deviation(i);
        end
    end
     %size(deviation)
     %size(means)
end