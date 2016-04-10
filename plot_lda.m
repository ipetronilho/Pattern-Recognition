function [out_data] = plot_lda(in_data)
% Linear Discriminant Analysis. The goal is to train the linear transform which maximizes ratio 
%between between-class and within-class scatter matrix of projected data.

    model = lda(in_data);
    out_data = linproj(in_data, model);
    figure;
    ppatterns(out_data);

end