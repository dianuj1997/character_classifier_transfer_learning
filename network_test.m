load character_classifier
weight=15;
T=readtable('tanveer_16kg.csv');
T1=table2array(T(:,1));
XTest=T1;
Fs=256;
fb= cwtfilterbank('SignalLength',length(XTest),'SamplingFrequency',Fs);
myNet=character_classifier;
siggy=XTest;
fig = figure;
set(fig,'visible','off')
cwt(siggy,'FilterBank',fb)
title('Magnitude Scalogram of sample signal')
drawnow
frame = getframe(fig);
im= frame2im(frame);
im= imresize(im,[227 227]);
imwrite(im,'signal_scalogram.jpg');



imdstest=imread('signal_scalogram.jpg');
[YPred,probs] =classify(myNet,imdstest);
%accuracy = mean(YPred == imdstest.Labels)
%rpe=RPE(probs(1,2));
%prog=progress(probs(1,1),rpe);
%testingee
probs2=100*probs(1,1);
idx=[1,2,3];
imtest=imread('signal_scalogram.jpg');
myicon = imtest;
S1="Advanced: "+ num2str(100*max(probs(1,1)),3) + "% ,";
S2="Beginner: "+ ", " + num2str(100*max(probs(1,2)),3) + "% ,";
%S3="Pace is "+ num2str(100*max(probs(1,3)),3) + "% with in normal range and ";
%S4="RPE is "+ num2str(rpe);
%S5=" Current progress is "+ num2str(prog)+ "% for "+ num2str(weight) + "kg";
%h=msgbox(join([S1,S2]),'Some Advanced at 15kg','custom',myicon);
%figure
%plot(XTest);