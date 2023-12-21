% Define the number of bins for the histogram
numBins = 8;

% Create a histogram from the data
histogram(data, numBins, 'Normalization', 'probability');
xlabel('Data Values');
ylabel('Probability');
title('Histogram of Data');

% Fit a Gaussian distribution to the histogram
pd = fitdist(data, 'Normal');

% Extract the parameters of the fitted Gaussian distribution
mu = pd.mu;
sigma = pd.sigma;

% Overlay the Gaussian fit on the histogram
hold on;
x = linspace(min(data), max(data), 100);
y = pdf(pd, x);
plot(x, y, 'r', 'LineWidth', 2);
legend('Histogram', 'Gaussian Fit');
hold off;

% Display the Gaussian parameters
fprintf('Gaussian Fit Parameters:\n');
fprintf('Mean (mu): %.4f\n', mu);
fprintf('Standard Deviation (sigma): %.4f\n', sigma);
xlim([0 60])
ylim([0 0.5])