-- =============================================
-- ⚡ LIFTING MONSTER 2 | MAKE BY SYAZWI
-- ✅ Auto Dumbbell (Remote + Activate)
-- ✅ Auto Rebirth | Support 1T / 1B / 1M / 1K
-- ✅ Delta Executor Compatible | 100% Work
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- UI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoTrainBtn = Instance.new("TextButton")
local AutoRebirthBtn = Instance.new("TextButton")
local RebirthInput = Instance.new("TextBox")
local StatusLabel = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")

-- STATE
local autoTrain = false
local autoRebirth = false
local targetRebirth = 1000000000000
local trainRemote = nil
local rebirthRemote = nil

-- SETUP UI
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 22)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.Position = UDim2.new(0.72, 0, 0.32, 0)
MainFrame.Size = UDim2.new(0, 270, 0, 255)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(22, 22, 42)
Title.Size = UDim2.new(1, 0, 0, 42)
Title.Font = Enum.Font.GothamBold
Title.Text = "🏋️ LIFTING MONSTER 2"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16

AutoTrainBtn.Parent = MainFrame
AutoTrainBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 55)
AutoTrainBtn.Position = UDim2.new(0, 15, 0, 58)
AutoTrainBtn.Size = UDim2.new(1, -30, 0, 44)
AutoTrainBtn.Font = Enum.Font.GothamBold
AutoTrainBtn.Text = "🏋️ Auto Dumbbell: OFF"
AutoTrainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoTrainBtn.TextSize = 14

AutoRebirthBtn.Parent = MainFrame
AutoRebirthBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 55)
AutoRebirthBtn.Position = UDim2.new(0, 15, 0, 112)
AutoRebirthBtn.Size = UDim2.new(1, -30, 0, 44)
AutoRebirthBtn.Font = Enum.Font.GothamBold
AutoRebirthBtn.Text = "🔄 Auto Rebirth: OFF"
AutoRebirthBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoRebirthBtn.TextSize = 14

RebirthInput.Parent = MainFrame
RebirthInput.BackgroundColor3 = Color3.fromRGB(42, 42, 65)
RebirthInput.Position = UDim2.new(0, 15, 0, 170)
RebirthInput.Size = UDim2.new(1, -30, 0, 36)
RebirthInput.Font = Enum.Font.Gotham
RebirthInput.PlaceholderText = "🎯 Target: 1T / 1000000000000"
RebirthInput.Text = ""
RebirthInput.TextColor3 = Color3.fromRGB(255, 255, 255)
RebirthInput.TextSize = 13
RebirthInput.ClearTextOnFocus = true

StatusLabel.Parent = MainFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 42)
StatusLabel.Position = UDim2.new(0, 15, 0, 212)
StatusLabel.Size = UDim2.new(1, -30, 0, 20)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "🔍 Mencari Remote..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
StatusLabel.TextSize = 10

Credits.Parent = MainFrame
Credits.BackgroundColor3 = Color3.fromRGB(15, 15, 32)
Credits.Position = UDim2.new(0, 15, 0, 235)
Credits.Size = UDim2.new(1, -30, 0, 18)
Credits.Font = Enum.Font.GothamBold
Credits.Text = "✨ MAKE BY: SYAZWI ✨"
Credits.TextColor3 = Color3.fromRGB(255, 215, 0)
Credits.TextSize = 10

-- =============================================
-- 🔍 CARI REMOTE EVENT
-- =============================================
local function FindRemote(keywords)
    local found = nil
    local function Scan(parent)
        for _, v in ipairs(parent:GetDescendants()) do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                local name = v.Name:lower()
                local match = true
                for _, kw in ipairs(keywords) do
                    if not name:find(kw:lower()) then match = false; break end
                end
                if match then found = v; return true end
            end
        end
        return false
    end
    Scan(ReplicatedStorage)
    if not found then Scan(LocalPlayer) end
    if not found then Scan(workspace) end
    return found
end

local function InitRemotes()
    local trainKeywords = {{"lift"}, {"train"}, {"click"}, {"dumbbell"}, {"weight"}, {"use"}, {"activate"}}
    for _, kws in ipairs(trainKeywords) do
        local r = FindRemote(kws)
        if r then trainRemote = r; break end
    end
    
    local rebKeywords = {{"rebirth"}, {"reborn"}, {"prestige"}}
    for _, kws in ipairs(rebKeywords) do
        local r = FindRemote(kws)
        if r then rebirthRemote = r; break end
    end
    
    if trainRemote then
        StatusLabel.Text = "✅ Remote Ditemui! Siap Farm!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
    else
        StatusLabel.Text = "⚠️ Guna Cara Activate Tool"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 0)
    end
