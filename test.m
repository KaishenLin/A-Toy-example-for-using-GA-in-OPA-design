freq = 100e6;                     
c = physconst('LightSpeed');       
lam = c / freq;                    
K = 2 * pi / lam;   

position = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]; 
norPos = ones(1,100);
% %54
% bestPos1 = [1	0	1	1	0	0	0	1	1	0	1	1	0	1	0	1	1	0	1	1	0	0	1	0	0	0	0	1	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	1	1	0	0	1	1	0	1	1	1	0	1	0	1	0	1	0	1	0	1	0	0	0	0	0	1	1	0	0	1	1	0	1	1	0	0	0	0	1	0	1	0	0	0	1	1	0	1	0	0	0	1	1	0	0	1];
% %52
% bestPos2 = [0	0	1	0	1	0	1	0	0	1	0	0	1	0	1	1	0	1	1	1	0	0	1	0	0	1	1	0	1	1	1	1	1	0	1	0	0	1	1	0	1	1	1	0	0	0	1	1	1	0	0	1	0	0	1	1	0	1	1	0	1	0	1	1	1	1	1	0	1	1	0	0	1	1	1	0	1	0	1	0	0	0	0	1	0	1	0	0	0	0	1	1	0	0	0	0	1	1	0	1];

%232
bestPos1 = [0	1	0	0	0	1	1	0	0	0	1	0	0	0	1	0	1	0	1	0	0	1	1	0	0	0	1	1	1	1	0	1	0	1	1	1	1	0	0	1	1	0	0	0	0	0	1	0	0	0	1	0	0	1	1	1	0	1	1	1	0	0	0	1	1	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	1	1	0	1	0	0	0	0	0	1	0	1	1	0	0	0	0	1	1	0	1	0	1	1	1	1	0	0	0	0	0	1	1	1	1	0	1	0	0	1	0	0	0	0	0	0	1	0	0	0	1	1	1	1	0	1	0	0	0	0	0	0	0	1	1	1	0	1	0	1	1	0	0	1	1	1	1	0	1	0	1	0	1	1	0	0	0	1	1	1	0	0	0	0	1	1	0	1	1	1	0	1	1	1	1	1	0	0	1	0	0	0	0	1	0	1	1	1	0	0	0	1	0	1	1	1	1	1	0	1	0	0	0	0	0	0	0	0	1	0	1	1	1	1	0	0	1	0	0	1	1	1	0	1	0	1	0	0	0	1	1	0	1	0	1	1	1	1	1	0	1	0	1	1	0	0	1	1	0	1	1	0	1	1	1	1	0	1	0	1	1	1	0	1	0	0	0	1	0	0	1	1	1	0	1	0	0	1	1	1	0	1	0	0	0	1	1	1	0	1	0	0	0	0	1	0	0	1	1	1	1	1	0	1	1	1	0	0	1	1	0	0	1	0	1	1	1	1	1	1	0	0	1	0	0	1	1	0	0	1	1	1	0	0	0	0	0	0	1	0	0	0	1	0	0	1	0	0	0	0	1	1	1	1	0	0	0	0	1	1	1	1	1	0	1	0	1	0	1	1	1	0	0	1	1	1	0	0	1	1	0	0	0	1	1	0	0	1	1	1	0	0	0	0	0	0	1	0	0	0	1	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	1	1	0	1	0	1	0	1	1	1	0	0	1	0	0	0	1	0	0	0	0	0	1	1	0	0	1	1	1	1	0	1	0	1	1	1	1	0	0	0	1	1	0	0	1	0	1	0	1	0	0	0	1	1	1	0	0	0	1	1	1	0	0	0	0	1	0	1];
%231
bestPos2 = [1	0	1	0	1	0	0	0	1	0	0	0	0	1	0	0	0	0	1	0	1	1	0	0	0	1	0	0	1	0	0	1	0	1	1	0	0	0	1	1	1	0	0	0	0	0	1	0	1	0	0	0	0	0	0	0	1	0	0	0	1	0	1	0	0	0	1	1	1	0	0	1	0	0	1	1	1	0	1	0	1	0	1	0	0	0	1	1	0	1	1	1	1	1	0	1	0	1	0	0	0	1	1	0	1	0	0	1	1	1	0	1	1	0	0	0	0	1	0	0	0	1	1	0	0	1	1	0	1	0	1	0	0	0	1	0	0	0	0	0	0	0	1	0	1	0	0	0	0	1	0	1	0	1	1	1	0	1	1	1	0	0	1	1	0	0	0	1	0	0	0	0	1	1	0	1	1	1	0	0	1	0	1	1	0	0	0	1	0	1	0	1	1	1	1	1	0	1	1	0	0	0	1	0	1	0	1	0	1	1	1	0	1	1	0	1	1	1	1	0	1	0	0	0	1	0	0	1	1	1	1	1	0	0	1	0	0	0	0	1	0	1	1	1	0	0	1	1	0	1	0	1	1	0	0	1	0	1	1	1	0	1	1	0	1	1	1	1	0	1	0	1	0	0	0	1	0	1	1	1	0	0	1	1	0	1	0	0	1	1	1	1	1	1	1	0	0	0	1	0	0	1	1	1	1	1	1	1	0	0	1	1	0	1	1	1	0	1	0	0	0	1	0	1	0	0	0	1	0	1	1	0	0	1	1	1	0	1	0	1	1	1	1	0	0	1	1	0	1	0	0	0	0	0	1	0	1	1	1	1	0	0	1	0	0	0	1	1	0	0	1	0	1	0	1	1	1	1	1	1	0	0	1	0	0	1	1	1	0	0	0	1	0	1	0	0	0	1	0	0	0	0	0	0	0	1	0	1	0	0	0	0	0	1	1	1	0	0	0	1	1	0	1	0	0	1	0	0	1	0	0	0	1	1	0	1	0	0	0	0	1	0	0	0	0	1	0	0	0	1	0	0	1	0	1	0	0	1	0	0	1	0	0	0	1	1	0	1	0	0	0	1	0	0	1	1	0	1	1	0	1	0	0	0	1	1	1	1	0	1	0	1	1	0	0	0	0	1	0	0];

