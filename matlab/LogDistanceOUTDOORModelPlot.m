function LogDistanceOUTDOORModelPlot()
X = 1:1:1000;
LDOUTDOOR2 = zeros(1, length(X));
LDOUTDOOR3 = zeros(1, length(X));
LDOUTDOOR4 = zeros(1, length(X));
for i=1:length(X)
% reminder on cell size:
%   -macrocells: n from 2 to 4
%   -microcells: n from 1.6 to 8
% cellSize can be macrocells (=0) or microcells (any other value)
    [LDOUTDOOR2(1, i)] = LogDistanceOUTDOORModel(X(i), 2400, 2, 0);
    [LDOUTDOOR3(1, i)] = LogDistanceOUTDOORModel(X(i), 2400, 3, 0);
    [LDOUTDOOR4(1, i)] = LogDistanceOUTDOORModel(X(i), 2400, 4, 0);
end
figure;
plot(X,LDOUTDOOR2, X,LDOUTDOOR3, X,LDOUTDOOR4);
grid on;
title("Log Distance Model (OUTDOOR) Path Loss (f = 2.4GHz, macrocells)");
xlabel("distnace (m)");
ylabel("Path Loss (dB)");
legend("n = 2", "n = 3", "n = 4");
figure;
semilogx(X,LDOUTDOOR2, X,LDOUTDOOR3, X,LDOUTDOOR4);
grid on;
title("Log Distance Model (OUTDOOR) Path Loss (f = 2.4GHz, macrocells)");
xlabel("distnace (m)");
ylabel("Path Loss (dB)");
legend("n = 2", "n = 3", "n = 4");