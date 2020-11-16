clc; clear;

play = 1;
%replay loop

while play == 1
 
 clear word;
 clear answer;

 %possible words
animals = {'cat','dog','aardvark','lizard','mouse','ostrich'...
 'python','armadillo','spider','tarantula','tiger','lion'...
 'hippo','koi','kangaroo','koala','monkey','penguin','bear','fox'};
transportation = {'car','suv','truck','van','sedan','plane','hovercraft'...
 'boat','cart','yahct','blimp','jet','scooter','bus','train'...
 'running','skates','bicycle','tractor','motorcycle'};
sports = {'tennis','cricket','baseball','basketball','spikeball'...
 'volleyball','golf','soccer','football','nascar','lacrosse'...
 'rugby','polo','croquet','bowling','pool','track','swimming'...
 'esports','badminton'};
cities = {'athens','rome','paris','london','tokyo','columbus'...
 'austin','denver','charelston','beijing','toronto','dublin'...
 'miami','cleveland','cincinnati','amsterdam','pheonix'...
 'dallas','detroit','philidelphia'};
 

x = rand(1);
if (x <= 0.25)
 category = animals;
elseif (x > 0.25 && x <= 0.5)
 category = transportation;
elseif (x > 0.5 && x <= 0.75)
 category = sports;
elseif (x > 0.75 && x <= 1)
 category = cities;
end

size = numel(category);
word = category(randperm(size,1));
%change word to string of characters

word = char(word);

%title screen
dash = '\';
fprintf('\n**********WELCOME*TO*HANGMAN**********\n')
fprintf(' ---------| \n')
fprintf(' | 0 \n')
fprintf(' | /|%s \n', dash)
fprintf(' | / %s \n', dash)
fprintf(' | By: Jack Glassmire, Deven Deickert, Sydney Schryer, \n')
fprintf('__|__ and Chamyukthan SampathKumar \n')
fprintf('\n')
fprintf('\nPlease only enter lowercase letters, press enter after selecting a letter')
fprintf('\n Good Luck!!')
len = length(word);

for i =1:len
 fprintf('\n');
 answer(i) = '-';
end

%displaying category
if (x <= 0.25)
 fprintf('Your category is Animals\n')
elseif (x > 0.25 && x <= 0.5)
 fprintf('Your category is Transportation\n')
elseif (x > 0.5 && x <= 0.75)
 fprintf('Your category is Sports\n')
elseif (x > 0.75 && x <= 1)
 fprintf('Your category is Cities\n')
end

fprintf('\n')
fprintf('\nYour word has %i letters!\n', len);
fprintf('%s\n', answer);
fprintf('\n');
%times till your out
strikes = 1;
%wrong tries
wrong1 = 1; wrong2 = 1; wrong3 = 1; wrong4 = 1; wrong5 = 1; wrong6 = 1;
%does user want to play again
play = 1;
%while loop for incorrect guesses

while strikes <= 6
 %asking for guess if you still have attempts left
 if strikes <= 6
 guess = input('\nGuess a Letter: ', 's');
 for i = 1:len
 if word(i) == guess
 answer(i) = guess;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5= 0; wrong6 = 0;
 end
 end
 %strike 1
 if (strikes == 1 && word(i) ~= guess && wrong1 ~= 0)
 fprintf(' ---------| \n')
 fprintf(' | 0 \n')
 fprintf(' | \n')
 fprintf(' | \n')
 fprintf(' | \n')
 fprintf('__|__ \n')
 strikes = strikes + 1;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5 = 0; wrong6 = 0;
 %strike 2
 elseif (strikes == 2 && word(i) ~= guess && wrong2 ~= 0)
 fprintf(' ---------| \n')
 fprintf(' | 0 \n')
 fprintf(' | | \n')
 fprintf(' | \n')
 fprintf(' | \n')
 fprintf('__|__ \n')
 strikes = strikes + 1;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5 = 0; wrong6 = 0;
 %strike 3
 elseif (strikes == 3 && word(i) ~= guess && wrong3 ~= 0)
 fprintf(' ---------| \n')
 fprintf(' | 0 \n')
 fprintf(' | /| \n')
 fprintf(' | \n')
 fprintf(' | \n')
 fprintf('__|__ \n')
 strikes = strikes + 1;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5 =0; wrong6 = 0;
 %strike 4
 elseif (strikes == 4 && word(i) ~= guess && wrong4 ~= 0)
 fprintf(' ---------| \n')
 fprintf(' | 0 \n')
 fprintf(' | /|%s \n', dash)
 fprintf(' | \n')
 fprintf(' | \n')
 fprintf('__|__ \n')
 strikes = strikes + 1;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5 = 0; wrong6 = 0;
 %strie 5
 elseif (strikes == 5 && word(i) ~= guess && wrong5 ~= 0)
 fprintf(' ---------| \n')
 fprintf(' | 0 \n')
 fprintf(' | /|%s \n', dash)
 fprintf(' | / \n', dash)
 fprintf(' | \n')
 fprintf('__|__ \n')
 strikes = strikes + 1;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5 = 0; wrong6 = 0;
 %strike 6
 elseif (strikes == 6 && word(i) ~= guess && wrong6 ~= 0)
 fprintf(' ---------| \n')
 fprintf(' | 0 \n')
 fprintf(' | /|%s \n', dash)
 fprintf(' | / %s \n', dash)
 fprintf(' | \n')
 fprintf('__|__ \n')
 fprintf('\n**********You Died**********\n')
 fprintf('Your word was: %s', word)
 strikes = strikes + 1;
 wrong1 = 0; wrong2 = 0; wrong3 = 0; wrong4 = 0; wrong5 = 0; wrong6 = 0;
 end
 wrong1 = 1; wrong2 = 1; wrong3 = 1; wrong4 = 1; wrong5 = 1; wrong6 = 1;
 
 if answer == word
 play = 0;
 fprintf('\nYoure Right!!\n')
 strikes = 7;
 end
 fprintf('\n%s\n', answer);
end
end
%prompt to play again

play = input('\nIf you want to play again press 1 if not press 0,thank you\n');
end