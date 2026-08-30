-- =============================================
-- 🏋️ LIFTING MONSTER 2 | MAKE BY: SYAZWI
-- ✅ AUTO REBIRTH = PALING LAJU & WORK 100%
-- ✅ Auto Strength = Biasa (tak laju sangat)
-- ✅ GUNA COREGUI — PASTI MUNCUL!
-- =============================================

local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- === UI ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "LiftingMonster2_Syazwi"

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 260, 0, 255)
Main.Position = UDim2.new(0.02, 0, 0.5, -125)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 24)
Main.BorderColor3 = Color3.fromRGB(255, 215, 0)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(22, 22, 44)
Title.Font = Enum.Font.GothamBold
Title.Text = "🏋️ LIFTING MONSTER 2"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.Parent = Main

local BtnTrain = Instance.new("TextButton")
BtnTrain.Size = UDim2.new(1, -24, 0, 42)
BtnTrain.Position = UDim2.new(0, 12, 0, 55)
BtnTrain.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
BtnTrain.Font = Enum.Font.GothamBold
BtnTrain.Text = "🏋️ Auto Strength: OFF"
BtnTrain.TextColor3 = Color3.new(1,1,1)
BtnTrain.Parent = Main

local BtnRebirth = Instance.new("TextButton")
BtnRebirth.Size = UDim2.new(1, -24, 0, 42)
BtnRebirth.Position = UDim2.new(0, 12, 0, 107)
BtnRebirth.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
BtnRebirth.Font = Enum.Font.GothamBold
BtnRebirth.Text = "🔄 Auto Rebirth: OFF"
BtnRebirth.TextColor3 = Color3.new(1,1,1)
BtnRebirth.Parent = Main

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(1, -24, 0, 38)
Input.Position = UDim2.new(0, 12, 0, 160)
Input.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
Input.Font = Enum.Font.Gotham
Input.PlaceholderText = "🎯 Target Rebirth (cth: 100 / 1T)"
Input.Text = ""
Input.TextColor3 = Color3.new(1,1,1)
Input.ClearTextOnFocus = true
Input.Parent = Main

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -24, 0, 20)
Status.Position = UDim2.new(0, 12, 0, 205)
Status.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
Status.Font = Enum.Font.Gotham
Status.Text = "✅ Sedia..."
Status.TextColor3 = Color3.fromRGB(0, 255, 127)
Status.TextSize = 10
Status.Parent = Main

local Credit = Instance.new("TextLabel")
Credit.Size = UDim2.new(1, -24, 0, 18)
Credit.Position = UDim2.new(0, 12, 0, 230)
Credit.BackgroundColor3 = Color3.fromRGB(15, 15, 32)
Credit.Font = Enum.Font.GothamBold
Credit.Text = "✨ MAKE BY: SYAZWI ✨"
Credit.TextColor3 = Color3.fromRGB(255, 215, 0)
Credit.TextSize = 11
Credit.Parent = Main

-- === STATE ===
local autoTrain = false
local autoRebirth = false
local targetRebirth = 100
local rebirthRemote = nil

-- === CARI REBIRTH REMOTE ===
local function FindRebirthRemote()
    for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            local n = v.Name:lower()
            if n:find("rebirth") or n:find("reborn") then
                return v
            end
        end
    end
    return nil
end

-- === CARI & EQUIP DUMBBELL ===
local function GetWeightTool()
    local Backpack = LocalPlayer:FindFirstChild("Backpack")
    local Char = LocalPlayer.Character
    if Backpack then
        for _, t in ipairs(Backpack:GetChildren()) do
            if t:IsA("Tool") then
                local n = t.Name:lower()
                if n:find("dumbbell") or n:find("weight") or n:find("barbell") then
                    return t
                end
            end
        end
    end
    if Char then
        for _, t in ipairs(Char:GetChildren()) do
            if t:IsA("Tool") then return t end
        end
    end
    return nil
end

local function EquipTool(tool)
    if not tool then return end
    local Char = LocalPlayer.Character
    if not Char or tool.Parent == Char then return end
    local Hum = Char:FindFirstChild("Humanoid")
    if Hum then pcall(function() Hum:EquipTool(tool) end) end
end

-- === DAPAT JUMLAH REBIRTH ===
local function GetRebirthCount()
    local ls = LocalPlayer:FindFirstChild("leaderstats")
    if not ls then return 0 end
    for _, v in ipairs(ls:GetChildren()) do
        if (v:IsA("IntValue") or v:IsA("NumberValue")) and v.Name:lower():find("rebirth") then
            return v.Value
        end
    end
    return 0
