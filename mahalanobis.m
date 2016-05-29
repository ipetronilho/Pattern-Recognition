function [ outcome_y ] = mahalanobis( data )
%MAHALANOBIS Summary of this function goes here
%   Detailed explanation goes here

    [size_rows, size_columns] = size(data.X);
    % split between training and test sets
    % 70%: training | 30%: tests
    
    %X = [1 2 1 2 3 3; 2 1 1 3 2 3];
    %y = [0 0 0 1 1 1];
    
    [X_train, y_train, X_test, y_test] = split(data);
    
    % ------ EUCLIDIAN 
    w = mean(data.X, 2);
    
    
    [train_dimensions, train_cases] = size(X_train); 
    [test_dimensions, test_cases] = size(X_test); 
    g = zeros(2,test_cases);
    
    % w = zeros(train_dimensions, train_cases);
    
    %w(i) = média da linha
    classes = [0, 1];
        
    [number_dimensions, number_cases] = size(X_train);
    % size_y_train = size(y_train)

    number_classes=length(classes);

    cov_matrix = cov(X_train');
    c_inv = inv(cov_matrix);
    
    for i=1:number_classes
        indices = find(y_train==classes(i));
        
        % em que m é o centróide
        
        m = mean(X_train(:, indices), 2);
        
        %X_train(:, indices)
        %m
        for j=1:test_cases
            distancia = abs(m - X_test(:, j));
            
            g(i,j) = distancia' * c_inv * distancia;
            %X_train(:, i);
            %g(i,j) = dot(m, X_train(:, i)) + w_0; % fixar a coluna
        end
    end
    
    outcome_y = zeros(1, test_cases);
    
    for i=1:test_cases
        if g(1,i) <= g(2,i)
            outcome_y(i)=0;
        else
            outcome_y(i)=1;
        end
    end
    
    accuracy_calculator(y_test, outcome_y);
   
end

