-- Muscle Legends | AUTO FARM KILL + AUTO TUKAR SERVER 🌐
-- ⏱️ Tukar Server Setiap 40s | 🛡️ Skip Protection | 🚫 Skip Brawl | ⚡ Laju
-- ⚠️ Pembelajaran sahaja! Risiko sendiri.

-- Perkhidmatan
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")

-- Pemain
local LocalPlayer = Players.LocalPlayer
local LocalChar, LocalRoot, LocalHumanoid
local killedPlayers = {}
local CurrentTarget = nil
local RespawnTimes = {}

-- ⚙️ TETAPAN
local Config = {
    Enabled = true,
    PunchSpeed = 0.05,
    FollowUpdateRate = 0.08,
    TeleportOffset = Vector3.new(2.5, 1.2, 0),
    ResetKilledAfter = 8,
    IgnoreBrawlPlayers = true,
    BrawlCheckDistance = 80,
    -- 🛡️ Protection
    SkipSpawnProtection = true,
    ProtectionGracePeriod = 5,
    -- 🌐 AUTO TUKAR SERVER
    AutoRejoin = true,
    RejoinInterval = 40, -- ⏱️ Tukar server setiap 40 SAAT
    RejoinTimer = os.time()
}

-- Catat masa respawn
local function TrackRespawn(ply)
    ply.CharacterAdded:Connect(function()
        RespawnTimes[ply.UserId] = os.time()
    end)
end
Players.PlayerAdded:Connect(TrackRespawn)
for _, p in ipairs(Players:GetPlayers()) do TrackRespawn(p) end

-- 🛡️ SEMAK SPAWN PROTECTION
local function HasSpawnProtection(player)
    if not Config.SkipSpawnProtection then return false end
    if not player.Character then return false end

    -- 1. Masa sejak respawn
    local spawnTime = RespawnTimes[player.UserId]
    if spawnTime then
        local since = os.time() - spawnTime
        if since < Config.ProtectionGracePeriod then
            return true, "Masa: " .. (Config.ProtectionGracePeriod - since) .. "s"
        end
    end

    -- 2. Kesan visual
    for _, child in ipairs(player.Character:GetDescendants()) do
        local n = child.Name:lower()
        if n:find("protect") or n:find("shield") or n:find("spawn") then
            return true, "Kesan: "..child.Name
        end
    end

    -- 3. Teks di atas kepala
    local head = player.Character:FindFirstChild("Head")
    if head then
        for _, gui in ipairs(head:GetChildren()) do
            if gui:IsA("BillboardGui") then
                local txt = gui:FindFirstChildOfClass("TextLabel")
                if txt and txt.Text:lower():find("spawn") and txt.Text:lower():find("protect") then
                    return true, "Label: "..txt.Text
                end
            end
        end
    end
    return false
end

-- 🚫 SEMAK DALAM BRAWL
local function IsInBrawl(player)
    local char = player.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= LocalPlayer and other ~= player and other.Character then
            local oRoot = other.Character:FindFirstChild("HumanoidRootPart")
            if oRoot and (root.Position - oRoot.Position).Magnitude < Config.BrawlCheckDistance then
                return true
            end
        end
    end
    return false
end

-- 👊 Equip Punch
local function EquipPunchTool()
    if not LocalChar then return end
    local tool = LocalPlayer.Backpack:FindFirstChild("Punch") or LocalPlayer.StarterGear:FindFirstChild("Punch")
    if tool and not LocalChar:FindFirstChild("Punch") then
        LocalHumanoid:EquipTool(tool)
    end
end

-- 💥 Punch Sebenar
local function DoRealPunch()
    local event = LocalPlayer:FindFirstChild("muscleEvent")
    if event then
        pcall(function()
            event:FireServer("punch", "leftHand")
            event:FireServer("punch", "rightHand")
        end)
    end
end

-- ✅ Senarai pemain SELAMAT
local function GetValidTargets()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or killedPlayers[p.UserId] then continue end
        local prot = HasSpawnProtection(p)
        if prot then
            print("[🛡️] Langkau: "..p.Name)
            continue
        end
        if Config.IgnoreBrawlPlayers and IsInBrawl(p) then
            print("[🚫] Langkau: "..p.Name.." (Brawl)")
            continue
        end
        if p.Character then
            local hum = p.Character:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then
                table.insert(list, p)
            end
        end
    end
    return list
end

-- ✈️ Teleport
local function TeleportTo(target)
    if not LocalRoot then return false end
    local targetRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return false end
    LocalRoot.CFrame = CFrame.new(targetRoot.Position + Config.TeleportOffset, targetRoot.Position)
    return true
