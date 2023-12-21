function [t, dataf] = initplot(data, frequency, factor)
    dataf = table2array(data);
    dataf = downsample_mat(dataf, factor);
    t = linspace(0, factor.*length(dataf)./frequency, length(dataf));
    for ii = 1:size(dataf,2)-1
        figure(ii)
        plot(t, dataf(:,end), 'r')
        hold on
        if max(dataf(:,ii)) < 2.5 && round(mean(1000*dataf(:,ii))) > 1
            dataf(:, ii) = 1000*dataf(:, ii);
        end

        plot(t, dataf(:,ii), 'b')
        plot(t, zeros(length(t),1), 'k')
    end
end