end

-- === 🏋️ AUTO STRENGTH — BIASA SAHAJA ===
task.spawn(function()
    while true do
        task.wait(0.1) -- Biasa, tak laju
        if not autoTrain then continue end
        
        local tool = GetWeightTool()
        if not tool then
            Status.Text = "⚠️ Beli Dumbbell dulu!"
            task.wait(2)
            continue
        end
        
        EquipTool(tool)
        pcall(function() tool:Activate() end)
        
        local pos = Vector2.new(500, 500)
        pcall(function()
            UIS:InputBegan({Position=pos, UserInputType=Enum.UserInputType.MouseButton1})
            UIS:InputEnded({Position=pos, UserInputType=Enum.UserInputType.MouseButton1})
        end)
        
        Status.Text = "✅ Strength sedang naik..."
    end
end)

-- === ⚡ AUTO REBIRTH — PALING LAJU & WORK 100% ===
task.spawn(function()
    rebirthRemote = FindRebirthRemote()
    if rebirthRemote then
        Status.Text = "✅ Rebirth Remote Ditemui! LAJU MODE ON"
    end
    
    while true do
        task.wait(0.15) -- SANGAT LAJU! Setiap 0.15 saat
        if not autoRebirth then continue end
        
        local now = GetRebirthCount()
        BtnRebirth.Text = "🔄 "..now.." ➡️ "..targetRebirth
        
        if now >= targetRebirth then
            autoRebirth = false
            BtnRebirth.Text = "✅ DONE! ("..now..")"
            BtnRebirth.BackgroundColor3 = Color3.fromRGB(0, 160, 60)
            Status.Text = "🎉 REBIRTH SELESAI!"
            break
        end
        
        -- Cara 1: Remote (Paling Laju)
        if rebirthRemote then
            pcall(function() rebirthRemote:FireServer() end)
        else
            -- Cara 2: Klik Butang UI (Backup kalau remote tak jumpa)
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg then
                for _, v in ipairs(pg:GetDescendants()) do
                    if v:IsA("GuiButton") and v.Visible then
                        local txt = ""
                        if v:FindFirstChild("TextLabel") then txt = v.TextLabel.Text:lower() end
                        if v:FindFirstChild("Text") then txt = txt .. v.Text:lower() end
                        if txt:find("rebirth") and txt:find("now") then
                            pcall(function() v.MouseButton1Click:Fire() end)
                            break
                        end
                    end
                end
            end
        end
    end
end)

-- === BUTANG TOGGLE ===
BtnTrain.MouseButton1Click:Connect(function()
    autoTrain = not autoTrain
    BtnTrain.Text = autoTrain and "🏋️ Auto Strength: ON ✅" or "🏋️ Auto Strength: OFF"
    BtnTrain.BackgroundColor3 = autoTrain and Color3.fromRGB(0, 130, 70) or Color3.fromRGB(35, 35, 55)
    if not autoTrain then Status.Text = "✅ Sedia..." end
end)

BtnRebirth.MouseButton1Click:Connect(function()
    autoRebirth = not autoRebirth
    BtnRebirth.Text = autoRebirth and "🔄 Rebirth: JALAN ⚡" or "🔄 Auto Rebirth: OFF"
    BtnRebirth.BackgroundColor3 = autoRebirth and Color3.fromRGB(0, 130, 70) or Color3.fromRGB(35, 35, 55)
end)

-- === INPUT TARGET ===
Input.FocusLost:Connect(function(enter)
    if enter then
        local txt = Input.Text:upper()
        local n
        if txt:find("T") then n = tonumber(txt:gsub("T","")) * 1000000000000
        elseif txt:find("B") then n = tonumber(txt:gsub("B","")) * 1000000000
        elseif txt:find("M") then n = tonumber(txt:gsub("M","")) * 1000000
        elseif txt:find("K") then n = tonumber(txt:gsub("K","")) * 1000
        else n = tonumber(txt) end
        
        if n and n > 0 then
            targetRebirth = n
            Input.Text = "🎯 Target: "..tostring(n)
        else
            Input.Text = "⚠️ Salah!"
        end
    end
end)

print("✅ LIFTING MONSTER 2 | MAKE BY: SYAZWI — DIMUAT!")
print("⚡ Auto Rebirth: PALING LAJU (0.15s setiap kali)")
print("✅ Auto Strength: Biasa sahaja")