end

-- 🌐 TUKAR SERVER — Rejoin game
local function RejoinServer()
    if not Config.AutoRejoin then return end
    print("======================================")
    print("🌐 TUKAR SERVER — "..Config.RejoinInterval.."s DAH LALU")
    print("======================================")
    local PlaceId = game.PlaceId
    pcall(function()
        TeleportService:Teleport(PlaceId, LocalPlayer)
    end)
end

-- 🔄 Kitaran UTAMA
local Running = false
local lastReset = os.time()
local lastFollowUpdate = 0

local function MainLoop()
    if Running then return end
    Running = true

    while Config.Enabled do
        -- 🌐 SEMAK MASA TUKAR SERVER
        if Config.AutoRejoin and os.time() - Config.RejoinTimer >= Config.RejoinInterval then
            RejoinServer()
            return
        end

        -- Kemas kini watak
        LocalChar = LocalPlayer.Character
        if LocalChar then
            LocalRoot = LocalChar:FindFirstChild("HumanoidRootPart")
            LocalHumanoid = LocalChar:FindFirstChild("Humanoid")
        end

        if not LocalChar or not LocalHumanoid or LocalHumanoid.Health <= 0 then
            CurrentTarget = nil
            task.wait(0.2)
            continue
        end

        -- Reset senarai bunuh
        if os.time() - lastReset > Config.ResetKilledAfter then
            killedPlayers = {}
            lastReset = os.time()
        end

        EquipPunchTool()

        -- 🏃 ADA SASARAN → SEMAK & IKUT
        if CurrentTarget and CurrentTarget:IsDescendantOf(game) then
            if HasSpawnProtection(CurrentTarget) then
                print("[🛡️❗] "..CurrentTarget.Name.." ada protection — tukar")
                CurrentTarget = nil
                task.wait(0.3)
                continue
            end
            if IsInBrawl(CurrentTarget) then
                print("[🚫❗] "..CurrentTarget.Name.." dalam brawl — tukar")
                CurrentTarget = nil
                task.wait(0.3)
                continue
            end

            -- ✅ SELAMAT → IKUT & PUNCH!
            local tChar = CurrentTarget.Character
            if tChar then
                local tRoot = tChar:FindFirstChild("HumanoidRootPart")
                local tHum = tChar:FindFirstChild("Humanoid")
                if tRoot and tHum and tHum.Health > 0 then
                    local now = os.clock()
                    if now - lastFollowUpdate >= Config.FollowUpdateRate then
                        TeleportTo(CurrentTarget)
                        lastFollowUpdate = now
                    end
                    LocalRoot.CFrame = CFrame.new(LocalRoot.Position, tRoot.Position)
                    DoRealPunch()
                    task.wait(Config.PunchSpeed)
                    continue
                end
            end
            -- Mati
            killedPlayers[CurrentTarget.UserId] = true
            print("[💀] MATI: "..CurrentTarget.Name)
            CurrentTarget = nil
        end

        -- 🔍 Cari sasaran baru
        local targets = GetValidTargets()
        if #targets == 0 then
            local masaTinggal = Config.RejoinInterval - (os.time() - Config.RejoinTimer)
            print("[⏳] Tiada sasaran — tunggu server baru dalam "..masaTinggal.."s")
            task.wait(1)
            continue
        end

        -- Pilih rawak
        CurrentTarget = targets[math.random(#targets)]
        print("[📍✅] SASARAN: "..CurrentTarget.Name)
        TeleportTo(CurrentTarget)
        lastFollowUpdate = os.clock()
    end

    Running = false
end

-- 🎮 Kawalan
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        Config.Enabled = not Config.Enabled
        print("[🔄] AutoKill: "..(Config.Enabled and "✅ MULA" or "❌ HENTI"))
        if Config.Enabled then
            Config.RejoinTimer = os.time() -- Reset masa tukar server
            task.spawn(MainLoop)
        end
    end
    if input.KeyCode == Enum.KeyCode.G then
        RejoinServer() -- Tukar server MANUAL
    end
end)

-- Mula
task.spawn(MainLoop)

print("======================================")
print("✅ AUTO FARM KILL + TUKAR SERVER 🌐")
print("======================================")
print("⏱️ Tukar server setiap "..Config.RejoinInterval.." saat")
print("🛡️ Langkau Spawn Protection")
print("🚫 Langkau Brawl")
print("⚡ Teleport + Ikut + Punch")
print("🎮 F = Mula/Henti | G = Tukar Server Sekarang")
