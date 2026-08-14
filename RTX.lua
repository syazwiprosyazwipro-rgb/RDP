--=============================================================
-- ⚡ RTX SCRIPT | PRIVITE v4.0 — TAB ROCKS ✅ AUTO TELEPORT!
-- ✅ TAIP KEY → TERUS BUKA! TAK STUCK!
-- ✅ TANGAN TENANG PEGANG SEKALI! TAK KEJANG!
-- ✅ TAB 🪨 ROCKS: LIST SEMUA BATU + AUTO TELEPORT + AUTO PUNCH!
-- ✅ TAB ⚙️ SETTINGS KEKAL! UI NEON CANTIK!
-- ✅ DIBUAT OLEH: SYAZWIOG
--=============================================================

local RS=game:GetService("RunService")
local RP=game:GetService("ReplicatedStorage")
local LP=game.Players.LocalPlayer
local Tween=game:GetService("TweenService")
local WS=game:GetService("Workspace")

-- KEY
local KATA_LALUAN = "RTXONTOP"

-- DETECT REMOTE EVENT
local Ev=nil
for _,v in ipairs(LP:GetChildren())do
 if v:IsA("RemoteEvent")and v.Name:lower():find("muscle")then Ev=v break end
end
if not Ev then Ev=LP:FindFirstChildWhichIsA("RemoteEvent")end

-- DETECT REBIRTH
local Rb=nil
pcall(function()Rb=RP.rEvents.rebirthRemote end)
if not Rb then
 for _,v in ipairs(RP:GetDescendants())do
  if v:IsA("RemoteFunction")and v.Name:lower():find("rebirth")then Rb=v break end
 end
end

-- HITUNG REBIRTH
local function GR()
 local l=LP:FindFirstChild("leaderstats")
 if l then
  local x=l:FindFirstChild("Rebirths")or l:FindFirstChild("Rebirth")
  if x then return tonumber(x.Value)or 0 end
 end
 return 0
end

-- CHARACTER + BACKPACK
local W,H,Ba,AlatSekarang,HR
local function X()
 W=LP.Character or LP.CharacterAdded:Wait()
 H=W:WaitForChild("Humanoid")
 Ba=LP:WaitForChild("Backpack")
 HR=W:FindFirstChild("HumanoidRootPart")
 AlatSekarang=nil
end
X()
LP.CharacterAdded:Connect(function()task.wait(.6);pcall(X)end)

-- STATES
local K={T=false,FT=false,A=false,R=false,Ro=false}
local TG=0
local AntiLag=false
local FPSShow=false
local RockTarget=nil

-- ======================================
-- ✅ PEGANG SEKALI SAHAJA → TENANG!
-- ======================================
local function PA(J)
 if not Ba or not H then return false end
 local M=J=="P"and{"Punch","Fist"}or{"Weight","Dumbbell"}
 local Cari=J=="P"and"P"or"A"
 if AlatSekarang==Cari then return true end

 pcall(function()H:UnequipTools()end)
 task.wait(.12)
 for _,v in ipairs(Ba:GetChildren())do
  if v:IsA("Tool")then
   local n=v.Name:lower()
   for _,k in ipairs(M)do
    if n:find(k:lower())then
     pcall(function()H:EquipTool(v)end)
     AlatSekarang=Cari
     task.wait(.3)
     return true
    end
   end
  end
 end
 return false
end

-- PUNCH
local function BT(Laju)
 if not Ev then return end
 if not PA("P")then return end
 task.wait(.1)
 Ev:FireServer("punch","leftHand")
 task.wait(Laju or .25)
 Ev:FireServer("punch","rightHand")
end

-- ANGKAT
local function BL()
 if not Ev then return end
 if not PA("A")then return end
 task.wait(.15)
 Ev:FireServer("rep")
end

-- REBIRTH
local function BR()
 if not Rb then return end
 pcall(function()Rb:InvokeServer("rebirthRequest")end)
end

-- ======================================
-- 🪨 ROCKS SYSTEM — DETECT SEMUA BATU + TELEPORT!
-- ======================================
local RockList={}
local RockButtons={}

