% Parameters for bandpass filter
fs = 5000; % Sampling frequency in Hertz
wpass = [75 200];

% Just change the name of the processed data variable
current_signal = d(:,2);
% Change threshold based on mean
th = 50;

% Apply the Bandpass filter to the raw current signal
filtered_current_signal = bandpass(current_signal, wpass, fs);

% Calculate the mean of the current signal
maxcurrent = max(current_signal);
meancurrent = mean(current_signal(~isnan(current_signal)));
if maxcurrent > 5*meancurrent && length(current_signal(abs(current_signal - maxcurrent) < th)) < 1000
    maxcurrent = max(current_signal(abs(current_signal) < 0.2*maxcurrent));
end
openstate = current_signal(abs(current_signal - maxcurrent) < th);
mean_current = mean(openstate)

% Shifted filtered signals
filtered_current_signal = filtered_current_signal + mean_current;

% Plot the original and filtered signals
figure;
subplot(2,1,1);
plot(t, current_signal);
title('Raw Current Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t, filtered_current_signal);
title('Filtered Current Signal (Bandpass Filter)');
xlabel('Time (s)');
ylabel('Amplitude');