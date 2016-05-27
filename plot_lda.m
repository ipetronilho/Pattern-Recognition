function [lda_data] = plot_lda(in_data)
% Linear Discriminant Analysis. The goal is to train the linear transform which maximizes ratio 
%between between-class and within-class scatter matrix of projected data.
    new_dimension = length(unique(in_data.y)) - 1; % o optimal para LDA é o nº de classes menos 1
    

    model = lda(in_data,new_dimension);
    out_data = linproj(in_data.X, model);
    % figure;
    % ppatterns(out_data);
    
    
    lda_data = in_data;
    lda_data.X = out_data; % porque em cima já calcula para o nº de dimensoes que quero
    lda_data.dim = new_dimension;
    
    
end