-- CARI SEMUA BATU DALAM GAME
local function RefreshRocks()
 table.clear(RockList)
 local Areas={"Rocks","RockArea","StoneArea","Mountains","Durability"}
 for _,AreaName in ipairs(Areas)do
  local Folder=WS:FindFirstChild(AreaName)
  if Folder then
   for _,v in ipairs(Folder:GetDescendants())do
    if v:IsA("BasePart")and v.Name:lower():find("rock") or v.Name:lower():find("stone") or v.Name:lower():find("batu") then
     table.insert(RockList,{Name=v.Name,Part=v})
    end
   end
  end
 end
 -- JIKA TAK JUMPA → GUNA LOKASI BIASA GAME
 if #RockList==0 then
  table.insert(RockList,{Name="🪨 Basic Rock",Pos=Vector3.new(120,2,80)})
  table.insert(RockList,{Name="🪨 Stone Rock",Pos=Vector3.new(250,5,150)})
  table.insert(RockList,{Name="🪨 Hard Rock",Pos=Vector3.new(400,8,220)})
  table.insert(RockList,{Name="🪨 Giant Rock",Pos=Vector3.new(600,12,300)})
  table.insert(RockList,{Name="💎 Crystal Rock",Pos=Vector3.new(850,15,450)})
 end
 return RockList
end

-- TELEPORT KE BATU
local function TeleportKeBatu(Batu)
 if not HR then return end
 if Batu.Part then
  HR.CFrame=CFrame.new(Batu.Part.Position+Vector3.new(0,3,-4))
 else
  HR.CFrame=CFrame.new(Batu.Pos+Vector3.new(0,3,-4))
 end
 RockTarget=Batu
end

-- ======================================
-- ✨ UI NEON KACA
-- ======================================
local G=Instance.new("ScreenGui")
G.Name="RTX_PRIVITE"
G.ResetOnSpawn=false
G.Parent=game.CoreGui

-- MAIN PANEL
local P=Instance.new("Frame")
P.Size=UDim2.new(0,460,0,280)
P.Position=UDim2.new(0.5,-230,0.5,-140)
P.BackgroundColor3=Color3.fromRGB(8,12,35)
P.Active=true;P.Draggable=true
P.Visible=false;P.Parent=G
Instance.new("UICorner",P).CornerRadius=UDim.new(0,18)
local BD=Instance.new("UIStroke")
BD.Thickness=2.5;BD.Color=Color3.fromRGB(0,210,255);BD.Parent=P

-- HEADER
local HD=Instance.new("Frame")
HD.Size=UDim2.new(1,-40,0,36)
HD.Position=UDim2.new(0,20,0,12)
HD.BackgroundColor3=Color3.fromRGB(0,180,220);HD.Parent=P
Instance.new("UICorner",HD).CornerRadius=UDim.new(0,12)
local HDT=Instance.new("TextLabel")
HDT.Size=UDim2.new(1,0,1,0)
HDT.Text="⚡ RTX SCRIPT | PRIVITE"
HDT.Font=Enum.Font.GothamBold;HDT.TextSize=16
HDT.TextColor3=Color3.new(0,0,0);HDT.Parent=HD

-- HIDE BUTTON
local BH=Instance.new("TextButton")
BH.Size=UDim2.new(0,36,0,36)
BH.Position=UDim2.new(1,-44,0,12)
BH.BackgroundColor3=Color3.fromRGB(255,60,90);BH.Text="👁"
BH.Font=Enum.Font.GothamBold;BH.TextSize=14
BH.TextColor3=Color3.new(0,0,0);BH.AutoButtonColor=false;BH.Parent=P
Instance.new("UICorner",BH).CornerRadius=UDim.new(0,18)

-- SHOW BUTTON
local BS=Instance.new("TextButton")
BS.Size=UDim2.new(0,140,0,40)
BS.Position=UDim2.new(0,12,.5,-20)
BS.BackgroundColor3=Color3.fromRGB(0,180,220);BS.Text="✨ SHOW RTX PANEL"
BS.Font=Enum.Font.GothamBold;BS.TextSize=13
BS.TextColor3=Color3.new(0,0,0);BS.AutoButtonColor=false
BS.Visible=false;BS.Parent=G
Instance.new("UICorner",BS).CornerRadius=UDim.new(0,12)

