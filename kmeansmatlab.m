

% Load sample data
data = table2array(rawuberdata);

K = 7;
iterations = 20;

centroids = data(randperm(size(data, 1), K), :);

cluster_assignments = zeros(size(data, 1), 1);

for i = 1:iterations
    for j = 1:size(data, 1)
        distances = zeros(K, 1);
        for k = 1:K
            distances(k) = sum((data(j, :) - centroids(k, :)).^2);
        end
        [~, cluster_assignments(j)] = min(distances);
    end
    
    for k = 1:K
        centroids(k, :) = mean(data(cluster_assignments == k, :));
    end
end

% Display the cluster center coordinates
disp('Cluster center coordinates:');
disp(centroids);

for k = 1:K
scatter(data(cluster_assignments == k, 1), data(cluster_assignments == k, 2), '.');
hold on;
end
scatter(centroids(:, 1), centroids(:, 2), '+', 'MarkerEdgeColor', 'red');
title('Clusters');
xlabel('Feature 1');
ylabel('Feature 2');
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Cluster 5', 'Cluster 6', 'Cluster 7', 'Cluster Centers');

hold off;
