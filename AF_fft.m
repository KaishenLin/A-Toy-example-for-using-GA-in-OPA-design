% clc;
% clear all;
% close;

% freq = 100e6;                     
% c = physconst('LightSpeed');       
% lam = c / freq;                    
% K = 2 * pi / lam;                  
% ang_left = -15;                   
% ang_right = 15;                    
% L = 10000;                         
% st_ang = 0;                    % steering angle
% space = 1/2 * lam;             % 注意1/2 lambda的界限
% % 参数定义  % 阵列单元数
% position = [0	1	0	0	0	1	1	0	0	0	1	0	0	0	1	0	1	0	1	0	0	1	1	0	0	0	1	1	1	1	0	1	0	1	1	1	1	0	0	1	1	0	0	0	0	0	1	0	0	0	1	0	0	1	1	1	0	1	1	1	0	0	0	1	1	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	1	1	0	1	0	0	0	0	0	1	0	1	1	0	0	0	0	1	1	0	1	0	1	1	1	1	0	0	0	0	0	1	1	1	1	0	1	0	0	1	0	0	0	0	0	0	1	0	0	0	1	1	1	1	0	1	0	0	0	0	0	0	0	1	1	1	0	1	0	1	1	0	0	1	1	1	1	0	1	0	1	0	1	1	0	0	0	1	1	1	0	0	0	0	1	1	0	1	1	1	0	1	1	1	1	1	0	0	1	0	0	0	0	1	0	1	1	1	0	0	0	1	0	1	1	1	1	1	0	1	0	0	0	0	0	0	0	0	1	0	1	1	1	1	0	0	1	0	0	1	1	1	0	1	0	1	0	0	0	1	1	0	1	0	1	1	1	1	1	0	1	0	1	1	0	0	1	1	0	1	1	0	1	1	1	1	0	1	0	1	1	1	0	1	0	0	0	1	0	0	1	1	1	0	1	0	0	1	1	1	0	1	0	0	0	1	1	1	0	1	0	0	0	0	1	0	0	1	1	1	1	1	0	1	1	1	0	0	1	1	0	0	1	0	1	1	1	1	1	1	0	0	1	0	0	1	1	0	0	1	1	1	0	0	0	0	0	0	1	0	0	0	1	0	0	1	0	0	0	0	1	1	1	1	0	0	0	0	1	1	1	1	1	0	1	0	1	0	1	1	1	0	0	1	1	1	0	0	1	1	0	0	0	1	1	0	0	1	1	1	0	0	0	0	0	0	1	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	0	1	0	1	0	1	1	1	0	0	1	0	0	0	1	0	0	0	0	0	1	1	0	0	1	1	1	1	0	1	0	1	1	1	1	0	0	0	1	1	0	0	1	0	1	0	1	0	0	0	1	1	1	0	0	0	1	1	1	0	0	0	0	1	0	1];
% 
% 
% % 调用传统方法计算方向图
% [theta1, AF_dB_grid] = AF_grid(position, ang_left, ang_right, L, K, st_ang, space);
% 
% % 调用 FFT 方法计算方向图
% [theta2, AF_dB_fft] = AF_fft(position, ang_left, ang_right, L, K, st_ang, space);
% 
% % 绘制对比图
% figure;
% plot(theta1, AF_dB_grid, 'r', 'LineWidth', 1.5); 
% figure;
% plot(theta2, AF_dB_fft, 'b', 'LineWidth', 1.5);
% legend('传统计算', 'FFT 计算');
% xlabel('\theta (°)');
% ylabel('|AF(\theta)| (dB)');
% xlim([ang_left, ang_right]);
% ylim([-50, 0.5]);
% title('方向图对比');
% disp(PSLL(AF_dB_fft))
% disp(PSLL(AF_dB_grid))
% grid on;


function [theta, AF_dB] = AF_fft(position, ang_left, ang_right, L, K, st_ang, space)
    w = position;
    N = length(position);
    num = nnz(position);
    theta = linspace(ang_left, ang_right, L);  
    theta = theta(:);  
    % Zero-padding: pad FFT to improve interpolation accuracy
    M = 2^nextpow2(10 * N);  % 10 times zero padding
    W_fft = fft(w, M);       
    W_fft = fftshift(W_fft); % Shift zero frequency to center
    omega_axis = (-M/2:M/2-1) * (2*pi/M); % Create normalized frequency axis
    Omega_theta = K * space * (sind(theta) - sind(st_ang));  
    AF_value = interp1(omega_axis, W_fft, -Omega_theta, 'pchip', 0); % Interpolate FFT values at target frequencies using piecewise cubic interpolation
    AF_dB = 20 * log10(abs(AF_value) ./ num);
end




        