-- TABS — 6 TAB SEKARANG!
local function MT(n,i,c,sel)
 local B=Instance.new("TextButton")
 B.Size=UDim2.new(1/6-4/460,0,0,30)
 B.Position=UDim2.new(i/6,2,0,58)
 B.BackgroundColor3=c
 B.Text=n
 B.Font=Enum.Font.GothamBold;B.TextSize=9
 B.TextColor3=Color3.new(0,0,0)
 B.AutoButtonColor=false;B.Parent=P
 Instance.new("UICorner",B).CornerRadius=UDim.new(0,8)
 local S=Instance.new("UIStroke")
 S.Thickness=sel and 2 or 1
 S.Color=sel and Color3.fromRGB(0,210,255) or Color3.fromRGB(80,90,120)
 S.Parent=B
 return B
end
local T1=MT("🌾FARM",0,Color3.fromRGB(0,180,220),true)
local T2=MT("👊PUNCH",1,Color3.fromRGB(80,90,120),false)
local T3=MT("🪨ROCKS",2,Color3.fromRGB(80,90,120),false) -- ✅ TAB BARU!
local T4=MT("🔄REBIRTH",3,Color3.fromRGB(80,90,120),false)
local T5=MT("⭐CREDIT",4,Color3.fromRGB(80,90,120),false)
local T6=MT("⚙️SETTINGS",5,Color3.fromRGB(80,90,120),false)

-- CONTENT
local function MK()
 local K=Instance.new("Frame")
 K.Size=UDim2.new(1,-16,0,170)
 K.Position=UDim2.new(0,8,0,92)
 K.BackgroundTransparency=1;K.Parent=P
 return K
end
local K1=MK();local K2=MK();K2.Visible=false
local K3=MK();K3.Visible=false -- ✅ TAB ROCKS
local K4=MK();K4.Visible=false;local K5=MK();K5.Visible=false;local K6=MK();K6.Visible=false

-- TAB 1 — FARM
local BA=Instance.new("TextButton")
BA.Size=UDim2.new(.92,0,0,75)
BA.Position=UDim2.new(.04,0,0,8)
BA.BackgroundColor3=Color3.fromRGB(15,25,60)
BA.Text="🏋️ AUTO TRAIN\nOFF"
BA.Font=Enum.Font.GothamBold;BA.TextSize=15
BA.TextColor3=Color3.fromRGB(120,255,210)
BA.AutoButtonColor=false;BA.Parent=K1
Instance.new("UICorner",BA).CornerRadius=UDim.new(0,14)

-- TAB 2 — PUNCH
local BTN=Instance.new("TextButton")
BTN.Size=UDim2.new(.45,0,0,75)
BTN.Position=UDim2.new(.03,0,0,8)
BTN.BackgroundColor3=Color3.fromRGB(15,25,60)
BTN.Text="👊 AUTO PUNCH\nOFF"
BTN.Font=Enum.Font.GothamBold;BTN.TextSize=14
BTN.TextColor3=Color3.fromRGB(120,255,210)
BTN.AutoButtonColor=false;BTN.Parent=K2
Instance.new("UICorner",BTN).CornerRadius=UDim.new(0,14)

local BFN=Instance.new("TextButton")
BFN.Size=UDim2.new(.45,0,0,75)
BFN.Position=UDim2.new(.52,0,0,8)
BFN.BackgroundColor3=Color3.fromRGB(35,15,60)
BFN.Text="⚡ FAST PUNCH\nOFF"
BFN.Font=Enum.Font.GothamBold;BFN.TextSize=14
BFN.TextColor3=Color3.fromRGB(255,170,80)
BFN.AutoButtonColor=false;BFN.Parent=K2
Instance.new("UICorner",BFN).CornerRadius=UDim.new(0,14)

-- TAB 3 — 🪨 ROCKS ✅ PENUH!
local RockTop=Instance.new("Frame")
RockTop.Size=UDim2.new(1,0,0,30)
RockTop.Position=UDim2.new(0,0,0,0)
RockTop.BackgroundTransparency=1;RockTop.Parent=K3

