function [ output_args ] = mahalanobis( input_args )
%MAHALANOBIS Summary of this function goes here
%   Detailed explanation goes here

    [size_rows, size_columns] = size(data.X);
    % split between training and test sets
    % 70%: training | 30%: tests
    
    %X = [1 2 1 2 3 3; 2 1 1 3 2 3];
    %y = [0 0 0 1 1 1];
    
    y_zeros = find(data.y==0); 
    y_ones = find(data.y==1); 
    
    percentage_zeros = round(length(y_zeros)*0.7);
    percentage_ones = round(length(y_ones)*0.7);
    
    train_y_zeros = y_zeros(1, 1:percentage_zeros);
    train_y_ones = y_ones(1, 1:percentage_ones);
    
    test_y_zeros = y_zeros(1, percentage_zeros+1:end);
    test_y_ones = y_ones(1, percentage_ones+1:end);
    
    % todos os índices de treino e de teste
    indexes_train = horzcat(train_y_zeros, train_y_ones);
    indexes_test = horzcat(test_y_zeros, test_y_ones);
    
    
    indexes_train = sort(indexes_train); % [1 2 3 4 5 6]
    indexes_test = sort(indexes_test);   % [7 8]
    
    
     X_train = data.X(:, indexes_train); 
     y_train = data.y(:, indexes_train);
    
     X_test = data.X(:, indexes_test);
     y_test = data.y(:, indexes_test);
    
    
    % ------ EUCLIDIAN 
    w = mean(data.X, 2);
    w_0 = w' * w;
    
    
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
    
    matriz_confusao(y_test, outcome_y);
   
end

