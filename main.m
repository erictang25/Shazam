function songName = main(testOption,clipName)
 
    gs=9;
    deltaTL=3;
    deltaTU=6;
    deltaF=9;
        
    hashTable=load('hashTable.mat');
    songNameTable=load('songNameTable.mat');
    
    if testOption == 2
        Fs=8000;
        bitsPerSample=8;
        channel=1;
        recordTime=15;
        
        recorder = audiorecorder(Fs,bitsPerSample,channel); % Declare recorder variable with some defined properties
        recordblocking(recorder,recordTime);                % Record audio for the amount of "recordTime"
        clipName = getaudiodata(recorder);                  % Getting the audio date recorded by the variable "recorder"
        songName = matching(testOption,clipName,hashTable.hashTable,songNameTable.songNameTable,gs,deltaTL,deltaTU,deltaF);
    else
        songName = matching(testOption,clipName,hashTable.hashTable,songNameTable.songNameTable,gs,deltaTL,deltaTU,deltaF);
    end
    