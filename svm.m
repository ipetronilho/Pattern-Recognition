function [ outcome_y ] = svm( data )
%SVM Summary of this function goes here
%   Detailed explanation goes here
    
    [X_train, y_train, X_test, y_test] = split(data);    

    % SVM
    model = fitcsvm(X_train', y_train');
    outcome_y = predict(model, X_test');
    outcome_y = outcome_y';
    
    accuracy_calculator(y_test, outcome_y);

end

