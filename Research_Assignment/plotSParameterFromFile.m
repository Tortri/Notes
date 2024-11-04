function plotSParameterFromFile(filename)
    % Read S-parameter data from Touchstone file
    data = sparameters(filename);

    % Extract frequency and S11 data
    freq = data.Frequencies / 1e9; % Convert frequency to GHz
    s11 = squeeze(data.Parameters);

    % Create a new figure with adjusted name handling
    figname = sprintf('S-parameters from %s', strrep(filename, '\', '/')); 
    figure('Name', figname);

    % Magnitude plot
    subplot(1, 2, 1);
    plot(freq, 20 * log10(abs(s11)));
    xlabel('Frequency (GHz)');
    ylabel('Magnitude of S11 (dB)');
    title(['S11 from ', strrep(filename, '\', '/')]);
    grid on;

    % Smith chart
    subplot(1, 2, 2);
    smithchart(s11);
    h = findobj(gca, 'Type', 'text');
    set(h, 'FontSize', 6);
    title(['S11 (Smith Chart) from ', strrep(filename, '\', '/')]);
end