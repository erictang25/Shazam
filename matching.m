function songName = matching(testOption,clip,hashTable,songNameTable,gs,deltaTL,deltaTU,deltaF)
     
     % Load Song
     Fs = 8000; % MUST MATCH Fs OF make_database!!!
     originalSong = load(clip,'-mat');
     resampledSong = resample(originalSong.y,Fs,44100);
     
     d = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',10e3,'PassbandRipple',0.2, ...
         'SampleRate',45e3);
     t = filter(d,resampledSong(:,1));

    table=make_table(t,Fs,gs,deltaTL,deltaTU,deltaF);
    [nr,nc]=size(table); 
    table=[table,zeros(nr,1)];
    hashClip=hash(table);
    
    matchMatrix = [];
    for i = 1:length(hashClip)
        match=find(hashTable(:,1)-hashClip(i,1)==0);
        matchMatrix=[matchMatrix;hashTable(match,2)-hashClip(i,2),hashTable(match,3)];
    end
    
   x = mode(matchMatrix(:,1));
   songIndex = find(matchMatrix(:,1)==x);
   nameMatrix = matchMatrix(songIndex,2);
   songID = mode(nameMatrix);   
   songName = songNameTable{songID};
    
    
    