local RockInfo=Instance.new("TextLabel")
RockInfo.Size=UDim2.new(.6,0,1,0)
RockInfo.Position=UDim2.new(0,0,0,0)
RockInfo.BackgroundTransparency=1
RockInfo.Text="🪨 Pilih Batu → Auto Teleport"
RockInfo.Font=Enum.Font.GothamBold;RockInfo.TextSize=12
RockInfo.TextColor3=Color3.fromRGB(180,220,255)
RockInfo.TextXAlignment=Enum.TextXAlignment.Left;RockInfo.Parent=RockTop

local BRRefresh=Instance.new("TextButton")
BRRefresh.Size=UDim2.new(.35,0,1,0)
BRRefresh.Position=UDim2.new(.65,0,0,0)
BRRefresh.BackgroundColor3=Color3.fromRGB(60,80,120)
BRRefresh.Text="🔄 Refresh"
BRRefresh.Font=Enum.Font.GothamBold;BRRefresh.TextSize=11
BRRefresh.TextColor3=Color3.fromRGB(255,255,255)
BRRefresh.AutoButtonColor=false;BRRefresh.Parent=RockTop
Instance.new("UICorner",BRRefresh).CornerRadius=UDim.new(0,8)

local RockListFrame=Instance.new("ScrollingFrame")
RockListFrame.Size=UDim2.new(.92,0,0,100)
RockListFrame.Position=UDim2.new(.04,0,0,35)
RockListFrame.BackgroundColor3=Color3.fromRGB(10,20,50)
RockListFrame.BackgroundTransparency=.3
RockListFrame.ScrollBarThickness=4
RockListFrame.CanvasSize=UDim2.new(0,0,0,0)
RockListFrame.Parent=K3
Instance.new("UICorner",RockListFrame).CornerRadius=UDim.new(0,10)

local AutoRockBtn=Instance.new("TextButton")
AutoRockBtn.Size=UDim2.new(.92,0,0,35)
AutoRockBtn.Position=UDim2.new(.04,0,0,142)
AutoRockBtn.BackgroundColor3=Color3.fromRGB(30,60,40)
AutoRockBtn.Text="🪨 AUTO PUNCH ROCK\nOFF"
AutoRockBtn.Font=Enum.Font.GothamBold;AutoRockBtn.TextSize=13
AutoRockBtn.TextColor3=Color3.fromRGB(150,255,210)
AutoRockBtn.AutoButtonColor=false;AutoRockBtn.Parent=K3
Instance.new("UICorner",AutoRockBtn).CornerRadius=UDim.new(0,10)

