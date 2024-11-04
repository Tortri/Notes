function plotSParameters(directory)
    % Get list of files
    files = dir(fullfile(directory, '*.s1p'));

    % Loop through each file
    for i = 1:length(files)
        filename = fullfile(directory, files(i).name);

        % Read S-parameter data 
        data = sparameters(filename);

        % Extract data
        freq = data.Frequencies / 1e9; 
        s11 = squeeze(data.Parameters);

        % Create figure with adjusted name handling
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
        smithplot(s11);
        title(['S11 (Smith Chart) from ', strrep(filename, '\', '/')]);
    end
end