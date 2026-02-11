-- main.lua | Matrix Hub Core (Updated 2026-02-11)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "MATRIX HUB | STREET LIFE",
    LoadingTitle = "Initializing Modular System...",
    ConfigurationSaving = { Enabled = false }
})

-- MODUL BETÖLTÉSE (Pcall a biztonságért)
local success, StreetLife = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/walterblack-lab/mopp/main/modules/StreetLife.lua"))()
end)

if not success then
    warn("MODUL HIBA: " .. tostring(StreetLife))
    Rayfield:Notify({Title = "Error", Content = "Module not found on GitHub!"})
end

local FarmTab = Window:CreateTab("Auto Farm", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- AUTOMATA TAKARÍTÁS GOMB
FarmTab:CreateToggle({
    Name = "Mop Farm (Sync Mode)",
    CurrentValue = false,
    Callback = function(Value)
        if success and StreetLife then
            if Value then
                Rayfield:Notify({Title = "Farm Started", Content = "Finding nearest puddle..."})
                StreetLife.StartFarm()
            else
                Rayfield:Notify({Title = "Farm Stopped", Content = "Finishing current task..."})
                StreetLife.StopFarm()
            end
        else
            Rayfield:Notify({Title = "Critical Error", Content = "Module not loaded!"})
        end
    end,
})

-- UNLOAD GOMB (Tiszta kilépés)
SettingsTab:CreateButton({
    Name = "Unload Hub",
    Callback = function()
        if success and StreetLife then 
            StreetLife.StopFarm() 
        end
        Rayfield:Destroy()
        print("Matrix Hub Unloaded Successfully.")
    end,
})