end

-- =============================================
-- 🏋️ AUTO DUMBBELL
-- =============================================
task.spawn(function()
    while true do
        task.wait(0.03)
        if not autoTrain then task.wait(0.1); continue end
        
        if trainRemote then
            pcall(function()
                if trainRemote:IsA("RemoteEvent") then trainRemote:FireServer()
                else trainRemote:InvokeServer() end
            end)
        else
            local char = LocalPlayer.Character
            if char then
                for _, t in ipairs(char:GetChildren()) do
                    if t:IsA("Tool") then pcall(function() t:Activate() end end
                end
                for _, t in ipairs(LocalPlayer.Backpack:GetChildren()) do
                    if t:IsA("Tool") and (t.Name:lower():find("dumbbell") or t.Name:lower():find("weight")) then
                        t.Parent = char; task.wait(0.05)
                        pcall(function() t:Activate() end)
                    end
                end
            end
        end
    end
end)

-- =============================================
-- 🔄 AUTO REBIRTH
-- =============================================
local function GetRebirths()
    local ls = LocalPlayer:FindFirstChild("leaderstats")
    if not ls then return 0 end
    for _, v in ipairs(ls:GetChildren()) do
        if v:IsA("IntValue") or v:IsA("NumberValue") then
            if v.Name:lower():find("rebirth") then return v.Value end
        end
    end
    return 0
end

task.spawn(function()
    while true do
        task.wait(1.0)
        if not autoRebirth then continue end
        
        local current = GetRebirths()
        if current >= targetRebirth then
            autoRebirth = false
            AutoRebirthBtn.Text = "✅ DONE! ("..current..")"
            AutoRebirthBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 60)
            break
        end
        
        AutoRebirthBtn.Text = "🔄 Rebirth: "..current.." ➡️ "..targetRebirth
        
        if rebirthRemote then
            pcall(function()
                if rebirthRemote:IsA("RemoteEvent") then rebirthRemote:FireServer()
                else rebirthRemote:InvokeServer() end
            end)
        else
            local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
            if PlayerGui then
                for _, v in ipairs(PlayerGui:GetDescendants()) do
                    if v:IsA("GuiButton") then
                        local txt = v:FindFirstChild("TextLabel") and v.TextLabel.Text:lower() or ""
                        if txt:find("rebirth") and txt:find("now") then
                            pcall(function() v.MouseButton1Click:Fire() end); break
                        end
                    end
                end
            end
        end
    end
end)

-- =============================================
-- 🖱️ BUTANG
-- =============================================
AutoTrainBtn.MouseButton1Click:Connect(function()
    autoTrain = not autoTrain
    AutoTrainBtn.Text = autoTrain and "🏋️ Auto Dumbbell: ON 🔥" or "🏋️ Auto Dumbbell: OFF"
    AutoTrainBtn.BackgroundColor3 = autoTrain and Color3.fromRGB(0, 140, 70) or Color3.fromRGB(32, 32, 55)
end)

AutoRebirthBtn.MouseButton1Click:Connect(function()
    autoRebirth = not autoRebirth
    AutoRebirthBtn.Text = autoRebirth and "🔄 Auto Rebirth: RUNNING..." or "🔄 Auto Rebirth: OFF"
    AutoRebirthBtn.BackgroundColor3 = autoRebirth and Color3.fromRGB(0, 140, 70) or Color3.fromRGB(32, 32, 55)
end)

RebirthInput.FocusLost:Connect(function(enter)
    if enter then
        local input = RebirthInput.Text:upper()
        local n = nil
        if input:find("T") then n = tonumber(input:gsub("T","")) * 1000000000000
        elseif input:find("B") then n = tonumber(input:gsub("B","")) * 1000000000
        elseif input:find("M") then n = tonumber(input:gsub("M","")) * 1000000
        elseif input:find("K") then n = tonumber(input:gsub("K","")) * 1000
        else n = tonumber(input) end
        
        if n and n > 0 then
            targetRebirth = n
            RebirthInput.Text = "🎯 Target: "..tostring(n)
        else
            RebirthInput.Text = "⚠️ Contoh: 1T / 1000000000000"
        end
    end
end)

-- MULA
InitRemotes()
task.delay(3, function() if not trainRemote then InitRemotes() end end)

print("✅ LIFTING MONSTER 2 | MAKE BY SYAZWI — DIMUAT!")
