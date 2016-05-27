function [ data ] = feature_selection( data )
% excluir todas as variáveis com cov >= 0.9
    
    covariance_matrix = calculate_covariance(data);
    
    figure;
    imagesc(covariance_matrix)
    
    [size_rows, size_columns] = size(covariance_matrix);
    
    list_features= ones(size_rows,1);
   
   %covariance_matrix   
   
    for i=1:size_rows
        if list_features(i) ~= 0 % está descartada
            for j=1:size_columns
                if covariance_matrix(i,j) >= 0.8 && i~= j
                    list_features(j)=0; 
                end
            end
        end
    end
    
    % selected features: 0s e 1s
    remove_features = find(list_features == 0); % row of the feature
    number_selected_features = size(remove_features);
    
    %delete redundant features from matrix
    selected_features = find(list_features == 1);
    data.X = data.X(selected_features, :); % 17 x 30000
    
end