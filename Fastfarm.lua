--[[ SYAZWI HUB l PRIVATE | By MLYC_SyazwiOnTop ]]
local L=loadstring(game:HttpGet("https://raw.githubusercontent.com/0o0o0o0o0o0o0o0o0o0o0o0o/0o/refs/heads/main/CRUSHER.lua",true))()
local W=L:AddWindow("SYAZWI HUB l PRIVATE",{main_color=Color3.fromRGB(138,0,0),min_size=Vector2.new(600,600),can_resize=false})
local RS=game:GetService("ReplicatedStorage")
local P=game.Players.LocalPlayer
local VIM=game:GetService("VirtualInputManager")
local ME=P:WaitForChild("muscleEvent")
local LS=P:WaitForChild("leaderstats")
local RB=LS:WaitForChild("Rebirths")
local ST=LS:WaitForChild("Strength")
local DU=P:WaitForChild("Durability")
local VU=game:GetService("VirtualUser")
for _,n in ipairs({"strengthFrame","durabilityFrame","agilityFrame"})do local f=RS:FindFirstChild(n)if f and f:IsA("GuiObject")then f.Visible=false end end

local function F(n)if n>=1e15 then return string.format("%.2fQa",n/1e15)elseif n>=1e12 then return string.format("%.2fT",n/1e12)elseif n>=1e9 then return string.format("%.2fB",n/1e9)elseif n>=1e6 then return string.format("%.2fM",n/1e6)elseif n>=1e3 then return string.format("%.2fK",n/1e3)else return string.format("%.0f",n)end end

-- MAIN
local MT=W:AddTab("          Main          ")
MT:AddLabel("Settings").TextSize=30
MT:AddTextBox("Speed",function(v)_G.AutoSpeed=true if P.Character and P.Character:FindFirstChild("Humanoid")then P.Character.Humanoid.WalkSpeed=tonumber(v)end end)
MT:AddTextBox("Size",function(v)_G.AutoSize=true RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",tonumber(v))end)
MT:AddLabel("Essenttals:").TextSize=30
local function rmPortal()for _,p in pairs(game:GetDescendants())do if p.Name=="RobloxForwardPortals"then p:Destroy()end end if _G.AdConn then _G.AdConn:Disconnect()end _G.AdConn=game.DescendantAdded:Connect(function(d)if d.Name=="RobloxForwardPortals"then d:Destroy()end end)end
rmPortal()
MT:AddButton("Load Infinite Yield",function()loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()end)
MT:AddButton("Load Anti Lag",function()loadstring(game:HttpGet("https://raw.githubusercontent.com/juywvm/-Roblox-Projects-/main/____Anti_Afk_Remastered_______"))()end)
local parts={}
task.spawn(function()
local ps=2048 local td=50000 local sp=Vector3.new(-2,-9.5,-2)
local n=math.ceil(td/ps)
for x=0,n-1 do for z=0,n-1 do
local function cp(pos,name)local p=Instance.new("Part")p.Size=Vector3.new(ps,1,ps)p.Position=pos p.Anchored=true p.Transparency=1 p.CanCollide=true p.Name=name p.Parent=workspace return p end
table.insert(parts,cp(sp+Vector3.new(x*ps,0,z*ps),"P1"..x..z))
table.insert(parts,cp(sp+Vector3.new(-x*ps,0,z*ps),"P2"..x..z))
table.insert(parts,cp(sp+Vector3.new(-x*ps,0,-z*ps),"P3"..x..z))
table.insert(parts,cp(sp+Vector3.new(x*ps,0,-z*ps),"P4"..x..z))
end end end)
MT:AddSwitch("Walk on Water",function(b)for _,p in ipairs(parts)do if p and p.Parent then p.CanCollide=b end end end):Set(false)
MT:AddSwitch("Anti Fling",function(b)
if b then local c=game.Workspace:FindFirstChild(P.Name)if c then local r=c:FindFirstChild("HumanoidRootPart")if r then local bv=Instance.new("BodyVelocity")bv.MaxForce=Vector3.new(100000,0,100000)bv.Velocity=Vector3.new(0,0,0)bv.P=1250 bv.Parent=r end end
else local c=game.Workspace:FindFirstChild(P.Name)if c then local r=c:FindFirstChild("HumanoidRootPart")if r then local e=r:FindFirstChild("BodyVelocity")if e and e.MaxForce==Vector3.new(100000,0,100000)then e:Destroy()end end end end
end):Set(true)
MT:AddSwitch("Lock Position",function(v)
if v then local cp=P.Character.HumanoidRootPart.CFrame getgenv().posLock=game:GetService("RunService").Heartbeat:Connect(function()if P.Character:FindFirstChild("HumanoidRootPart")then P.Character.HumanoidRootPart.CFrame=cp end end)
else if getgenv().posLock then getgenv().posLock:Disconnect()getgenv().posLock=nil end end
end)
MT:AddButton("Rejoin",function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,P)end)

