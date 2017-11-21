function songName = matching(testOption,clip,hashTable,songNameTable,gs,deltaTL,deltaTU,deltaF)
    
    table=make_table(clip,gs,deltaTL,deltaTU,deltaF);
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
   songID = mode(nameMatrix(1:min(30,length(nameMatrix))));   
   songName = songNameTable{songID};
    
    
    