ang_left = -15;                   
ang_right = 15;                    
L = 10000;                        
st_ang = 0;                       % steering angle
space = 1/2*lam;
%[theta, AF_dB0] = AF_grid(position, ang_left, ang_right, L, K, st_ang,space);
% [theta, AF_dB1] = AF_grid(norPos, ang_left, ang_right, L, K, st_ang,space);
[theta, AF_dB21] = AF_grid(bestPos1, ang_left, ang_right, L, K, st_ang,space);
[theta, AF_dB22] = AF_grid(bestPos2, ang_left, ang_right, L, K, st_ang,space);



% figure;
% plot(theta, AF_dB1, 'LineWidth', 1.5);
% grid on;
% xlabel('Angle (degrees)');
% ylabel('Array Factor (dB)');
% title(['Array Pattern (Steering Angle = ', num2str(st_ang), '°)']);
% xlim([ang_left, ang_right]);
% ylim([-50, 0.5]); 
% psl1 = PSLL(AF_dB1);
%disp(psl1);

figure;
plot(theta, AF_dB21, 'LineWidth', 1.5);
grid on;
xlabel('Angle (degrees)');
ylabel('Array Factor (dB)');
title(['Array Pattern (Steering Angle = ', num2str(st_ang), '°)']);
xlim([ang_left, ang_right]);
ylim([-50, 0.5]); 
psl21 = PSLL(AF_dB21);
disp(psl21);

figure;
plot(theta, AF_dB22, 'LineWidth', 1.5);
grid on;
xlabel('Angle (degrees)');
ylabel('Array Factor (dB)');
title(['Array Pattern (Steering Angle = ', num2str(st_ang), '°)']);
xlim([ang_left, ang_right]);
ylim([-50, 0.5]); 
psl22 = PSLL(AF_dB22);
disp(psl22);

% figure;
% plot(theta, AF_dB0, 'LineWidth', 1.5);
% grid on;
% xlabel('Angle (degrees)');
% ylabel('Array Factor (dB)');
% title(['Array Pattern (Steering Angle = ', num2str(st_ang), '°)']);
% xlim([ang_left, ang_right]);
% ylim([-50, 0.5]); 
%psl0 = PSLL(AF_dB0);





