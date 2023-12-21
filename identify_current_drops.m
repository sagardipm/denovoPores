function [drop_indices, rise_indices, drop_amplitudes] = identify_current_drops(current_signal, th, falling_threshold, rising_threshold)
% IDENTIFY_CURRENT_DROPS Identify drops in an input current signal from the mean with certain falling and rising thresholds
%   [DROP_INDICES, DROP_AMPLITUDES] = IDENTIFY_CURRENT_DROPS(CURRENT_SIGNAL, FALLING_THRESHOLD, RISING_THRESHOLD)
%   returns the indices and amplitudes of the drops in the input CURRENT_SIGNAL that fall below the mean by more than
%   FALLING_THRESHOLD and then rise above the mean by more than RISING_THRESHOLD.
%
%   Example:
%       current_signal = randn(100,1);
%       falling_threshold = 2;
%       rising_threshold = 1;
%       [drop_indices, drop_amplitudes] = identify_current_drops(current_signal, falling_threshold, rising_threshold);

% Calculate the mean of the current signal
maxcurrent = max(current_signal);
meancurrent = mean(current_signal(~isnan(current_signal)));
if maxcurrent > 5*meancurrent && length(current_signal(abs(current_signal - maxcurrent) < th)) < 1000
    maxcurrent = max(current_signal(abs(current_signal) < 0.2*maxcurrent));
end
openstate = current_signal(abs(current_signal - maxcurrent) < th);
mean_current = mean(openstate)

% Identify the drops in the current signal
drop_indices = [];
rise_indices = [];
drop_amplitudes = [];
is_dropping = false;
for i = 1:length(current_signal)
    if ~is_dropping && current_signal(i) < falling_threshold*mean_current
        is_dropping = true;
        drop_indices(end+1) = i;
        drop_amplitudes(end+1) = current_signal(i) - mean_current;
    elseif is_dropping && current_signal(i) > rising_threshold*mean_current
        is_dropping = false;
        rise_indices(end+1) = i-1;
    elseif is_dropping
        drop_amplitudes(end) = min(drop_amplitudes(end), current_signal(i) - mean_current);
    end
end

end