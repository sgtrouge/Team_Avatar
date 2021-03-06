clear;
load('data.mat');
perm = randperm(830);
tsize = 200;
spmatrix = train_x(perm(1:tsize),:);
for i=1:tsize
    spmatrix(i,:) = spmatrix(i,:)/norm(spmatrix(i,:));
end;
trainCategory = train_t(perm(1:tsize));

trainsize = length(trainCategory);
trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);

% trainMatrix is now a (numTrainDocs x numTokens) matrix.
% Each row represents a unique document (email).
% The j-th column of the row $i$ represents the number of times the j-th
% token appeared in email $i$. 

% tokenlist is a long string containing the list of all tokens (words).
% These tokens are easily known by position in the file TOKENS_LIST

% trainCategory is a (1 x numTrainDocs) vector containing the true 
% classifications for the documents just read in. The i-th entry gives the 
% correct c50lass for the i-th email (which corresponds to the i-th row in 
% the document word matrix).

% Spam documents are50 indicated as class 1, and non-spam as class 0.
% Note that for the SVM, you would want to convert these to +1 and -1.


% YOUR CODE HERE
ratiocolor = zeros(6,1);

redmat = find(trainCategory==1)';
redratio = length(redmat)/ trainsize;
redsum = sum(sum(spmatrix(redmat,:)));
ratiocolor(1) = redratio;

greenmat = find(trainCategory==2)';
greenratio = length(greenmat)/ trainsize;
greensum = sum(sum(spmatrix(greenmat,:)));
ratiocolor(2) = greenratio;


whitemat = find(trainCategory==3)';
whiteratio = length(whitemat)/ trainsize;
whitesum = sum(sum(spmatrix(whitemat,:)));
ratiocolor(3) = whiteratio;

bluemat = find(trainCategory==4)';
blueratio = length(bluemat)/ trainsize;
bluesum = sum(sum(spmatrix(bluemat,:)));
ratiocolor(4) = blueratio;


yellowmat = find(trainCategory==5)';
yellowratio = length(yellowmat)/ trainsize;
yellowsum = sum(sum(spmatrix(yellowmat,:)));
ratiocolor(5) = yellowratio;


blackmat = find(trainCategory==6)';
blackratio = length(blackmat)/ trainsize;
blacksum = sum(sum(spmatrix(blackmat,:)));
ratiocolor(6) = blackratio;

trainsize = length(trainCategory);
colorratio = zeros(6,numTokens);
for i = 1:numTokens
    colorratio(1,i) =(sum(spmatrix(redmat,i))+1)/(redsum+numTokens);
    colorratio(2,i) =(sum(spmatrix(greenmat,i))+1)/(greensum+numTokens);
    colorratio(3,i) =(sum(spmatrix(whitemat,i))+1)/(whitesum+numTokens);
    colorratio(4,i) =(sum(spmatrix(bluemat,i))+1)/(bluesum+numTokens);
    colorratio(5,i) =(sum(spmatrix(yellowmat,i))+1)/(yellowsum+numTokens);
    colorratio(6,i) =(sum(spmatrix(blackmat,i))+1)/(blacksum+numTokens);
end;


