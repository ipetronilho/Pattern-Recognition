    function [pca_data] = plot_pca(data, flag)
    % convert a set of observations of possibly correlated variables into
    % a set of values of linearly uncorrelated variables called principal components

    model = pca(data.X);
    out_data = linproj(data.X, model);
    % figure;
    % ppatterns(out_data);

    if flag == 0
        % KAISER
        kaiser_threshold = 1
        kaiser_eigenvectors = find(model.eigval >= kaiser_threshold)
        new_dimension = length(kaiser_eigenvectors)

    elseif flag == 1
        % SCREE
        scree_threshold = 0.8
        proportion = cumsum(model.eigval) ./ sum(model.eigval)
        new_dimension = length(find(proportion >= scree_threshold))
    else
        new_dimension = data.dim;
    end
    pca_data = data;
    pca_data.X = out_data(1:new_dimension,:);
    pca_data.dim = new_dimension;

    end