% Change the exclusionIdx accordign to different requirements.
% PSLL = 20*log10(R_main/R_peaksidelobe) = 10*log10(I_main/I_peaksidelobe)

% function Psll = PSLL(AF_dB)
% [value, loc] = findpeaks(AF_dB,'SortStr','descend');
%  Psll = value(1) - value(2);
% end

function Psll = PSLL(AF_dB, theta)

    [mainVal, mainIdx] = max(AF_dB);
    theta_main = theta(mainIdx);

    exclusionIdx = (theta >= (theta_main - 0.5)) & (theta <= (theta_main + 0.5));
    AF_dB_temp = AF_dB;
    AF_dB_temp(exclusionIdx) = -Inf;


    % sidePeaks = findpeaks(AF_dB_temp,'SortStr','descend');
    % sideLobeVal = max(sidePeaks);
    sideLobeVal = max(AF_dB_temp);

    Psll = mainVal - sideLobeVal;
end



% function Psll = PSLL(AF_dB, theta)
% 
%     [value, mainIdx] = findpeaks(AF_dB, 'SortStr', 'descend');
%     mainVal = value(1);
% 
%     threshold = mainVal - 3;
%     exclusionIdx = AF_dB >= threshold;
%     AF_dB_temp = AF_dB;
%     AF_dB_temp(exclusionIdx) = -Inf;
% 
%     % 计算旁瓣
%     sidePeaks = findpeaks(AF_dB_temp, 'SortStr', 'descend');
% 
%     sideLobeVal = max(sidePeaks);
% 
%     % 计算PSLL
%     Psll = mainVal - sideLobeVal;
% end
