function [ outcome_y ] = voter( outcome_y_1, outcome_y_2, outcome_y_3 )
%VOTER Summary of this function goes here
%   Detailed explanation goes here
        % VOTER
    [X_train, y_train, X_test, y_test] = split(data);
        
    len=length(outcome_y_1)
    outcome_y=zeros(1,len);
    
    
    for i=1:len
        if (outcome_y_1(i)==outcome_y_2(i) || outcome_y_1(i)==outcome_y_3(i))
            outcome_y(i)=outcome_y_1(i);
        else
            outcome_y(i)=outcome_y_2(i);
        end
    end

    accuracy_calculator(y_test, outcome_y);
end

