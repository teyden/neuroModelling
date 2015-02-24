% function [taun, ninf] = ndyn(V) calculates voltage-sensitive dynamic
% parameters for the Hodgkin-Huxley K+ channel gating variable n. 
% 
% V: membrane potential (mV)
% taun: time constant (ms)
% ninf: asymptotic value
function [taun, ninf] = ndyn(V) 
    alphan = .01*(V+55) ./ (1 - exp(-.1*(V+55)));
    alphan(isnan(alphan)) = .1;
    betan = .125*exp(-.0125*(V+65));
    ninf = alphan ./ (alphan+betan);
    taun = 1 ./ (alphan+betan);
end

