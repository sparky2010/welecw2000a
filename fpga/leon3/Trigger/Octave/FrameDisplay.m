%function [] = FrameDisplay(Frames);
% This script file showes how precise the trigger works
% Ideal triggered frames do not move!

clear all;

FileExsists = 1;
i = 1;
figure
hold on
for i = 1:42
    FileName = sprintf('../simTopTrigger/out%d.wav',i);
    Y = wavread(FileName);
    disp(sprintf('Samples per Channel: %d', length(Y)));
    if mod(i,3) == 0
      figure
      hold on
    end
%    subplot(1,1,1);
    plot(Y(:,1).*(2^8));
%    subplot(1,1,2);
%    plot(Y(:,2));
%    subplot(1,2,1);
%    plot(Y(:,3));
%    subplot(1,2,2);
%    plot(Y(:,4));
end
  
