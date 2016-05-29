function [ outcome_y ] = svm( data )
%SVM Summary of this function goes here
%   Detailed explanation goes here
    global SPLITTING_PERCENTAGE
    
    SPLITTING_PERCENTAGE
    
    [size_rows, size_columns] = size(data.X);
    % split between training and test sets
    % 70%: training | 30%: tests
    
    %X = [1 2 1 2 3 3; 2 1 1 3 2 3];
    %y = [0 0 0 1 1 1];
    
    y_zeros = find(data.y==0); 
    y_ones = find(data.y==1); 
    
    percentage_zeros = round(length(y_zeros)*SPLITTING_PERCENTAGE);
    percentage_ones = round(length(y_ones)*SPLITTING_PERCENTAGE);
    
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
    
    
    % SVM
    model = fitcsvm(X_train', y_train');
    outcome_y = predict(model, X_test);
    outcome_y = outcome_y';
    
    accuracy_calculator(y_test, outcome_y);

end

