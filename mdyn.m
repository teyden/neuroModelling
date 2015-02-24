% function [taum, minf] = mdyn(V) calculates voltage-sensitive dynamic
% parameters for the Hodgkin-Huxley K+ channel gating variable m. 
% 
% V: membrane potential (mV)
% taum: time constant (ms)
% minf: asymptotic value
function [ taum, minf ] = mdyn(V)
    alpham = .1*(V+40) ./ (1 - exp(-.1*(V+40)));
    alpham(isnan(alpham)) = 1;
    betam = 4 .* exp(-.0556*(V+65));
    minf = alpham ./ (alpham+betam);
    taum = 1 ./ (alpham+betam);
end




