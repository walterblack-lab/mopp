-- main.lua
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "MATRIX HUB | STREET LIFE",
    LoadingTitle = "Modular Loading...",
    ConfigurationSaving = { Enabled = false }
})

-- MODUL BETÖLTÉSE (Javított linkkel)
local success, StreetLife = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/walterblack-lab/mopp/main/modules/StreetLife.lua"))()
end)

if not success then
    warn("Hiba: A modul nem talalhato a GitHubon!")
    Rayfield:Notify({Title = "Hiba", Content = "A StreetLife modul nem toltheto be!"})
end

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
        else
            warn("A modul nincs betoltve, a gomb nem mukodik!")
        end
    end,
})

SettingsTab:CreateButton({
    Name = "Destroy Script (Unload)",
    Callback = function()
        if success and StreetLife then StreetLife.StopFarm() end
        Rayfield:Destroy()
    end,
})
