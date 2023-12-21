% current data
t0 = t1;
current = d1;
% Plot the original signal
figure;
subplot(2, 1, 1);
plot(t0, current);
title('Original Signal');
xlabel('Time');
ylabel('Current');

% Detrend the signal
order = 3;  % Choose the order of the polynomial for detrending
trend = polyfit(t0, current, order);
detrended_current = current - polyval(trend, t0);

% Plot the detrended signal
subplot(2, 1, 2);
plot(t0, detrended_current);
title('Detrended Signal');
xlabel('Time');
ylabel('Current');

% Display the detrending polynomial
figure;
plot(t0, polyval(trend, t0), 'r--', 'LineWidth', 2);
title('Detrending Polynomial');
xlabel('Time');
ylabel('Detrending Polynomial');

% You can adjust 'order' based on the degree of drift in your signal





%%
% Parameters for the Bessel filter
order = 8;  % 8-pole Bessel filter
cutoff_frequency = 2*pi*100;  % Replace with the desired cutoff frequency in Hz
cutoff_fs = cutoff_frequency;

% Design the Bessel filter
[z,p,k] = besself(order, cutoff_frequency);
[num,den]=zp2tf(z,p,k);
[numd,dend]=bilinear(num,den, cutoff_fs);

% Just change the name of the processed data variable
raw_current_signal = d(:,1);

% Apply the Bessel filter to the raw current signal
filtered_current_signal = filtfilt(numd, dend, raw_current_signal);

% Plot the original and filtered signals
figure(2);
subplot(2,1,1);
plot(t, raw_current_signal);
title('Raw Current Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t, filtered_current_signal);
title('Filtered Current Signal (Bessel Filter)');
xlabel('Time (s)');
ylabel('Amplitude');
