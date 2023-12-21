function filtered_signal = removePeriodicNoise(signal, sampling_rate, noise_frequency)
    % signal: input signal with periodic noise
    % sampling_rate: sampling rate of the signal
    % noise_frequency: frequency of the periodic noise
    
    % Design notch filter
    wo = noise_frequency / (sampling_rate / 2);
    bw = wo / 35; % Bandwidth
    [b, a] = iirnotch(wo, bw);
    
    % Apply notch filter to the signal
    filtered_signal = filtfilt(b, a, signal);
end
