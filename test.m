     Fs = 8000;
     originalSong = load('sample','-mat');
     resampledSong = resample(originalSong.y,Fs,44100);
     
     window = (64e-3)*Fs;
     noverlap = (32e-3)*Fs;
     nfft = (64e-3)*Fs;
     
     [S,F,T] = spectrogram(resampledSong(:,1),window,noverlap,nfft,Fs);
     
     log_S = log10(abs(S)+1);
     [nr,nc]=size(log_S);
     localPeak = 80*ones(nr,nc);      
     
     for r = -4:4 
         for c = -4:4
                CS = circshift(log_S,[r c]);
                localPeak = localPeak - ((log_S-CS)>0);
         end
     end
     localPeak = (localPeak == 0);
     
     len = T(end);
     peaks = localPeak.*log_S;
     peaks = peaks(:);
     [maxPeaks ind] = sort(peaks);
     maxPeaks(1:(end-30*len))=0;
     peaks(ind)=maxPeaks(1:end);
     localPeak = reshape(peaks,[nr,nc]);
     
     table = [];
     [pR,pC] = find(localPeak);
     for i = 1:length(pR)
          if pC(i)+3<=nc
            [pairsR,pairsC] = find(localPeak(max(1,pR(i)-9):min(pR(i)+9,nr),...
                min(pC(i)+3,nc):min(pC(i)+6,nc)));
            pairsR = pairsR+max(1,pR(i)-9)-1;
            pairsC = pairsC+min(pC(i)+3,nc)-1;
            j=1;
            while j <= 3 && j <= length(pairsR)
                table = [table;pR(i),pairsR(j),pC(i),pairsC(j)-pC(i)];
                j=j+1;
            end
          end
     end
     
     figure
     imagesc(T,F,20*log10(abs(S)))
     axis xy
     xlabel('Time (s)')
     ylabel('Frequency (Hz)')
     title('Spectrogram')

     colormap jet
     c= colorbar;
     set(c)
     ylabel(c,'Power (dB)','FontSize',14) 
