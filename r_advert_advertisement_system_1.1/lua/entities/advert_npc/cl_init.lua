--[[-------------------------------------------------------------------------
Script by Valfunde
If you have any problems, don't hesitate to leave a ScriptFodder ticket and/or add me on steam (Valfunde *Banna Army)
If you try to edit something wich isn't in configuration file and the script doesn't work, it's you fault so don't come cry and tell script is broken.
---------------------------------------------------------------------------]]

include('shared.lua')
--[[-------------------------------------------------------------------------
Custom Fonts
---------------------------------------------------------------------------]]
surface.CreateFont("ValfundeAS",{
    font = "Default",
    size = 18,
    bold = true,
    underline = true,
    italic = false,
})
surface.CreateFont("ValfundeAS1",{
    font = "Arial",
    size = 18,
    weight = 750,
})
surface.CreateFont("ValfundeAS2",{
    font = "Default",
    size = 24,
    underline = true,
    italic = false,
    bold = true,
})
--[[-------------------------------------------------------------------------
Starting functions
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Main window
---------------------------------------------------------------------------]]
function TheSimpleAdvert()

    local frame = vgui.Create("DFrame")
    frame:SetSize(800, 555)
    frame:SetDraggable(true)
    frame:Center()
    frame:SetTitle("")
    frame:MakePopup()
    frame:ShowCloseButton(false)
    frame.Paint = function( self )
        Derma_DrawBackgroundBlur( self, 1 )
        draw.RoundedBox(0, 0, 0, 1100, 27.5, Valfunde.SecondaryColor)
        draw.RoundedBox( 0, 0, 27.5, 1100, 572.5, Valfunde.PrimaryColor)
        draw.SimpleText(Valfunde.MainText, "ValfundeAS2", 400, 75, Valfunde.PrimaryButtonColor, TEXT_ALIGN_CENTER)
    end

    local closebutton = vgui.Create("DButton", frame)
    closebutton:SetPos(773.5)
    closebutton:SetText("Х")
    closebutton:SetFont("ValfundeAS1")
    closebutton:SetSize(27.5,27.5)
    closebutton:SetTextColor(Valfunde.TextButtonColor)
    closebutton.Paint = function(s , w , h)
        draw.RoundedBox(0, 0, 0, w, h, Valfunde.PrimaryButtonColor)
    end
    closebutton.DoClick = function ( self )
        frame:Close(true)
    end

    local buttonlist = vgui.Create ("DPanelList", frame)
    buttonlist:SetSize(600,555 - 80)
    buttonlist:SetPos(100,150)
    buttonlist:SetPadding(1)
    buttonlist:SetSpacing(45)
    buttonlist:SetVerticalScrollbarEnabled( true )

    local function AddButton(price, text, idbutton)

        local hV = false

        local buttonone = vgui.Create("DButton", frame)
        buttonone:SetText(text)
        buttonone:SetSize(600, 55.5)
        buttonone:SetFont("ValfundeAS1")
        buttonone:SetPos(100, 150)
        buttonone.OnCursorEntered = function() hV = true end
        buttonone.OnCursorExited = function() hV = false end
        if LocalPlayer():getDarkRPVar("money") < price or Valfunde.SetDisableButton[idbutton] then
            buttonone:SetDisabled(true)
            buttonone:SetTextColor(Valfunde.SecondaryButtonColor)
            buttonone.Paint = function (s,w,h)
                draw.RoundedBox(0, 0, 0, w, 42.5, Valfunde.SecondaryColor)
                draw.RoundedBox(0, 0, 7.5, w, h, Valfunde.SecondaryColor)
                draw.RoundedBox(0, 525, 0, 550, h, Valfunde.SecondaryButtonColor)
                draw.SimpleText(GAMEMODE.Config.currency .. price,"ValfundeAS2",585,12.5, Valfunde.TextButtonColorOnDisable, TEXT_ALIGN_RIGHT)
            end
        else
            buttonone:SetDisabled(false)
            buttonone:SetTextColor(Valfunde.TextButtonColor)
            buttonone.Paint = function(s , w , h)
                draw.RoundedBox(0, 0, 0, w, 42.5, Valfunde.SecondaryButtonColor)
                draw.RoundedBox(0, 0, 7.5, w, h, Valfunde.PrimaryButtonColor)
                draw.RoundedBox(0, 525, 0, 550, h, Valfunde.SecondaryColor)
                draw.SimpleText(GAMEMODE.Config.currency .. price,"ValfundeAS2",585,12.5, Valfunde.PrimaryButtonColor, TEXT_ALIGN_RIGHT)
                surface.SetDrawColor(0, 0, 0, 200)
                surface.DrawOutlinedRect(0,0,w,h)
                if hV then
                    surface.DrawRect(0,0,w,h)
                end
            end
        end
        buttonone.DoClick = function(self)
            frame:Close()
            WriteBoard(price, text, idbutton)
        end
        buttonlist:AddItem(buttonone)
    end

    for i=1,4 do
        AddButton(Valfunde.AdvertPrice[i], Valfunde.MainTextButton[i], i)
    end

