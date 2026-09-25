--[[ SYAZWI HUB | PUBLIC | by MLYC_SyazwiOnTop | v9.7 ]]
local P=game:GetService("Players")local VU=game:GetService("VirtualUser")local RS=game:GetService("ReplicatedStorage")local UIS=game:GetService("UserInputService")local TS=game:GetService("TweenService")local L=game:GetService("Lighting")local LP=P.LocalPlayer local PG=LP:WaitForChild("PlayerGui")
local AC=Color3.fromRGB(60,120,255)local BG=Color3.fromRGB(255,255,255)local SD=Color3.fromRGB(248,248,250)local EL=Color3.fromRGB(255,255,255)local HV=Color3.fromRGB(240,240,245)local TX=Color3.fromRGB(30,30,35)local SB=Color3.fromRGB(110,110,120)local ST=Color3.fromRGB(220,220,225)local GR=Color3.fromRGB(46,204,113)local RD=Color3.fromRGB(231,76,60)
pcall(function()for _,g in pairs(PG:GetChildren())do if g.Name:find("SW")then g:Destroy()end end end)
local function N(c,p)local o=Instance.new(c)for k,v in pairs(p)do o[k]=v end return o end
local function R(p,r)return N("UICorner",{CornerRadius=UDim.new(0,r or 8),Parent=p})end
local function S(p,c,t)return N("UIStroke",{Color=c or ST,Thickness=t or 1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=p})end
local function F(n)n=tonumber(n)or 0 if n>=1e15 then return string.format("%.2fQa",n/1e15)elseif n>=1e12 then return string.format("%.2fT",n/1e12)elseif n>=1e9 then return string.format("%.2fB",n/1e9)elseif n>=1e6 then return string.format("%.2fM",n/1e6)elseif n>=1e3 then return string.format("%.2fK",n/1e3)else return string.format("%.0f",n)end end
-- LOADING
local G=N("ScreenGui",{Name="SWL",ResetOnSpawn=false,DisplayOrder=99999999,IgnoreGuiInset=true,Parent=PG})
local Bg=N("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(250,250,255),BorderSizePixel=0,Parent=G})
N("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(240,245,255)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(240,245,255))}),Parent=Bg})
local T1=N("TextLabel",{Size=UDim2.new(0,700,0,55),Position=UDim2.new(0.5,-350,0.5,-40),BackgroundTransparency=1,Text="SYAZWI HUB | PUBLIC",TextSize=40,Font=Enum.Font.GothamBlack,TextColor3=AC,Parent=G})
local T2=N("TextLabel",{Size=UDim2.new(0,600,0,25),Position=UDim2.new(0.5,-300,0.5,15),BackgroundTransparency=1,Text="FAST STRENGTH v9.7",TextSize=15,Font=Enum.Font.Gotham,TextColor3=SB,Parent=G})
local BB=N("Frame",{Size=UDim2.new(0,450,0,14),Position=UDim2.new(0.5,-225,0.5,70),BackgroundColor3=Color3.fromRGB(230,230,240),BorderSizePixel=0,Parent=G})R(BB,7)
local BF=N("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=AC,BorderSizePixel=0,Parent=BB})R(BF,7)
local Pc=N("TextLabel",{Size=UDim2.new(0,450,0,22),Position=UDim2.new(0.5,-225,0.5,90),BackgroundTransparency=1,Text="0%",TextSize=15,Font=Enum.Font.GothamBold,TextColor3=AC,Parent=G})
T1.TextTransparency=1 T2.TextTransparency=1
TS:Create(T1,TweenInfo.new(0.4),{TextTransparency=0}):Play()
task.delay(0.2,function()TS:Create(T2,TweenInfo.new(0.3),{TextTransparency=0}):Play()end)
for i=1,30 do pcall(function()BF.Size=UDim2.new(0,(i/30)*450,1,0)Pc.Text=math.floor((i/30)*100).."%"end)task.wait(0.03)end
Pc.Text="READY" Pc.TextColor3=GR task.wait(0.2)
for _,o in pairs({T1,T2,Pc})do TS:Create(o,TweenInfo.new(0.2),{TextTransparency=1}):Play()end
TS:Create(Bg,TweenInfo.new(0.25),{BackgroundTransparency=1}):Play()
TS:Create(BB,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
TS:Create(BF,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
task.wait(0.4)G:Destroy()
-- UI
local SG=N("ScreenGui",{Name="SWUI",ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Parent=PG})
local M=N("Frame",{Size=UDim2.new(0,540,0,400),Position=UDim2.new(0.5,-270,0.5,-200),BackgroundColor3=BG,BorderSizePixel=0,Active=true,Draggable=true,Parent=SG})R(M,12)S(M,ST,1)
local Tp=N("Frame",{Size=UDim2.new(1,0,0,38),BackgroundColor3=SD,BorderSizePixel=0,Parent=M})R(Tp,12)
N("Frame",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,0,1,-12),BackgroundColor3=SD,BorderSizePixel=0,Parent=Tp})
N("TextLabel",{Size=UDim2.new(1,-80,1,0),Position=UDim2.new(0,16,0,0),BackgroundTransparency=1,Text="SYAZWI HUB | PUBLIC",TextColor3=TX,Font=Enum.Font.GothamBold,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Parent=Tp})
local CB=N("TextButton",{Size=UDim2.new(0,26,0,26),Position=UDim2.new(1,-34,0.5,-13),BackgroundColor3=RD,Text="X",TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.GothamBold,TextSize=13,AutoButtonColor=false,Parent=Tp})R(CB,6)
local Sd=N("Frame",{Size=UDim2.new(0,160,1,-38),Position=UDim2.new(0,0,0,38),BackgroundColor3=SD,BorderSizePixel=0,Parent=M})
N("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,Parent=Sd})
N("UIPadding",{PaddingTop=UDim.new(0,10),PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=Sd})
local Cn=N("Frame",{Size=UDim2.new(1,-160,1,-38),Position=UDim2.new(0,160,0,38),BackgroundTransparency=1,Parent=M})
N("UIPadding",{PaddingTop=UDim.new(0,15),PaddingBottom=UDim.new(0,15),PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=Cn})
local Tb,TB,Cu={},{},nil
local function Sl(n)for k,v in pairs(Tb)do v.Visible=(k==n)end for k,b in pairs(TB)do local a=(k==n)TS:Create(b,TweenInfo.new(0.15),{BackgroundColor3=a and AC or EL,TextColor3=a and Color3.fromRGB(255,255,255)or SB}):Play()end Cu=n end
local function MT(n,i)
local b=N("TextButton",{Size=UDim2.new(1,0,0,34),BackgroundColor3=EL,Text="  "..i.."  "..n,TextColor3=SB,Font=Enum.Font.GothamMedium,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,Parent=Sd})R(b,6)
b.MouseEnter:Connect(function()if Cu~=n then TS:Create(b,TweenInfo.new(0.1),{BackgroundColor3=HV}):Play()end end)
b.MouseLeave:Connect(function()if Cu~=n then TS:Create(b,TweenInfo.new(0.1),{BackgroundColor3=EL}):Play()end end)
b.MouseButton1Click:Connect(function()Sl(n)end)TB[n]=b
local f=N("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=AC,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false,Parent=Cn})
N("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,Parent=f})Tb[n]=f return f end
local function Sec(p,t)N("TextLabel",{Size=UDim2.new(1,0,0,22),BackgroundTransparency=1,Text=t,TextColor3=AC,Font=Enum.Font.GothamBold,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Parent=p})end
local function Lb(p,t)return N("TextLabel",{Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,Text=t,TextColor3=SB,Font=Enum.Font.GothamMedium,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=p})end
local function Bt(p,t,cb)local b=N("TextButton",{Size=UDim2.new(1,0,0,32),BackgroundColor3=EL,Text=t,TextColor3=TX,Font=Enum.Font.GothamMedium,TextSize=12,AutoButtonColor=false,Parent=p})R(b,6)S(b,ST,1)b.MouseEnter:Connect(function()TS:Create(b,TweenInfo.new(0.1),{BackgroundColor3=HV}):Play()end)b.MouseLeave:Connect(function()TS:Create(b,TweenInfo.new(0.1),{BackgroundColor3=EL}):Play()end)b.MouseButton1Click:Connect(function()if cb then pcall(cb)end end)end
local function Dd(p,t,o,d,cb)
local s,op=d or o[1],false
local h=N("Frame",{Size=UDim2.new(1,0,0,34),BackgroundColor3=EL,ClipsDescendants=true,Parent=p})R(h,6)S(h,ST,1)
local b=N("TextButton",{Size=UDim2.new(1,0,0,34),BackgroundColor3=EL,Text="",AutoButtonColor=false,Parent=h})
N("TextLabel",{Size=UDim2.new(0.5,0,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text=t,TextColor3=SB,Font=Enum.Font.GothamMedium,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=b})
local v=N("TextLabel",{Size=UDim2.new(0.5,-24,1,0),Position=UDim2.new(0.5,12,0,0),BackgroundTransparency=1,Text=s.." ▼",TextColor3=TX,Font=Enum.Font.GothamMedium,TextSize=12,TextXAlignment=Enum.TextXAlignment.Right,Parent=b})
local ls=N("Frame",{Size=UDim2.new(1,0,0,#o*28),Position=UDim2.new(0,0,0,34),BackgroundColor3=EL,Parent=h})
N("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Parent=ls})
for i,x in ipairs(o)do local ob=N("TextButton",{Size=UDim2.new(1,0,0,28),BackgroundColor3=EL,Text="  "..x,TextColor3=TX,Font=Enum.Font.GothamMedium,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,LayoutOrder=i,Parent=ls})
ob.MouseEnter:Connect(function()ob.BackgroundColor3=HV end)ob.MouseLeave:Connect(function()ob.BackgroundColor3=EL end)
ob.MouseButton1Click:Connect(function()s=x v.Text=x.." ▼"op=false TS:Create(h,TweenInfo.new(0.15),{Size=UDim2.new(1,0,0,34)}):Play()if cb then cb(x)end end)end
b.MouseButton1Click:Connect(function()op=not op TS:Create(h,TweenInfo.new(0.15),{Size=op and UDim2.new(1,0,0,34+#o*28)or UDim2.new(1,0,0,34)}):Play()end)end
local function Tg(p,t,d,cb)
local st=d or false
local h=N("Frame",{Size=UDim2.new(1,0,0,36),BackgroundColor3=EL,Parent=p})R(h,6)S(h,ST,1)
N("TextLabel",{Size=UDim2.new(1,-80,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text=t,TextColor3=TX,Font=Enum.Font.GothamMedium,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=h})
local s=N("TextLabel",{Size=UDim2.new(0,40,1,0),Position=UDim2.new(1,-84,0,0),BackgroundTransparency=1,Text=st and "ON"or"OFF",TextColor3=st and GR or RD,Font=Enum.Font.GothamBold,TextSize=11,Parent=h})
local g=N("Frame",{Size=UDim2.new(0,32,0,16),Position=UDim2.new(1,-42,0.5,-8),BackgroundColor3=st and AC or Color3.fromRGB(200,200,205),Parent=h})R(g,8)
local k=N("Frame",{Size=UDim2.new(0,12,0,12),Position=st and UDim2.new(1,-14,0,2)or UDim2.new(0,2,0,2),BackgroundColor3=Color3.fromRGB(255,255,255),Parent=g})R(k,6)
local b=N("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="",Parent=h})
local function u()TS:Create(g,TweenInfo.new(0.15),{BackgroundColor3=st and AC or Color3.fromRGB(200,200,205)}):Play()TS:Create(k,TweenInfo.new(0.15),{Position=st and UDim2.new(1,-14,0,2)or UDim2.new(0,2,0,2)}):Play()s.Text=st and "ON"or"OFF"s.TextColor3=st and GR or RD if cb then pcall(cb,st)end end
b.MouseButton1Click:Connect(function()st=not st u()end)end
local function Tx(p,t,ph,d,cb)
local h=N("Frame",{Size=UDim2.new(1,0,0,52),BackgroundColor3=EL,Parent=p})R(h,6)S(h,ST,1)
N("TextLabel",{Size=UDim2.new(1,-24,0,16),Position=UDim2.new(0,12,0,6),BackgroundTransparency=1,Text=t,TextColor3=TX,Font=Enum.Font.GothamMedium,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=h})
local x=N("TextBox",{Size=UDim2.new(1,-24,0,22),Position=UDim2.new(0,12,1,-26),BackgroundColor3=Color3.fromRGB(245,245,248),Text=d or"",PlaceholderText=ph or"",PlaceholderColor3=SB,TextColor3=TX,Font=Enum.Font.GothamMedium,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,Parent=h})R(x,5)S(x,ST,1)
x.FocusLost:Connect(function()if cb then pcall(cb,x.Text)end end)return x end
-- STATE
local FR,IA=false,false
local SM="Normal"
local Sp={Slow=0.3,Normal=0.05,Fast=0.01,["Super Fast"]=0.001}
local T0,SS,CS,GS=os.time(),0,0,0
local function gS()local ok,v=pcall(function()return LP.leaderstats.Strength.Value end)return ok and v or 0 end
local function gR()local ok,v=pcall(function()return LP.leaderstats.Rebirths.Value end)return ok and v or 0 end
local function SF()
task.spawn(function()while FR do
pcall(function()local c=LP.Character if c then
local t=c:FindFirstChildOfClass("Tool")if t then t:Activate()end
local ME=LP:FindFirstChild("muscleEvent")if ME then ME:FireServer()end
local h=c:FindFirstChildOfClass("Humanoid")if h and h.Sit then
local BE=LP:FindFirstChild("bodyMovementEvent")if BE then BE:FireServer()end end end end)
task.wait(Sp[SM]or 0.05)end end)end
local AR,RT=false,0
local function DR()local rE=RS:FindFirstChild("rEvents")if rE then local rR=rE:FindFirstChild("rebirthRemote")if rR then pcall(function()rR:InvokeServer("rebirthRequest")end)end end end
local function SR()
task.spawn(function()while AR do
pcall(function()if RT~=math.huge and RT>0 and gR()>=RT then AR=false return end DR()end)
task.wait()end end)end
local LK,AF,AL=false,true,true
local SP
local function SL()
task.spawn(function()while LK do
pcall(function()local c=LP.Character if c and c:FindFirstChild("HumanoidRootPart")then
if not SP then SP=c.HumanoidRootPart.CFrame end c.HumanoidRootPart.CFrame=SP end end)
task.wait(0.1)end end)end
local function SA()
task.spawn(function()while AL do
pcall(function()for _,v in ipairs(workspace:GetDescendants())do
if v:IsA("ParticleEmitter")or v:IsA("Trail")or v:IsA("Smoke")or v:IsA("Fire")then v.Enabled=false end end end)
task.wait(5)end end)end
LP.Idled:Connect(function()if AF then pcall(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)end end)
-- TABS
local M1=MT("Main","🏠")
Sec(M1,"Welcome")Lb(M1,"SYAZWI HUB | PUBLIC")Lb(M1,"Fast Strength v9.7")
Sec(M1,"User Settings")
Tx(M1,"Character Size","1","1",function(t)local n=tonumber(t)if n and n>0 then pcall(function()local c=LP.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.BodyDepthScale.Value=n h.BodyHeightScale.Value=n h.BodyWidthScale.Value=n h.HeadScale.Value=n end end end)end end)
Tx(M1,"FOV","70","70",function(t)local n=tonumber(t)if n and n>=30 and n<=120 then pcall(function()local cm=workspace.CurrentCamera if cm then cm.FieldOfView=n end end)end end)
Tx(M1,"WalkSpeed","16","16",function(t)local n=tonumber(t)if n and n>=0 then pcall(function()local c=LP.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=n end end end)end end)
Sec(M1,"Protection")
Tg(M1,"Lock Position",false,function(v)LK=v if v then SP=nil SL()end end)
Tg(M1,"Anti AFK",true,function(v)AF=v end)
Tg(M1,"AntiLag",true,function(v)AL=v if v then SA()end end)
Sec(M1,"Misc")
Dd(M1,"Change Time",{"Day","Night","Sunset","Sunrise"},"Day",function(v)pcall(function()if v=="Day"then L.TimeOfDay="14:00:00"elseif v=="Night"then L.TimeOfDay="00:00:00"elseif v=="Sunset"then L.TimeOfDay="18:00:00"elseif v=="Sunrise"then L.TimeOfDay="06:00:00"end end)end)
local F1=MT("Fast Strength","⚡")
Sec(F1,"Fast Strength")
local T1_=Lb(F1,"⏱ Time: 0h 0m 0s - Inactive")
local P1_=Lb(F1,"📈 Pace: 0 /Hour")
local A1_=Lb(F1,"📊 Avg: 0 /Hour")
local S1_=Lb(F1,"💪 Strength: 0 | Gained: 0")
local M1_=Lb(F1,"⚡ Mode: Normal")
Dd(F1,"Select Speed Mode",{"Slow","Normal","Fast","Super Fast"},"Normal",function(v)SM=v M1_.Text="⚡ Mode: "..v end)
Tg(F1,"Fast Rep",false,function(v)FR,IA=v,v if v then T0=os.time()SS=gS()SF()end end)
Sec(F1,"How To Use")Lb(F1,"• Tool: Hold dumbbell → ON")Lb(F1,"• Gym Machine: Sit → ON")
local A1=MT("Auto Rebirth","🔄")
Sec(A1,"Rebirth Info")local RB1=Lb(A1,"🔄 Rebirths: 0")
Sec(A1,"Rebirth Settings")
local TV=1
local TBx=Tx(A1,"Target Rebirth","100","1",function(t)local n=tonumber(t)if n and n>0 then TV=math.floor(n)else TBx.Text=tostring(TV)end end)
Tg(A1,"Auto Rebirth [Target]",false,function(v)AR=v RT=TV if v then SR()end end)
Tg(A1,"Auto Rebirth Infinite",false,function(v)if v then AR=true RT=math.huge SR()else AR=false RT=0 end end)
Sec(A1,"Protection")
Tg(A1,"Lock Position",true,function(v)LK=v if v then SP=nil SL()end end)
Tg(A1,"Anti Afk",true,function(v)AF=v end)
Tg(A1,"AntiLag",true,function(v)AL=v if v then SA()end end)
local ST1=MT("Settings","⚙️")
Sec(ST1,"UI Settings")
Bt(ST1,"Unload UI",function()FR,AR,LK,AL=false,false,false,false SG:Destroy()pcall(function()local f=PG:FindFirstChild("SWF")if f then f:Destroy()end end)end)
-- FLOAT AVATAR
local FG=N("ScreenGui",{Name="SWF",ResetOnSpawn=false,DisplayOrder=999999,Parent=PG})
local FB=N("ImageButton",{Size=UDim2.new(0,48,0,48),Position=UDim2.new(0,14,0.5,-24),BackgroundColor3=BG,Image="https://www.roblox.com/headshot-thumbnail/image?userId="..LP.UserId.."&width=150&height=150&format=png",AutoButtonColor=false,Draggable=true,Visible=false,Parent=FG})
R(FB,12)S(FB,Color3.fromRGB(255,255,255),2)
N("ImageLabel",{Size=UDim2.new(1,12,1,12),Position=UDim2.new(0,-6,0,-6),BackgroundTransparency=1,Image="rbxassetid://6014261993",ImageColor3=Color3.fromRGB(0,0,0),ImageTransparency=0.7,ZIndex=FB.ZIndex-1,Parent=FB})
CB.MouseButton1Click:Connect(function()M.Visible=false FB.Visible=true end)
FB.MouseButton1Click:Connect(function()M.Visible=true FB.Visible=false end)
-- UPDATE LOOP
task.spawn(function()while SG.Parent do
if IA then CS=gS()GS=CS-SS local e=os.time()-T0 local h,m,s=math.floor(e/3600),math.floor((e%3600)/60),e%60
T1_.Text=string.format("⏱ Time: %dh %dm %ds - Active",h,m,s)
if e>0 then local p=(GS/e)*3600 P1_.Text=string.format("📈 Pace: %s /Hour | %s /Day | %s /Week",F(p),F(p*24),F(p*168))A1_.Text=string.format("📊 Avg: %s /Hour | %s /Day | %s /Week",F(p),F(p*24),F(p*168))end
S1_.Text=string.format("💪 Strength: %s | Gained: %s",F(CS),F(GS))else T1_.Text="⏱ Time: 0h 0m 0s - Inactive"end
RB1.Text="🔄 Rebirths: "..F(gR())task.wait(1)end end)
UIS.InputBegan:Connect(function(i,g)if g then return end if i.KeyCode==Enum.KeyCode.RightControl then if M.Visible then M.Visible=false FB.Visible=true else M.Visible=true FB.Visible=false end end end)
Sl("Fast Strength")print("[SYAZWI HUB] Loaded.")
