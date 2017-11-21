function songName = main(testOption,clipName,hashTable,songNameTable)
    gs=9;
    deltaTL=3;
    deltaTU=6;
    deltaF=9;
    
    %make_database(gs,deltaTL,deltaTU,deltaF);
    %hashTable=hash(database);
    
    songName = matching(testOption,clipName,hashTable,songNameTable,gs,deltaTL,deltaTU,deltaF);