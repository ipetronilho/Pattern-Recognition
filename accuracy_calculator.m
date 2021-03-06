function [ output_args ] = accuracy_calculator( y_expected, y_predicted )
%accuracy_calculator Summary of this function goes here
%   Detailed explanation goes here

    % plot confusion matrix
    plotconfusion(y_expected, y_predicted);

    size_positives = length(find(y_expected==0));
    size_negatives = length(find(y_expected==1));
    size_sample = size_positives+size_negatives;
    size_sample
    
    %size_outcome_positives = length(find(y_predicted == 0))
    %size_outcome_negatives = length(find(y_predicted == 1))
    
    % expected output: y_train
    true_positives = length(find(y_expected == 0 & y_predicted == 0));
    false_positives = length(find(y_expected == 1 & y_predicted==0));

    true_negatives = length(find(y_expected == 1 & y_predicted == 1));
    false_negatives = length(find(y_expected == 0 & y_predicted==1));


    true_positives
    false_positives
    true_negatives
    false_negatives
    
    
    accuracy = (true_positives + true_negatives) / size_sample * 100; % 0.7788
    accuracy
    
end

