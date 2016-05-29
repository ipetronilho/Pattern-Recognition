global PATH_DATASET
global NORMALIZE_FLAG

global FEATURE_SELECTION
global COVARIANCE_TRESHOLD

global PCA_FLAG
global PCA_FLAG_KAISER
global PCA_FLAG_SCREE

global LDA_FLAG

global N_CLASSIFIERS
global SPLITTING_PERCENTAGE
data = load(PATH_DATASET);


%normalization
if NORMALIZE_FLAG
    disp('normalize it is!!')
    normalized_data = scaling(data);
else
    normalized_data = data;
end

% [size_rows, size_columns] = size(normalized_data.X); % 23 x 30000

% feature selection (discard redundant features) - done!
if FEATURE_SELECTION
    selected_data = feature_selection(normalized_data);
else
    selected_data = data;
end
% PCA


if PCA_FLAG
    if PCA_FLAG_KAISER
        plot_pca(selected_data,0);
    elseif PCA_FLAG_SCREE
        plot_pca(selected_data,1);
    end
end

% LDA
if LDA_FLAG
    plot_lda(selected_data);
end

if N_CLASSIFIERS == 1
    if CLASSIFIER_1 == 1
        [outcome_y] = euclidian(selected_data);
    end
    if CLASSIFIER_1 == 2
        [outcome_y] = mahalanobis(selected_data);
    end
    if CLASSIFIER_1 == 3
        [outcome_y] = svm(selected_data);
    end

elseif N_CLASSIFIERS == 3
    
    [outcome_y_1] = euclidian(selected_data);
    [outcome_y_2] = mahalanobis(selected_data);
    [outcome_y_3] = svm(selected_data);
    
    outcome_y = voter(outcome_y_1, outcome_y_2, outcome_y_3);
    
end