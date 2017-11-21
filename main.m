function songName = main(testOption,clipName)
    gs=9;
    deltaTL=3;
    deltaTU=6;
    deltaF=9;
    
    hashTable=load('hashTable.mat');
    songNameTable=load('songNameTable.mat');
    
    songName = matching(testOption,clipName,hashTable.hashTable,songNameTable.songNameTable,gs,deltaTL,deltaTU,deltaF);