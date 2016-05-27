
data = load('dataset.mat');

%normalization
normalized_data = scaling(data);

% [size_rows, size_columns] = size(normalized_data.X); % 23 x 30000

% feature selection (discard redundant features) - done!
selected_data = feature_selection(normalized_data);

% PCA
%Kaiser
plot_pca(selected_data,0);

%Scree
plot_pca(selected_data,1);

% LDA
plot_lda(selected_data);

% feature reduction
[outcome_y, g] = euclidian(selected_data);

%compare(data);

% feature_reduction(selected_data);


