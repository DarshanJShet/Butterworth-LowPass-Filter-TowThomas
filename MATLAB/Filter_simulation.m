clc; clear; close all;

% === Plot settings ===
fsize = 14;  % Font size
lw = 2;      % Line width
%% === Filter Specifications ===
fc = 50e6;         % Cutoff frequency in Hz
w0 = 2*pi*fc;      % Angular frequency
C1 = 0.5e-12;      % F
C2 = 0.5e-12;      % F

%% === Desired Q values ===
Q1 = 0.9;
Q2 = 0.7;

%% === Assume R1 = R3 = R4 and calculate R2 for each biquad ===
R1_1 = 5.84e3;    % assume value for R1, R3, R4
R3_1 = R1_1;
R4_1 = R1_1;
R2_1 = Q1 * R3_1 * C1 / sqrt(C1*C2);  % R2 from Q1

R1_2 = 5.84e3;    % assume value for R1, R3, R4
R3_2 = R1_2;
R4_2 = R1_2;
R2_2 = Q2 * R3_2 * C1 / sqrt(C1*C2);  % R2 from Q2

%% === Display Component Values ===
fprintf('--- Biquad 1 ---\n');
fprintf('R1 = R3 = R4 = %.2f kOhm, R2 = %.2f kOhm\n', R1_1/1e3, R2_1/1e3);
fprintf('C1 = C2 = %.2f pF\n', C1*1e12);

fprintf('--- Biquad 2 ---\n');
fprintf('R1 = R3 = R4 = %.2f kOhm, R2 = %.2f kOhm\n', R1_2/1e3, R2_2/1e3);
fprintf('C1 = C2 = %.2f pF\n', C1*1e12);

%% === Define Transfer Functions ===
num1 = [w0^2];
den1 = [1 w0/Q1 w0^2];
H1 = tf(num1, den1);

num2 = [w0^2];
den2 = [1 w0/Q2 w0^2];
H2 = tf(num2, den2);

%% Cascaded Filter
H_total = series(H1, H2);

%% === Display Transfer Functions ===
disp('H1(s) Transfer Function:'); H1
disp('H2(s) Transfer Function:'); H2
disp('H_total(s) Transfer Function:'); H_total

%% === Bode Plot (Separate Magnitude and Phase) ===
[mag, phase, w] = bode(H_total);  % Get data from transfer function
w = squeeze(w);                    % Angular frequency vector
mag = squeeze(mag);                % Magnitude (abs)
phase = squeeze(phase);            % Phase (deg)

freq = w / (2*pi);                 % Convert rad/s to Hz

%% --- Magnitude Plot ---
figure;
semilogx(freq, 20*log10(mag), 'b-', 'LineWidth', lw);
xlabel('Frequency (Hz)', 'FontSize', fsize, 'FontWeight', 'bold');
ylabel('Magnitude (dB)', 'FontSize', fsize, 'FontWeight', 'bold');
title('Magnitude Response', 'FontSize', fsize+2, 'FontWeight', 'bold');
grid on;
set(gca, 'FontSize', fsize, 'FontWeight', 'bold', 'LineWidth', 1.5, 'Color', [1 1 1]);  % white bg
datacursormode(gcf, 'on');

%% --- Phase Plot ---
figure;
semilogx(freq, phase, 'r-', 'LineWidth', lw);
xlabel('Frequency (Hz)', 'FontSize', fsize, 'FontWeight', 'bold');
ylabel('Phase (degrees)', 'FontSize', fsize, 'FontWeight', 'bold');
title('Phase Response', 'FontSize', fsize+2, 'FontWeight', 'bold');
grid on;
set(gca, 'FontSize', fsize, 'FontWeight', 'bold', 'LineWidth', 1.5, 'Color', [1 1 1]);  % white bg
datacursormode(gcf, 'on');

%% === Pole-Zero Plot ===
figure;
hPZ = pzplot(H_total);   % Use handle for styling
grid on;
title('Poles and Zeros of Cascaded Filter', 'FontSize', 16, 'FontWeight', 'bold');

% Set axis labels with larger font
xlabel('Real', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Imaginary', 'FontSize', 14, 'FontWeight', 'bold');

% Get all line objects in the plot
pz_lines = findall(gcf, 'Type', 'line');

% Increase marker size and line width
set(pz_lines, 'MarkerSize', 12, 'LineWidth', 2);

% Optional: color poles and zeros differently
for hline = pz_lines.'
    m = get(hline, 'Marker'); 
    if strcmp(m, 'x')         % pole
        set(hline, 'Color', [0.85,0,0]); % red
    elseif strcmp(m, 'o')     % zero
        set(hline, 'Color', [0,0,0.85]); % blue
    end
end

% Enable data cursor
datacursormode(gcf, 'on');

%% === Get and Print Poles and Zeros ===
[z_total, p_total, k_total] = tf2zpk(H_total.num{1}, H_total.den{1});

fprintf('\n--- Cascaded Filter Pole-Zero Data ---\n');
fprintf('Gain: %.4e\n', k_total);

fprintf('Zeros:\n');
for i = 1:length(z_total)
    fprintf('   %.2e + %.2ei\n', real(z_total(i)), imag(z_total(i)));
end

fprintf('Poles:\n');
for i = 1:length(p_total)
    fprintf('   %.2e + %.2ei\n', real(p_total(i)), imag(p_total(i)));
end
