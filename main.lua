-- main.lua
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "MATRIX HUB | STREET LIFE",
    LoadingTitle = "Modular Loading...",
    ConfigurationSaving = { Enabled = false }
})

-- 1. MODUL BETÖLTÉSE (Csak egyszer, pcall-al)
local success, StreetLife = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/walterblack-lab/mopp/main/modules/StreetLife.lua"))()
end)

if not success then
    warn("Hiba a StreetLife modul betoltesekor!")
    -- Itt akár egy Notify-t is feldobhatsz a felhasználónak
end

-- 2. UI ELEMEK LÉTREHOZÁSA
local FarmTab = Window:CreateTab("Auto Farm")
local SettingsTab = Window:CreateTab("Settings")

FarmTab:CreateToggle({
    Name = "Auto Mop Puddles",
    CurrentValue = false,
    Callback = function(Value)
        if success and StreetLife then
            if Value then
                StreetLife.StartFarm()
            else
                StreetLife.StopFarm()
            end
        end
    end,
})

-- 3. UNLOAD GOMB
SettingsTab:CreateButton({
    Name = "Destroy Script (Unload)",
    Callback = function()
        if success and StreetLife then
            StreetLife.StopFarm()
        end
        Rayfield:Destroy()
    end,
})
