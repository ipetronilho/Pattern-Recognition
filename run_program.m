function run_program()
    data = load('dataset.mat');
    
    %normalization
    normalized_data = scaling(data);
    
    %feature reduction
    plot_pca(normalized_data);
    plot_lda(normalized_data);
    
    %feature selection
end