%-------reading from images for training
imds=imageDatastore(strcat('C:\Users\Junaid Iqbal Khan\Documents\MATLAB\Final Year project\CNN_character\Data_for_character_classify\Image_data'),'IncludeSubFolders',true','LabelSource','foldernames');
imdsTrain= imds;

load alexnet; 
layers = alex.Layers;
layers(23) = fullyConnectedLayer(2); % change this based on # of classes
layers(25) = classificationLayer;

ilr = 0.0001;
mxEpochs = 60;
mbSize = 9;
opts = trainingOptions('sgdm', 'InitialLearnRate', ilr, ...
    'MaxEpochs',mxEpochs , 'MiniBatchSize',mbSize, ...
    'Plots', 'training-progress');

%imdsTrain.ReadFcn = @readFunctionTrain;
myNet = trainNetwork(imdsTrain, layers, opts);
