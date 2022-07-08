local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

FrecventeBlocate = {
    [111] = {faction = "Smurd"},
    [112] = {faction = "Politie"},
    [200] = {faction = "Los Corleone's"},
    [201] = {faction = "Mafia Corleone"},
    [202] = {faction = "Los Vagos"},
    [203] = {faction = "Ballas"},
    [204] = {faction = "Grove Street"},
    [205] = {faction = "La Famillia"},
    [206] = {faction = "Mafia Sinaloa"},
    [207] = {faction = "Crips"},
    [208] = {faction = "Mafia Siciliana"},
    [209] = {faction = "Mafia Corleone"},
    [210] = {faction = "Clanul HUF"},
    [420] = {faction = "Sindicat"},
}

radio.RegisterServerCallback('qb-radio:haveAccesOnChannel', function(source, cb, channel)
    local _src = source
    local user_id = vRP.getUserId({_src})
    local player = vRP.getUserSource({user_id}) 
    local faction = vRP
    if user_id ~= nil then
        if FrecventeBlocate[channel] == nil then 
            cb(true)
        else
            if vRP.getUserFaction({user_id}) == FrecventeBlocate[channel].faction then
                cb(true)
            else
                cb(false)
            end
        end
    else
        cb(false)
    end
end)