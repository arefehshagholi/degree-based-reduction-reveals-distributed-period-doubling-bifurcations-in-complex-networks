function [Amat,Xmat] = extract_peaks(X,w,Amat,Xmat)
N = size(X,2);
for i = 1:N
    peaks = findpeaks(X(:,i));
    Amat{i} = [Amat{i}; w*ones(length(peaks),1)];
    Xmat{i} = [Xmat{i}; peaks];
end
end
