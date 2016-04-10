function [out_data] = plot_pca(in_data)
% convert a set of observations of possibly correlated variables into 
% a set of values of linearly uncorrelated variables called principal components
    
    %mcaplot(in_data.X)
    model = pca(in_data.X);
    out_data = linproj(in_data.X, model);
    figure;
    ppatterns(out_data);

end