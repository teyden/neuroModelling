% function [tauh, hinf] = hdyn(V) calculates voltage-sensitive dynamic
% parameters for the Hodgkin-Huxley K+ channel gating variable h. 
% 
% V: membrane potential (mV)
% tauh: time constant (ms)
% hinf: asymptotic value
function [ tauh, hinf ] = hdyn(V)
    alphah = .07*exp(-.05*(V+65));
    alphah(isnan(alphah)) = .1;
    betah = 1 ./ (1+exp(-.1*(V+35)));
    hinf = alphah ./ (alphah+betah);
    tauh = 1 ./ (alphah+betah);

end