end

--[[-------------------------------------------------------------------------
Writing Board
---------------------------------------------------------------------------]]
function WriteBoard(price, text, idbutton)

    if not price then return end

    local hV2 = false

    local writeboard = vgui.Create("DFrame")
    writeboard:SetSize(800, 150)
    writeboard:SetDraggable(true)
    writeboard:Center()
    writeboard:SetTitle("")
    writeboard:MakePopup()
    writeboard:ShowCloseButton(false)
    writeboard.Paint = function( self )
        Derma_DrawBackgroundBlur( self, 1 )
        draw.RoundedBox(0, 0, 0, 1100, 27.5, Valfunde.SecondaryColor)
        draw.RoundedBox( 0, 0, 27.5, 1100, 572.5, Valfunde.PrimaryColor)
        draw.SimpleText(Valfunde.MainTextWritingBoard[idbutton], "ValfundeAS2", 400, 35, Valfunde.PrimaryButtonColor, TEXT_ALIGN_CENTER)
    end

    local closewriteboard = vgui.Create("DButton", writeboard)
    closewriteboard:SetPos(773.5)
    closewriteboard:SetText("Х")
    closewriteboard:SetFont("ValfundeAS1")
    closewriteboard:SetSize(27.5,27.5)
    closewriteboard:SetTextColor(Valfunde.TextButtonColor)
    closewriteboard.Paint = function(s , w , h)
        draw.RoundedBox(0, 0, 0, w, h, Valfunde.PrimaryButtonColor)
    end
    closewriteboard.DoClick = function ( self )
        writeboard:Close()
        TheSimpleAdvert()
    end

    local TextEntry = vgui.Create( "DTextEntry", writeboard )
    TextEntry:SetPos( 50, 75 )
    TextEntry:SetSize( 700, 35 )

    local confirmbutton = vgui.Create("DButton", writeboard)
    confirmbutton:SetPos(355, 117)
    confirmbutton:SetText(Valfunde.Confirm)
    confirmbutton:SetFont("ValfundeAS")
    confirmbutton:SetSize(85,27.5)
    confirmbutton:SetTextColor(Valfunde.TextButtonColor)
    confirmbutton.OnCursorEntered = function() hV2 = true end
    confirmbutton.OnCursorExited = function() hV2 = false end
    confirmbutton.Paint = function(s , w , h)
        draw.RoundedBox(0, 0, 0, w, h, Valfunde.PrimaryButtonColor)
        surface.SetDrawColor(0, 0, 0, 200)
        surface.DrawOutlinedRect(0,0,w,h)
        if hV2 then
            surface.DrawRect(0,0,w,h)
        end
    end
    confirmbutton.DoClick = function ( self )
        AdSend()
        writeboard:Close()
    end

    function AdSend()
        net.Start("buyadvert")
        net.WriteUInt(idbutton, 4)
        net.WriteString(TextEntry:GetValue())
        net.SendToServer()
    end

end

--[[-------------------------------------------------------------------------
Run 'Ad' function when npc is clicked
---------------------------------------------------------------------------]]
net.Receive("AdValfunde", function(len, ply)
    TheSimpleAdvert()
end)

--[[-------------------------------------------------------------------------
3D2D Text above NPC's head
---------------------------------------------------------------------------]]
hook.Add("PostDrawOpaqueRenderables", "HeadNPCText", function()
    if Valfunde.HeadNPCText == "" then return end
	for k, v in pairs(ents.FindByClass("advert_npc")) do
		if v:GetPos():DistToSqr(LocalPlayer():GetPos()) < 200000 then
			local ang = v:GetAngles()

			ang:RotateAroundAxis(ang:Forward(), 90)
			ang:RotateAroundAxis(ang:Right(), -90)

			cam.Start3D2D(v:GetPos()+v:GetUp()*90, Angle(0, LocalPlayer():EyeAngles().y-90, 90), .35)
				draw.SimpleText(Valfunde.HeadNPCText, "HUDNumber5", 0, 0, Valfunde.HeadNPCTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_LEFT)
			cam.End3D2D()
		end
	end
end)
