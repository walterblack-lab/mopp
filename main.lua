-- main.lua | Matrix Hub Core
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({ Name = "MATRIX HUB", LoadingTitle = "Loading Modules..." })

-- Modul letöltése GitHubról (Példa elérési út)
local StreetLife = loadstring(game:HttpGet("https://raw.githubusercontent.com/FELHASZNALONEV/MatrixHub/main/modules/StreetLife.lua"))()

local FarmTab = Window:CreateTab("Auto Farm")

FarmTab:CreateToggle({
   Name = "Auto Clean Puddles",
   CurrentValue = false,
   Callback = function(Value)
      -- Meghívjuk a modulban lévő funkciót
      StreetLife.ToggleFarm(Value)
   end,
})