-- PETS
local FARM={"Omega Overlord","Rare Boss Pet"}
local REB={"Titanium Hydra"}
local MAX=6
local lastKey=nil
local function equipPets(list,force)
local key=table.concat(list,"|").."_"..MAX
if not force and lastKey==key then return end
for _,f in pairs(P.petsFolder:GetChildren())do if f:IsA("Folder")then for _,pt in pairs(f:GetChildren())do RS.rEvents.equipPetEvent:FireServer("unequipPet",pt)end end end
task.wait(0.25)
local eq={}
for _,nm in ipairs(list)do if #eq>=MAX then break end
for _,f in pairs(P.petsFolder:GetChildren())do if f:IsA("Folder")then for _,pt in pairs(f:GetChildren())do if pt.Name==nm and #eq<MAX then RS.rEvents.equipPetEvent:FireServer("equipPet",pt)table.insert(eq,nm)task.wait(0.08)end end end end end
if #eq>0 then print("[PET] "..#eq..": "..table.concat(eq,", "))lastKey=key else print("[PET] Tak jumpa")end
end

-- FAST REBIRTH
local FRT=W:AddTab("Fast Rebirth")
local tL=FRT:AddLabel("0d 0h 0m 0s - Inactive")tL.TextSize=17 tL.TextColor3=Color3.fromRGB(255,50,50)
local pL=FRT:AddLabel("Pace: 0 / Hour | 0 / Day | 0 / Week")pL.TextSize=17
local aL=FRT:AddLabel("Average Pace: 0 / Hour | 0 / Day | 0 / Week")aL.TextSize=17
local sL=FRT:AddLabel("Rebirths: "..F(RB.Value).." | Gained: 0")sL.TextSize=17
local stL=FRT:AddLabel("Status: Idle")stL.TextSize=15 stL.TextColor3=Color3.fromRGB(200,200,200)
FRT:AddLabel("")
FRT:AddButton("🔍 DEBUG: List My Pets",function()print("===== MY PETS =====")for _,f in pairs(P.petsFolder:GetChildren())do if f:IsA("Folder")then print("--- "..f.Name.." ---")for _,pt in pairs(f:GetChildren())do print("   "..pt.Name)end end end print("===================")end)
FRT:AddButton("🧪 TEST Equip Farm Pets",function()equipPets(FARM,true)end)
FRT:AddButton("🧪 TEST Equip Rebirth Pets",function()equipPets(REB,true)end)
FRT:AddLabel("")
local rRun=false rStart=0 rTotal=0 rInitRB=RB.Value
local rLastT=tick()rLastV=RB.Value rCount=0 rH={}rD={}rW={}rMax=20
local function uLbl()sL.Text="Rebirths: "..F(RB.Value).." | Gained: "..F(RB.Value-rInitRB)end
local function cPace()rCount=rCount+1 if rCount<2 then rLastT=tick()rLastV=RB.Value return end
local now=tick()local g=RB.Value-rLastV
if g>0 then local a=(now-rLastT)/g local ph=3600/a local pd=24000/a local pw=604800/a
pL.Text="Pace: "..F(ph).." / Hour | "..F(pd).." / Day | "..F(pw).." / Week"
table.insert(rH,ph)table.insert(rD,pd)table.insert(rW,pw)
if #rH>rMax then table.remove(rH,1)table.remove(rD,1)table.remove(rW,1)end
local function av(t)local s=0 for _,v in ipairs(t)do s=s+v end return #t>0 and s/#t or 0 end
aL.Text="Average Pace: "..F(av(rH)).." / Hour | "..F(av(rD)).." / Day | "..F(av(rW)).." / Week"
rLastT=now rLastV=RB.Value end end
RB:GetPropertyChangedSignal("Value"):Connect(function()cPace()uLbl()end)
local function doReb()
local c=P.Character if not c then return end
local h=c:FindFirstChildOfClass("Humanoid")if not h or h.Health<=0 then task.wait(0.5)return end
stL.Text="Status: Equipping farm pets..."stL.TextColor3=Color3.fromRGB(255,200,100)
equipPets(FARM)task.wait(0.2)
local target=5000+(RB.Value*2550)
stL.Text="Status: Farming... ("..F(target).." needed)"stL.TextColor3=Color3.fromRGB(100,200,255)
local fs=tick()
while rRun and ST.Value<target do
local reps=P.MembershipType==Enum.MembershipType.Premium and 8 or 14
for _=1,reps do ME:FireServer("rep")end
task.wait(0.01)
if tick()-fs>30 then stL.Text="Status: Timeout"stL.TextColor3=Color3.fromRGB(255,100,100)break end
end
if rRun and ST.Value>=target then
stL.Text="Status: Equipping rebirth pets..."stL.TextColor3=Color3.fromRGB(200,150,255)
equipPets(REB)task.wait(0.2)
stL.Text="Status: Rebirthing..."stL.TextColor3=Color3.fromRGB(100,255,100)
local b=RB.Value local rs=tick()
repeat RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest")task.wait(0.05)
if tick()-rs>10 then break end
until RB.Value>b or not rRun
task.wait(1)end end
local function rLoop()while rRun do pcall(doReb)task.wait(0.1)end
stL.Text="Status: Idle"stL.TextColor3=Color3.fromRGB(200,200,200)end
FRT:AddSwitch("Fast Rebirth",function(s)
rRun=s
if s then rStart=tick()lastKey=nil task.spawn(rLoop)
else if rStart>0 then rTotal=rTotal+(tick()-rStart)rStart=0 end end
end):Set(false)
task.spawn(function()
while true do
local now=tick()local e=rTotal
if rRun and rStart>0 then e=e+(now-rStart)end
local d=math.floor(e/86400)local h=math.floor((e%86400)/3600)local m=math.floor((e%3600)/60)local s=math.floor(e%60)
tL.Text=string.format("%dd %dh %dm %ds - %s",d,h,m,s,rRun and "Rebirthing" or "Paused")
tL.TextColor3=rRun and Color3.fromRGB(50,255,50) or Color3.fromRGB(255,50,50)
task.wait(0.5)end end)

