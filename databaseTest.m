n = length(songNameTable);

tic
incorrect=[];
for i = 1:n
    clip = songNameTable{i};
    songName=main(0,clip);
    if ~strcmp(songName,clip)
        incorrect = [incorrect i];
    end
end
time=toc;
fprintf('%d songs failed\n',length(incorrect))
fprintf('%f s run time\n',time)