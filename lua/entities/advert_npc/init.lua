--[[-------------------------------------------------------------------------
Script by Valfunde
If you have any problems, don't hesitate to contact me or add me on steam (Valfunde *Banna Army) but write a comment before adding me
If you try to edit something wich isn't in configuration file and the script doesn't work, it's you fault so don't come cry and tell script is broken.
---------------------------------------------------------------------------]]

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

--[[-------------------------------------------------------------------------
Basic functions
---------------------------------------------------------------------------]]
function ENT:SpawnFunction(ply, tr, classname)
	if !tr.Hit then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create(classname)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:Initialize()
	self:SetModel(Valfunde.NPCModel)
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
end

function ENT:OnTakeDamage()
	return false
end

util.AddNetworkString("AdValfunde")

function ENT:AcceptInput(event, act, ply, data)
    if event == "Use" and IsValid(ply) and ply:IsPlayer() then
            net.Start("AdValfunde")
            net.Send(ply)
    end
end
--[[-------------------------------------------------------------------------
End of basic functions
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Advert functions
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Check if timer exist to delete it when player disconnect
---------------------------------------------------------------------------]]
hook.Add("PlayerDisconnected", "badumtsss", function(ply)
    if timer.Exists(ply:SteamID64().."timer1") then timer.Remove(ply:SteamID64().."timer1") end
    if timer.Exists(ply:SteamID64().."timer2") then timer.Remove(ply:SteamID64().."timer2") end
end)

--[[-------------------------------------------------------------------------
Functions to send advert
---------------------------------------------------------------------------]]
util.AddNetworkString("buyadvert")
net.Receive( "buyadvert" , function ( len , ply )
    local number = net.ReadUInt(4)
    local text = net.ReadString()
    local col = team.GetColor(ply:Team())

    if text == "" then

        DarkRP.notify(ply,1,6, Valfunde.FailNotifyPurchase.." !")

        return
    end



    if number == 1 then
        ply:addMoney(- Valfunde.AdvertPrice[number])
        DarkRP.notify(ply,0,6, Valfunde.SuccesNotifyPurchase.." "..GAMEMODE.Config.currency..Valfunde.AdvertPrice[number].." !")
        for k,v in pairs(player.GetAll()) do
            DarkRP.talkToPerson(v, col, Valfunde.AdvertText .. " " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
        end
    elseif number == 2 then
        ply:addMoney(- Valfunde.AdvertPrice[number])
        DarkRP.notify(ply,0,6, Valfunde.SuccesNotifyPurchase.." "..GAMEMODE.Config.currency..Valfunde.AdvertPrice[number].." !")
		for k,v in pairs(player.GetAll()) do
			DarkRP.talkToPerson(v, col, Valfunde.AdvertText .. " " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
		end
		timer.Create(ply:SteamID64().."timer1", Valfunde.TimerDelay[1], Valfunde.TimerRepetition[1], function()
			for k,v in pairs(player.GetAll()) do
				DarkRP.talkToPerson(v, col, Valfunde.AdvertText .. " " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
	    	end
		end)
    elseif number == 3 then
        ply:addMoney(- Valfunde.AdvertPrice[number])
        DarkRP.notify(ply,0,6, Valfunde.SuccesNotifyPurchase.." "..GAMEMODE.Config.currency..Valfunde.AdvertPrice[number].." !")
        for k,v in pairs(player.GetAll()) do
            DarkRP.talkToPerson(v, col, Valfunde.AdvertText .. " " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
        end
		timer.Create(ply:SteamID64().."timer2", Valfunde.TimerDelay[2], Valfunde.TimerRepetition[2], function()
			for k,v in pairs(player.GetAll()) do
	            DarkRP.talkToPerson(v, col, Valfunde.AdvertText .. " " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
	        end
		end)
    elseif number == 4 then
        ply:addMoney( -Valfunde.AdvertPrice[number])
        DarkRP.notify(ply,0,6, Valfunde.SuccesNotifyPurchase.." "..GAMEMODE.Config.currency..Valfunde.AdvertPrice[number].." !")
        DarkRP.log(ply:Name().." ".."says anonymously".." : "..text,Color(255,255,255,255))
        for k,v in pairs(player.GetAll()) do
            DarkRP.talkToPerson(v, Color(204,18,21,255), Valfunde.Anonymous, Color(255, 255, 0, 255), text, ply)
        end
    end
end)
--[[-------------------------------------------------------------------------
End of advert functions
---------------------------------------------------------------------------]]