-- FAST FARM
local FT=W:AddTab("Fast Farm")
local fT=FT:AddLabel("0d 0h 0m 0s - Fast Rep Inactive")fT.TextSize=17 fT.TextColor3=Color3.fromRGB(255,50,50)
local fSP=FT:AddLabel("Strength Pace: 0 /Hour | 0 /Day | 0 /Week")fSP.TextSize=17
local fDP=FT:AddLabel("Durability Pace: 0 /Hour | 0 /Day | 0 /Week")fDP.TextSize=17
local fAS=FT:AddLabel("Average Strength Pace: 0 /Hour | 0 /Day | 0 /Week")fAS.TextSize=17
local fAD=FT:AddLabel("Average Durability Pace: 0 /Hour | 0 /Day | 0 /Week")fAD.TextSize=17
FT:AddLabel("")
local fSL=FT:AddLabel("Strength: 0 | Gained: 0")fSL.TextSize=17
local fDL=FT:AddLabel("Durability: 0 | Gained: 0")fDL.TextSize=17
FT:AddLabel("")
FT:AddLabel("Fast Farm (Recommended Speed: 20)").TextSize=20
local fReps=1 fRun=false fStart=0 fPause=0 fTrack=false fInitS=ST.Value fInitD=DU.Value fSH={}fDH={}fCI=5
local function fPing()local s=game:GetService("Stats")local p=s:FindFirstChild("PerformanceStats")and s.PerformanceStats:FindFirstChild("Ping")return p and p:GetValue()or 0 end
FT:AddTextBox("Rep Speed",function(v)local n=tonumber(v)if n and n>0 then fReps=math.floor(n)end end,{placeholder="1"})
local function fLoop()
while fRun do
local s=tick()
while tick()-s<0.05 and fRun do for i=1,fReps do ME:FireServer("rep")end task.wait(0.01)end
while fRun and fPing()>=500 do task.wait(0.1)end end end
FT:AddSwitch("Fast Rep",function(s)
if s and not fRun then fRun=true fStart=tick()fTrack=true fInitS=ST.Value fInitD=DU.Value task.spawn(fLoop)
elseif not s and fRun then fRun=false if fTrack and fStart>0 then fTrack=false fPause=fPause+(tick()-fStart)fStart=0 end end
end):Set(false)
FT:AddButton("Equip Farm Pets",function()equipPets(FARM,true)end)
FT:AddButton("Equip Rebirth Pets",function()equipPets(REB,true)end)
FT:AddLabel("Misc:").TextSize=20
local function egg()local t=P.Character:FindFirstChild("Protein Egg")or P.Backpack:FindFirstChild("Protein Egg")if t then ME:FireServer("proteinEgg",t)end end
local eRun=false task.spawn(function()while true do if eRun then egg()task.wait(1800)else task.wait(1)end end end)
FT:AddSwitch("Auto Egg",function(s)eRun=s if s then egg()end end):Set(false)
local function shake()local t=P.Character:FindFirstChild("Tropical Shake")or P.Backpack:FindFirstChild("Tropical Shake")if t then ME:FireServer("tropicalShake",t)end end
local shRun=false task.spawn(function()while true do if shRun then shake()task.wait(900)else task.wait(1)end end end)
FT:AddSwitch("Auto Shake",function(s)shRun=s if s then shake()end end):Set(false)
FT:AddSwitch("Spin Fortune Wheel",function(b)_G.AutoSpinWheel=b if b then spawn(function()while _G.AutoSpinWheel and wait(1)do RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"])end end)end end):Set(false)
FT:AddButton("Jungle Squat",function()
local c=P.Character or P.CharacterAdded:wait()
local h=c:WaitForChild("HumanoidRootPart")
h.CFrame=CFrame.new(-8371.43359375,6.79806327,2858.88525390)
task.wait(0.2)VIM:SendKeyEvent(true,Enum.KeyCode.E,false,game)task.wait(0.05)VIM:SendKeyEvent(false,Enum.KeyCode.E,false,game)end)
FT:AddButton("Anti Lag",function()
local pg=P:WaitForChild("PlayerGui")local li=game:GetService("Lighting")
for _,g in pairs(pg:GetChildren())do if g:IsA("ScreenGui")then g:Destroy()end end
local ds=Instance.new("Sky")ds.Name="DarkSky"for _,pr in ipairs({"SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"})do ds[pr]="rbxassetid://0"end
ds.Parent=li li.Brightness=0 li.ClockTime=0 li.OutdoorAmbient=Color3.new(0,0,0)li.Ambient=Color3.new(0,0,0)end)
task.spawn(function()
local lc=tick()
while true do
local now=tick()local cs=ST.Value local cd=DU.Value
fSL.Text="Strength: "..F(cs).." | Gained: "..F(cs-fInitS)
fDL.Text="Durability: "..F(cd).." | Gained: "..F(cd-fInitD)
if fRun then
local e=fPause if fStart>0 then e=e+(now-fStart)end
local d=math.floor(e/86400)local h=math.floor((e%86400)/3600)local m=math.floor((e%3600)/60)local s=math.floor(e%60)
fT.Text=string.format("%dd %dh %dm %ds - Fast Rep Running",d,h,m,s)fT.TextColor3=Color3.fromRGB(50,255,50)
table.insert(fSH,{time=now,value=cs})table.insert(fDH,{time=now,value=cd})
while #fSH>0 and now-fSH[1].time>fCI do table.remove(fSH,1)end
while #fDH>0 and now-fDH[1].time>fCI do table.remove(fDH,1)end
if now-lc>=fCI then lc=now
if #fSH>=2 then local de=fSH[#fSH].value-fSH[1].value local ps=de/fCI fSP.Text="Strength Pace: "..F(ps*3600).." /Hour | "..F(ps*86400).." /Day | "..F(ps*604800).." /Week"end
if #fDH>=2 then local de=fDH[#fDH].value-fDH[1].value local ps=de/fCI fDP.Text="Durability Pace: "..F(ps*3600).." /Hour | "..F(ps*86400).." /Day | "..F(ps*604800).." /Week"end
local tot=fPause if fStart>0 then tot=tot+(now-fStart)end
if tot>0 then local aS=(cs-fInitS)/tot local aD=(cd-fInitD)/tot fAS.Text="Average Strength Pace: "..F(aS*3600).." /Hour | "..F(aS*86400).." /Day | "..F(aS*604800).." /Week" fAD.Text="Average Durability Pace: "..F(aD*3600).." /Hour | "..F(aD*86400).." /Day | "..F(aD*604800).." /Week"end
end
else if not fTrack then
fT.Text=string.format("%dd %dh %dm %ds - Fast Rep Stopped",math.floor(fPause/86400),math.floor((fPause%86400)/3600),math.floor((fPause%3600)/60),math.floor(fPause%60))
fT.TextColor3=Color3.fromRGB(255,165,0)end end
task.wait(0.1)end end)

-- AUTO REBIRTH
local AT=W:AddTab("Auto Rebirth")
local arG=AT:AddLabel("Rebirth Gains: "..F(RB.Value))arG.TextSize=20
RB:GetPropertyChangedSignal("Value"):Connect(function()arG.Text="Rebirth Gains: "..F(RB.Value)end)
AT:AddLabel("")
local arT=100
AT:AddTextBox("Amount Rebirth Target",function(v)local n=tonumber(v)if n and n>0 then arT=math.floor(n)end end,{placeholder="100"})
local arTO=false arIO=false
local function doAR()
task.spawn(function()
while arTO or arIO do
if arTO and RB.Value>=arT then arTO=false break end
equipPets(FARM)task.wait(0.2)
local target=5000+(RB.Value*2550)local fs=tick()
while (arTO or arIO) and ST.Value<target do
local reps=P.MembershipType==Enum.MembershipType.Premium and 8 or 14
for _=1,reps do ME:FireServer("rep")end
task.wait(0.01)
if tick()-fs>30 then break end end
if (arTO or arIO) and ST.Value>=target then
equipPets(REB)task.wait(0.2)
local b=RB.Value local rs=tick()
repeat RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest")task.wait(0.05)
if tick()-rs>10 then break end
until RB.Value>b or not(arTO or arIO)
task.wait(1)end
task.wait(0.1)end end)end
AT:AddSwitch("Auto Rebirth [Target]",function(s)arTO=s if s then doAR()end end):Set(false)
AT:AddSwitch("Auto Rebirth Infinite",function(s)arIO=s if s then doAR()end end):Set(false)
AT:AddLabel("")
local arLP=false
AT:AddSwitch("Lock Position",function(s)
arLP=s
if s then local c=P.Character or P.CharacterAdded:Wait()local h=c:WaitForChild("HumanoidRootPart")local lp=h.Position
task.spawn(function()while arLP do if h and h.Parent then h.Velocity=Vector3.new(0,0,0)h.RotVelocity=Vector3.new(0,0,0)h.CFrame=CFrame.new(lp)end task.wait(0.05)end end)end
end):Set(true)
local arAL=false
AT:AddSwitch("AntiLag",function(s)
arAL=s
if s then task.spawn(function()while arAL do for _,o in pairs(workspace:GetDescendants())do if o:IsA("ParticleEmitter")or o:IsA("Trail")or o:IsA("Smoke")or o:IsA("Fire")then o.Enabled=false end end task.wait(5)end end)end
end):Set(true)
local arAF=true
AT:AddSwitch("Anti Afk",function(s)arAF=s end):Set(true)
P.Idled:Connect(function()if arAF then VU:CaptureController()VU:ClickButton2(Vector2.new())end end)

-- INFO
local IT=W:AddTab("Info")
IT:AddLabel("Made by MLYC_SyazwiOnTop").TextSize=20
IT:AddLabel("discord.gg/syazwihub").TextSize=20
IT:AddButton("Copy Invite",function()if setclipboard then setclipboard("https://discord.gg/syazwihub")game.StarterGui:SetCore("SendNotification",{Title="Link Copied!",Text="You can continue to Discord now.",Duration=3})end end)
local vl=IT:AddLabel("VERSION: 1.5 PRIVATE")vl.TextSize=40 vl.Font=Enum.Font.Arcade
