function make_database(gs,deltaTL,deltaTU,deltaF) 
    files = what('songDatabase');
    matFiles = files.mat;
    
    Fs = 8000; % Sample Frequency
    
    database = [];
    for i = 1:length(matFiles)
        fileName = matFiles{i};
        songNameTable{i}=fileName;
        toRead = ['songDatabase/',fileName];
        originalSong = load(toRead,'-mat');
        resampledSong = resample(originalSong.y,Fs,44100);
        songTable=make_table(resampledSong(:,1),Fs,gs,deltaTL,deltaTU,deltaF);
        database = [database;songTable,i*ones(length(songTable),1)]; 
    end
    
    hashTable = hash(database);
    
    save('hashTable.mat','hashTable','-mat');
    save('songNameTable.mat','songNameTable','-mat');