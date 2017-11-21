function make_database(gs,deltaTL,deltaTU,deltaF) 
    files = what('songDatabase');
    matFiles = files.mat;
      
    database = [];
    for i = 1:length(matFiles)
        fileName = matFiles{i};
        songNameTable{i}=fileName;
        toRead = ['songDatabase/',fileName];
        songTable=make_table(toRead,gs,deltaTL,deltaTU,deltaF);
        database = [database;songTable,i*ones(length(songTable),1)]; 
    end
    
    hashTable = hash(database);
    
    save('hashTable.mat','hashTable','-mat');
    save('songNameTable.mat','songNameTable','-mat');