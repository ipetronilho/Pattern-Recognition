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

for i=1:N_CLASSIFIERS
    if CLASSIFIER_1 == 1
        [outcome_y, g] = euclidian(selected_data);
    elseif CLASSIFIER_1 == 2
        [outcome_y, g] = mahalanobis(selected_data);
    end
end

