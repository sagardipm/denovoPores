function [jump_indices_start, jump_indices_end, jump_amplitudes] = detectCurrentJumps(input_signal, window_size, threshold_percentage)
    % input_signal: array containing the input signal (e.g., current data)
    % window_size: size of the rolling mean window (e.g., 50 or 100)
    % threshold_percentage: threshold percentage for detecting jumps
    
    num_samples = length(input_signal);
    jump_indices_start = [];
    jump_indices_end = [];
    jump_amplitudes = [];
    
    climbing = 0;
    for i = window_size+1:num_samples
        rolling_std = std(input_signal(i-window_size:i-1));
        rolling_mean = mean(input_signal(i-window_size:i-1));
        if input_signal(i) > (rolling_mean + (1 + threshold_percentage) * rolling_std) && climbing == 0
            climbing = 1;
            jump_indices_start = [jump_indices_start, i-1];
            prevmean = rolling_mean;
            prevstd = rolling_std;
        elseif climbing == 1
            if input_signal(i) < (rolling_mean + (1 + threshold_percentage) * prevstd)
                jump_indices_end = [jump_indices_end, i];
                newmean = rolling_mean;
                climbing = 0;
                jump_amplitudes = [jump_amplitudes, input_signal(i) - prevmean];
            end
        end
    end

end