-- BUAT BUTANG LIST BATU
local function BuatButangBatu()
 for _,b in ipairs(RockListFrame:GetChildren())do if b:IsA("TextButton")then b:Destroy() end end
 table.clear(RockButtons)
 local RL=RefreshRocks()
 local Ht=32
 local Off=4
 for i,Batu in ipairs(RL)do
  local B=Instance.new("TextButton")
  B.Size=UDim2.new(1,-8,0,Ht-4)
  B.Position=UDim2.new(0,4,0,(i-1)*Ht+Off)
  B.BackgroundColor3=Color3.fromRGB(20,40,70)
  B.BackgroundTransparency=.2
  B.Text=Batu.Name
  B.Font=Enum.Font.GothamBold;B.TextSize=11
  B.TextColor3=Color3.fromRGB(220,240,255)
  B.AutoButtonColor=false;B.Parent=RockListFrame
  Instance.new("UICorner",B).CornerRadius=UDim.new(0,6)
  B.MouseButton1Click:Connect(function()TeleportKeBatu(Batu);RockInfo.Text="✅ Ke: "..Batu.Name end)
  table.insert(RockButtons,B)
 end
 RockListFrame.CanvasSize=UDim2.new(0,0,0,#RL*Ht+Off)
end
BuatButangBatu()
BRRefresh.MouseButton1Click:Connect(BuatButangBatu)

-- TAB 4 — REBIRTH
local LR=Instance.new("TextLabel")
LR.Size=UDim2.new(.94,0,0,30)
LR.Position=UDim2.new(.03,0,0,5)
LR.BackgroundColor3=Color3.fromRGB(255,200,50)
LR.Text="REBIRTH: "..GR().." / TARGET: 0"
LR.Font=Enum.Font.GothamBold;LR.TextSize=13
LR.TextColor3=Color3.new(0,0,0)
LR.TextXAlignment=Enum.TextXAlignment.Center;LR.Parent=K4
Instance.new("UICorner",LR).CornerRadius=UDim.new(0,8)

local TX=Instance.new("TextBox")
TX.Size=UDim2.new(.45,0,0,42)
TX.Position=UDim2.new(.47,0,0,45)
TX.BackgroundColor3=Color3.fromRGB(25,40,90)
TX.Text="10"
TX.Font=Enum.Font.GothamBold;TX.TextSize=20
TX.TextColor3=Color3.fromRGB(255,220,80)
TX.TextXAlignment=Enum.TextXAlignment.Center
TX.ClearTextOnFocus=false;TX.Parent=K4
Instance.new("UICorner",TX).CornerRadius=UDim.new(0,10)

local BRN=Instance.new("TextButton")
BRN.Size=UDim2.new(.92,0,0,50)
BRN.Position=UDim2.new(.04,0,0,100)
BRN.BackgroundColor3=Color3.fromRGB(15,25,60)
BRN.Text="🔄 AUTO REBIRTH\nOFF"
BRN.Font=Enum.Font.GothamBold;BRN.TextSize=14
BRN.TextColor3=Color3.fromRGB(255,220,80)
BRN.AutoButtonColor=false;BRN.Parent=K4
Instance.new("UICorner",BRN).CornerRadius=UDim.new(0,12)

-- TAB 5 — CREDIT
local C1=Instance.new("TextLabel")
C1.Size=UDim2.new(1,0,0,40)
C1.Position=UDim2.new(0,0,0,10)
C1.BackgroundTransparency=1
C1.Text="CREDIT: RTX SCRIPT | PRIVITE"
C1.Font=Enum.Font.GothamBold;C1.TextSize=16
C1.TextColor3=Color3.fromRGB(0,230,255)
C1.TextXAlignment=Enum.TextXAlignment.Center;C1.Parent=K5

local C2=Instance.new("TextLabel")
C2.Size=UDim2.new(1,0,0,45)
C2.Position=UDim2.new(0,0,0,55)
C2.BackgroundTransparency=1
C2.Text="✨ MAKE BY: SYAZWIOG ✨"
C2.Font=Enum.Font.GothamBold;C2.TextSize=18
C2.TextColor3=Color3.fromRGB(255,220,80)
C2.TextXAlignment=Enum.TextXAlignment.Center;C2.Parent=K5

-- TAB 6 — SETTINGS
local AL=Instance.new("TextButton")
AL.Size=UDim2.new(.44,0,0,65)
AL.Position=UDim2.new(.04,0,0,8)
AL.BackgroundColor3=Color3.fromRGB(15,25,60)
AL.Text="⚡ ANTI LAG\nOFF"
AL.Font=Enum.Font.GothamBold;AL.TextSize=13
AL.TextColor3=Color3.fromRGB(120,255,210)
AL.AutoButtonColor=false;AL.Parent=K6
Instance.new("UICorner",AL).CornerRadius=UDim.new(0,10)

local FS=Instance.new("TextButton")
FS.Size=UDim2.new(.44,0,0,65)
FS.Position=UDim2.new(.52,0,0,8)
FS.BackgroundColor3=Color3.fromRGB(15,25,60)
FS.Text="📊 FPS\nOFF"
FS.Font=Enum.Font.GothamBold;FS.TextSize=13
FS.TextColor3=Color3.fromRGB(120,255,210)
FS.AutoButtonColor=false;FS.Parent=K6
Instance.new("UICorner",FS).CornerRadius=UDim.new(0,10)

local FPSLabel=Instance.new("TextLabel")
FPSLabel.Size=UDim2.new(0,110,0,32)
FPSLabel.Position=UDim2.new(1,-120,0,40)
FPSLabel.BackgroundColor3=Color3.fromRGB(8,12,35)
FPSLabel.Text="📊 FPS: 0"
FPSLabel.Font=Enum.Font.GothamBold;FPSLabel.TextSize=13
FPSLabel.TextColor3=Color3.fromRGB(70,255,150)
FPSLabel.TextXAlignment=Enum.TextXAlignment.Center
FPSLabel.Visible=false;FPSLabel.Active=true;FPSLabel.Draggable=true;FPSLabel.Parent=G
Instance.new("UICorner",FPSLabel).CornerRadius=UDim.new(0,8)

-- SWITCH TAB
local function ST(N)
 K1.Visible=N==1;K2.Visible=N==2;K3.Visible=N==3
 K4.Visible=N==4;K5.Visible=N==5;K6.Visible=N==6
 local A=Color3.fromRGB(0,180,220);local I=Color3.fromRGB(80,90,120)
 T1.BackgroundColor3=N==1 and A or I;T2.BackgroundColor3=N==2 and A or I
 T3.BackgroundColor3=N==3 and A or I;T4.BackgroundColor3=N==4 and A or I
 T5.BackgroundColor3=N==5 and A or I;T6.BackgroundColor3=N==6 and A or I
end
T1.MouseButton1Click:Connect(function()ST(1)end)
T2.MouseButton1Click:Connect(function()ST(2)end)
T3.MouseButton1Click:Connect(function()ST(3)end)
T4.MouseButton1Click:Connect(function()ST(4)end)
T5.MouseButton1Click:Connect(function()ST(5)end)
T6.MouseButton1Click:Connect(function()ST(6)end)

-- HIDE/SHOW
BH.MouseButton1Click:Connect(function()P.Visible=false;BS.Visible=true end)
BS.MouseButton1Click:Connect(function()P.Visible=true;BS.Visible=false end)

-- TOGGLES
BA.MouseButton1Click:Connect(function()K.A=not K.A;BA.Text=K.A and "🏋️ AUTO TRAIN\n✅ ON" or "🏋️ AUTO TRAIN\nOFF";AlatSekarang=nil end)
BTN.MouseButton1Click:Connect(function()K.T=not K.T;BTN.Text=K.T and "👊 AUTO PUNCH\n✅ ON" or "👊 AUTO PUNCH\nOFF";AlatSekarang=nil end)
BFN.MouseButton1Click:Connect(function()K.FT=not K.FT;BFN.Text=K.FT and "⚡ FAST PUNCH\n✅ ON" or "⚡ FAST PUNCH\nOFF";AlatSekarang=nil end)
AutoRockBtn.MouseButton1Click:Connect(function()K.Ro=not K.Ro;AutoRockBtn.Text=K.Ro and "🪨 AUTO PUNCH ROCK\n✅ ON" or "🪨 AUTO PUNCH ROCK\nOFF";AutoRockBtn.BackgroundColor3=K.Ro and Color3.fromRGB(20,60,40) or Color3.fromRGB(30,60,40);AlatSekarang=nil end)
BRN.MouseButton1Click:Connect(function()K.R=not K.R;TG=tonumber(TX.Text)or 10;BRN.Text=K.R and "🔄 AUTO REBIRTH\n✅ ON" or "🔄 AUTO REBIRTH\nOFF" end)
AL.MouseButton1Click:Connect(function()AntiLag=not AntiLag;AL.Text=AntiLag and "⚡ ANTI LAG\n✅ ON" or "⚡ ANTI LAG\nOFF" end)
FS.MouseButton1Click:Connect(function()FPSShow=not FPSShow;FPSLabel.Visible=FPSShow;FS.Text=FPSShow and "📊 FPS\n✅ ON" or "📊 FPS\nOFF" end)

-- ======================================
-- 🔑 KEY PANEL — TAK STUCK!
-- ======================================
local KeyFrame=Instance.new("Frame")
KeyFrame.Size=UDim2.new(0,280,0,170)
KeyFrame.Position=UDim2.new(0.5,-140,0.5,-85)
KeyFrame.BackgroundColor3=Color3.fromRGB(6,10,35)
KeyFrame.Active=true;KeyFrame.Draggable=true;KeyFrame.Parent=G
Instance.new("UICorner",KeyFrame).CornerRadius=UDim.new(0,18)
local KBD=Instance.new("UIStroke")
KBD.Thickness=2.5;KBD.Color=Color3.fromRGB(0,210,255);KBD.Parent=KeyFrame

local KH=Instance.new("TextLabel")
KH.Size=UDim2.new(1,0,0,40)
KH.Position=UDim2.new(0,0,0,10)
KH.BackgroundTransparency=1
KH.Text="🔐 ENTER KEY"
KH.Font=Enum.Font.GothamBold;KH.TextSize=16
KH.TextColor3=Color3.fromRGB(0,230,255)
KH.TextXAlignment=Enum.TextXAlignment.Center;KH.Parent=KeyFrame

local KInput=Instance.new("TextBox")
KInput.Size=UDim2.new(.8,0,0,44)
KInput.Position=UDim2.new(.1,0,0,58)
KInput.BackgroundColor3=Color3.fromRGB(12,20,45)
KInput.Text=""
KInput.PlaceholderText="Taip Key Sini"
KInput.Font=Enum.Font.GothamBold;KInput.TextSize=18
KInput.TextColor3=Color3.fromRGB(255,255,255)
KInput.TextXAlignment=Enum.TextXAlignment.Center
KInput.ClearTextOnFocus=false;KInput.Parent=KeyFrame
Instance.new("UICorner",KInput).CornerRadius=UDim.new(0,12)

local KBTN=Instance.new("TextButton")
KBTN.Size=UDim2.new(.8,0,0,40)
KBTN.Position=UDim2.new(.1,0,0,110)
KBTN.BackgroundColor3=Color3.fromRGB(0,180,140)
KBTN.Text="🔓 UNLOCK"
KBTN.Font=Enum.Font.GothamBold;KBTN.TextSize=15
KBTN.TextColor3=Color3.new(0,0,0)
KBTN.AutoButtonColor=false;KBTN.Parent=KeyFrame
Instance.new("UICorner",KBTN).CornerRadius=UDim.new(0,12)

local KStatus=Instance.new("TextLabel")
KStatus.Size=UDim2.new(.9,0,0,18)
KStatus.Position=UDim2.new(.05,0,0,152)
KStatus.BackgroundTransparency=1
KStatus.Text="";KStatus.Font=Enum.Font.GothamBold
KStatus.TextSize=11;KStatus.TextXAlignment=Enum.TextXAlignment.Center
KStatus.TextColor3=Color3.fromRGB(255,100,100);KStatus.Parent=KeyFrame

-- ✅ UNLOCK
local Buka=function()
 local Teks=string.upper(string.gsub(KInput.Text,"%s+",""))
 if Teks==KATA_LALUAN then
  KStatus.Text="✅ BERJAYA!"
  KStatus.TextColor3=Color3.fromRGB(0,255,150)
  task.wait(.5)
  KeyFrame:Destroy()
  P.Visible=true
 else
  KStatus.Text="❌ Key Salah!"
  KInput.Text=""
 end
end
KBTN.MouseButton1Click:Connect(Buka)
KInput.FocusLost:Connect(function(Enter)if Enter then Buka() end end)

-- ======================================
-- 🔑 LOOP UTAMA — SEMUA BERJALAN!
-- ======================================
task.spawn(function()
 while true do
  local Delay=AntiLag and .08 or .02
  task.wait(Delay)

  -- AUTO TRAIN
  if K.A then BL() task.wait(.7) end

  -- AUTO PUNCH / FAST PUNCH
  if K.FT then BT(.12) task.wait(.22)
  elseif K.T then BT(.28) task.wait(.5) end

  -- 🪨 AUTO PUNCH ROCK — SAMA MACAM AUTO PUNCH!
  if K.Ro then BT(.25) task.wait(.4) end

  -- AUTO REBIRTH
  if K.R then
    local CB=GR()
    LR.Text="REBIRTH: "..CB.." / TARGET: "..TG
    if CB<TG then BR() task.wait(3)
    else K.R=false;BRN.Text="🔄 AUTO REBIRTH\n✅ DONE!" end
  end
 end
end)

-- FPS LOOP
task.spawn(function()
 local Lst=os.clock();local FC=0;local FPS=0
 while true do
  FC+=1;local N=os.clock()
  if N-Lst>=1 then FPS=FC;FC=0;Lst=N;if FPSShow then FPSLabel.Text="📊 FPS: "..FPS end end
  task.wait(.033)
 end
end)
