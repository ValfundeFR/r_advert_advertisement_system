--[[-------------------------------------------------------------------------
Script by Valfunde | Version 1.1
If you have any problems, don't hesitate to leave a ScriptFodder ticket and/or add me on steam (Valfunde *Banna Army)
This is configuration file.
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Don't touch all of these table configurations.
---------------------------------------------------------------------------]]
if not Valfunde then Valfunde = {} end
Valfunde.SetDisableButton = {}
Valfunde.MainTextButton = {}
Valfunde.MainTextWritingBoard = {}
Valfunde.AdvertPrice = {}
Valfunde.TimerDelay = {}
Valfunde.TimerRepetition = {}
--[[-------------------------------------------------------------------------
After these lines you can edit what you want.
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
I hope you will like this addon, thanks! See you later.
---------------------------------------------------------------------------]]


--[[-------------------------------------------------------------------------
Configuration of the different adverts
---------------------------------------------------------------------------]]
Valfunde.SetDisableButton[1] = false -- Set to true if you want to disable the button, else let it on false  (This is for simple advert)
Valfunde.SetDisableButton[2] = false -- Set to true if you want to disable the button, else let it on false  (This is for spam advert)
Valfunde.SetDisableButton[3] = false -- Set to true if you want to disable the button, else let it on false  (This is for longer advert)
Valfunde.SetDisableButton[4] = false -- Set to true if you want to disable the button, else let it on false  (This is for anonymous advert)
--[[-------------------------------------------------------------------------
End of configuration of the different adverts
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Main text button configuration
---------------------------------------------------------------------------]]
Valfunde.MainTextButton[1] = "Make a simple advert"  -- Replace the text by your custom button text  (This is for simple advert)
Valfunde.MainTextButton[2] = "Make a spam advert"  -- Replace the text by your custom button text  (This is for spam advert)
Valfunde.MainTextButton[3] = "Make a longer advert"  -- Replace the text by your custom button text  (This is for longer advert)
Valfunde.MainTextButton[4] = "Make an anonymous advert"  -- Replace the text by your custom button text  (This is for anonymous advert)
--[[-------------------------------------------------------------------------
End of main text button configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Writing board text configuration
---------------------------------------------------------------------------]]
Valfunde.MainTextWritingBoard[1] = "Simple advert - Writing board"  -- Replace the text by your custom writing board text  (This is for simple advert)
Valfunde.MainTextWritingBoard[2] = "Spam advert - Writing board"  -- Replace the text by your custom writing board text  (This is for spam advert)
Valfunde.MainTextWritingBoard[3] = "Longer advert - Writing board"  -- Replace the text by your custom writing board text  (This is for longer advert)
Valfunde.MainTextWritingBoard[4] = "Anonymous advert - Writing board"  -- Replace the text by your custom writing board text  (This is for anonymous advert)
--[[-------------------------------------------------------------------------
End of writing board text configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Price configuration
---------------------------------------------------------------------------]]
Valfunde.AdvertPrice[1] = 100  -- Replace the price by the price you want for advert  (This is for simple advert)
Valfunde.AdvertPrice[2] = 200  -- Replace the price by the price you want for advert  (This is for spam advert)
Valfunde.AdvertPrice[3] = 300  -- Replace the price by the price you want for advert  (This is for longer advert)
Valfunde.AdvertPrice[4] = 550  -- Replace the price by the price you want for advert  (This is for anonymous advert)
--[[-------------------------------------------------------------------------
End of price configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Timer configuration
---------------------------------------------------------------------------]]
Valfunde.TimerDelay[1] = 30 -- Replace by the delay you want between every advert  (This is for spam advert)
Valfunde.TimerDelay[2] = 120 -- Replace by the delay you want between every advert  (This is for longer advert)

Valfunde.TimerRepetition[1] = 9 -- Replace by the number of repetitions you want for adverts  (This is for spam advert)
Valfunde.TimerRepetition[2] = 4 -- Replace by the number of repetitions you want for adverts  (This is for longer advert)
--[[-------------------------------------------------------------------------
End of timer configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Colors configuration
---------------------------------------------------------------------------]]
Valfunde.PrimaryColor = Color(30, 30, 30, 255)  -- Replace the numbers by your RGB color  (This color is the more darker grey)
Valfunde.SecondaryColor = Color(40, 40, 40, 255)  -- Replace the numbers by your RGB color  (This color is the more lighter grey)
Valfunde.PrimaryButtonColor = Color(200, 55, 55, 255) -- Replace the numbers by your RGB color  (This color is the more lighter red)
Valfunde.SecondaryButtonColor = Color(200, 55, 55, 150) -- Replace the numbers by your RGB color  (This color is the more darker red)
Valfunde.TextButtonColor = Color(255, 255, 255, 255) -- Replace the numbers by your RGB color  (This color is white)
Valfunde.TextButtonColorOnDisable = Color(255, 255, 255, 150) -- Replace the numbers by your RGB color  (This color is like a 'dark white')
--[[-------------------------------------------------------------------------
End of colors configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
Text configuration
---------------------------------------------------------------------------]]
Valfunde.MainText = "Advert - Dashboard" -- Replace the text by your custom main text
Valfunde.Confirm = "Confirm" -- Replace by your custom confirm text
Valfunde.SuccesNotifyPurchase = "You have purchased an ad for" -- Replace by your custom succes purchase notification
Valfunde.FailNotifyPurchase = "You need to provide a text for your advert" -- Replace by your custom fail purchase notification
Valfunde.Anonymous = "Anonymous" -- Replace by your custom Anonymous word when you make anonymous advertisement
--[[-------------------------------------------------------------------------
End of text configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
NPC configuration
---------------------------------------------------------------------------]]
Valfunde.NPCModel = "models/breen.mdl" -- Replace by the model you want
Valfunde.HeadNPCText = "Advert" -- Text above NPC's head. Let it empty if you don't want text
Valfunde.HeadNPCTextColor = Color(255, 255, 255, 255) -- Text color above NPC's head.
--[[-------------------------------------------------------------------------
End of NPC configuration
---------------------------------------------------------------------------]]

--[[-------------------------------------------------------------------------
End of configuration file
---------------------------------------------------------------------------]]
