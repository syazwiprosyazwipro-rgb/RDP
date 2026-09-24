-- SYAZWI HUB l PUBLIC v8.0
local P=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local T=game:GetService("TweenService")
local LP=P.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")
for _,n in ipairs({"SYAZWIHub","SYAZWIFloatIcon"})do local o=PG:FindFirstChild(n)if o then o:Destroy()end end
local St={fr=false,sp="Normal",rc=0,arT=false,arI=false,rt=10,sr=0}
local SM={Slow=20,Normal=60,Fast=120}
local C={bg=Color3.fromRGB(15,15,18),sb=Color3.fromRGB(20,20,24),tb=Color3.fromRGB(18,18,22),cd=Color3.fromRGB(26,26,32),bd=Color3.fromRGB(40,40,48),ac=Color3.fromRGB(88,130,255),ad=Color3.fromRGB(50,70,130),tx=Color3.fromRGB(230,230,235),td=Color3.fromRGB(130,130,145),tm=Color3.fromRGB(90,90,105),gr=Color3.fromRGB(80,200,120),rd=Color3.fromRGB(220,70,90),gd=Color3.fromRGB(230,180,60)}

local SG=Instance.new("ScreenGui")
SG.Name="SYAZWIHub"SG.ResetOnSpawn=false SG.IgnoreGuiInset=true SG.DisplayOrder=999 SG.Parent=PG
local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,560,0,400)M.Position=UDim2.new(.5,-280,.5,-200)
M.BackgroundColor3=C.bg M.BorderSizePixel=0 M.Active=true M.Draggable=true M.ClipsDescendants=true M.ZIndex=1
Instance.new("UICorner",M).CornerRadius=UDim.new(0,12)
local mst=Instance.new("UIStroke",M)mst.Color=C.bd mst.Thickness=1

local TB=Instance.new("Frame",M)
TB.Size=UDim2.new(1,0,0,46)TB.BackgroundColor3=C.tb TB.BorderSizePixel=0 TB.ZIndex=10
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,12)
local tfix=Instance.new("Frame",TB)tfix.Size=UDim2.new(1,0,0,14)tfix.Position=UDim2.new(0,0,1,-14)tfix.BackgroundColor3=C.tb tfix.BorderSizePixel=0 tfix.ZIndex=10
local tdiv=Instance.new("Frame",TB)tdiv.Size=UDim2.new(1,0,0,1)tdiv.Position=UDim2.new(0,0,1,-1)tdiv.BackgroundColor3=C.bd tdiv.BorderSizePixel=0 tdiv.ZIndex=11
local CB=Instance.new("TextButton",TB)CB.Size=UDim2.new(0,32,0,32)CB.Position=UDim2.new(0,10,.5,-16)CB.BackgroundColor3=C.cd CB.Text="👑"CB.TextSize=16 CB.Font=Enum.Font.GothamBold CB.TextColor3=C.gd CB.AutoButtonColor=false CB.BorderSizePixel=0 CB.ZIndex=11
Instance.new("UICorner",CB).CornerRadius=UDim.new(0,8)
local Tt=Instance.new("TextLabel",TB)Tt.Size=UDim2.new(1,-240,1,0)Tt.Position=UDim2.new(0,52,0,0)Tt.BackgroundTransparency=1 Tt.Text="SYAZWI"Tt.TextColor3=C.tx Tt.TextSize=15 Tt.Font=Enum.Font.GothamBold Tt.TextXAlignment=Enum.TextXAlignment.Left Tt.ZIndex=11
local T2=Instance.new("TextLabel",TB)T2.Size=UDim2.new(0,130,1,0)T2.Position=UDim2.new(0,118,0,0)T2.BackgroundTransparency=1 T2.Text="HUB l PUBLIC"T2.TextColor3=C.ac T2.TextSize=15 T2.Font=Enum.Font.GothamBold T2.TextXAlignment=Enum.TextXAlignment.Left T2.ZIndex=11
local Vr=Instance.new("TextLabel",TB)Vr.Size=UDim2.new(0,55,0,20)Vr.Position=UDim2.new(0,230,.5,-10)Vr.BackgroundColor3=C.cd Vr.Text="v8.0"Vr.TextColor3=C.td Vr.TextSize=10 Vr.Font=Enum.Font.GothamBold Vr.ZIndex=11
Instance.new("UICorner",Vr).CornerRadius=UDim.new(0,5)
local MB=Instance.new("TextButton",TB)MB.Size=UDim2.new(0,28,0,28)MB.Position=UDim2.new(1,-72,.5,-14)MB.BackgroundColor3=C.cd MB.Text="−"MB.TextColor3=C.td MB.TextSize=18 MB.Font=Enum.Font.GothamBold MB.AutoButtonColor=false MB.BorderSizePixel=0 MB.ZIndex=11
Instance.new("UICorner",MB).CornerRadius=UDim.new(0,7)
local XB=Instance.new("TextButton",TB)XB.Size=UDim2.new(0,28,0,28)XB.Position=UDim2.new(1,-40,.5,-14)XB.BackgroundColor3=C.cd XB.Text="✕"XB.TextColor3=C.td XB.TextSize=13 XB.Font=Enum.Font.GothamBold XB.AutoButtonColor=false XB.BorderSizePixel=0 XB.ZIndex=11
Instance.new("UICorner",XB).CornerRadius=UDim.new(0,7)

local SB=Instance.new("Frame",M)
SB.Size=UDim2.new(0,140,1,-46)SB.Position=UDim2.new(0,0,0,46)SB.BackgroundColor3=C.sb SB.BorderSizePixel=0 SB.ZIndex=10
local sd=Instance.new("Frame",SB)sd.Size=UDim2.new(0,1,1,0)sd.Position=UDim2.new(1,-1,0,0)sd.BackgroundColor3=C.bd sd.BorderSizePixel=0 sd.ZIndex=11
local SS=Instance.new("Frame",SB)
SS.Size=UDim2.new(1,0,1,0)SS.BackgroundTransparency=1 SS.BorderSizePixel=0 SS.ZIndex=11
local SL=Instance.new("UIListLayout",SS)SL.SortOrder=Enum.SortOrder.LayoutOrder SL.Padding=UDim.new(0,4)
local SP=Instance.new("UIPadding",SS)SP.PaddingTop=UDim.new(0,12)SP.PaddingLeft=UDim.new(0,10)SP.PaddingRight=UDim.new(0,10)

local CA=Instance.new("Frame",M)
CA.Size=UDim2.new(1,-141,1,-46)CA.Position=UDim2.new(0,141,0,46)
CA.BackgroundTransparency=1 CA.BorderSizePixel=0 CA.ZIndex=5

local H={}
function H.sec(t,o)local l=Instance.new("TextLabel",SS)l.Size=UDim2.new(1,0,0,18)l.BackgroundTransparency=1 l.Text=string.upper(t)l.TextColor3=C.tm l.TextSize=10 l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left l.LayoutOrder=o l.ZIndex=12 end
function H.hdr(p,t,o)local f=Instance.new("Frame",p)f.Size=UDim2.new(1,0,0,24)f.BackgroundTransparency=1 f.BorderSizePixel=0 f.LayoutOrder=o f.ZIndex=6 local l=Instance.new("TextLabel",f)l.Size=UDim2.new(1,0,1,0)l.BackgroundTransparency=1 l.Text=string.upper(t)l.TextColor3=C.td l.TextSize=11 l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=7 end
function H.card(p,o,h)local f=Instance.new("Frame",p)f.Size=UDim2.new(1,0,0,h or 48)f.BackgroundColor3=C.cd f.BorderSizePixel=0 f.LayoutOrder=o f.ZIndex=6 Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)local s=Instance.new("UIStroke",f)s.Color=C.bd s.Thickness=1 return f end
function H.stat(p,lb,vl,cl,o)local f=H.card(p,o,48)local l=Instance.new("TextLabel",f)l.Size=UDim2.new(1,-20,0,16)l.Position=UDim2.new(0,14,0,7)l.BackgroundTransparency=1 l.Text=string.upper(lb)l.TextColor3=C.tm l.TextSize=10 l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=7 local v=Instance.new("TextLabel",f)v.Size=UDim2.new(1,-20,0,20)v.Position=UDim2.new(0,14,0,22)v.BackgroundTransparency=1 v.Text=vl v.TextColor3=cl v.TextSize=15 v.Font=Enum.Font.GothamBold v.TextXAlignment=Enum.TextXAlignment.Left v.ZIndex=7 return v end
function H.toggle(p,t,d,cb,o)
local f=H.card(p,o,48)
local l=Instance.new("TextLabel",f)l.Size=UDim2.new(1,-80,1,0)l.Position=UDim2.new(0,14,0,0)l.BackgroundTransparency=1 l.Text=t l.TextColor3=C.tx l.TextSize=13 l.Font=Enum.Font.GothamMedium l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=7
local tr=Instance.new("Frame",f)tr.Size=UDim2.new(0,40,0,22)tr.Position=UDim2.new(1,-54,.5,-11)tr.BackgroundColor3=d and C.ac or Color3.fromRGB(45,45,55)tr.BorderSizePixel=0 tr.ZIndex=7
Instance.new("UICorner",tr).CornerRadius=UDim.new(1,0)
local th=Instance.new("Frame",tr)th.Size=UDim2.new(0,16,0,16)th.Position=d and UDim2.new(1,-19,.5,-8)or UDim2.new(0,3,.5,-8)th.BackgroundColor3=Color3.fromRGB(255,255,255)th.BorderSizePixel=0 th.ZIndex=8
Instance.new("UICorner",th).CornerRadius=UDim.new(1,0)
local b=Instance.new("TextButton",f)b.Size=UDim2.new(1,0,1,0)b.BackgroundTransparency=1 b.Text=""b.ZIndex=9
local st=d
b.MouseButton1Click:Connect(function()st=not st T:Create(tr,TweenInfo.new(.2),{BackgroundColor3=st and C.ac or Color3.fromRGB(45,45,55)}):Play()T:Create(th,TweenInfo.new(.2),{Position=st and UDim2.new(1,-19,.5,-8)or UDim2.new(0,3,.5,-8)}):Play()cb(st)end)end
function H.dropdown(p,lb,op,df,cb,o)
local f=H.card(p,o,48)
local l=Instance.new("TextLabel",f)l.Size=UDim2.new(.5,-20,1,0)l.Position=UDim2.new(0,14,0,0)l.BackgroundTransparency=1 l.Text=lb l.TextColor3=C.tx l.TextSize=13 l.Font=Enum.Font.GothamMedium l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=7
local sl=Instance.new("TextLabel",f)sl.Size=UDim2.new(.5,-20,1,0)sl.Position=UDim2.new(.5,0,0,0)sl.BackgroundTransparency=1 sl.Text=df.."  ▾"sl.TextColor3=C.ac sl.TextSize=13 sl.Font=Enum.Font.GothamSemibold sl.TextXAlignment=Enum.TextXAlignment.Right sl.ZIndex=7
local b=Instance.new("TextButton",f)b.Size=UDim2.new(1,0,1,0)b.BackgroundTransparency=1 b.Text=""b.ZIndex=9
local lf=Instance.new("Frame",f)lf.Size=UDim2.new(1,0,0,#op*32+8)lf.Position=UDim2.new(0,0,1,4)lf.BackgroundColor3=C.cd lf.BorderSizePixel=0 lf.Visible=false lf.ZIndex=50
Instance.new("UICorner",lf).CornerRadius=UDim.new(0,8)
local ls=Instance.new("UIStroke",lf)ls.Color=C.bd ls.Thickness=1
local ll=Instance.new("UIListLayout",lf)ll.SortOrder=Enum.SortOrder.LayoutOrder ll.Padding=UDim.new(0,2)
local lp=Instance.new("UIPadding",lf)lp.PaddingTop=UDim.new(0,4)lp.PaddingBottom=UDim.new(0,4)lp.PaddingLeft=UDim.new(0,4)lp.PaddingRight=UDim.new(0,4)
for i,opt in ipairs(op)do
local ob=Instance.new("TextButton",lf)ob.Size=UDim2.new(1,0,0,28)ob.BackgroundColor3=(opt==df)and C.ad or Color3.fromRGB(35,35,42)ob.Text=opt ob.TextColor3=(opt==df)and Color3.fromRGB(255,255,255)or C.tx ob.TextSize=12 ob.Font=Enum.Font.GothamMedium ob.BorderSizePixel=0 ob.LayoutOrder=i ob.ZIndex=51
Instance.new("UICorner",ob).CornerRadius=UDim.new(0,6)
ob.MouseButton1Click:Connect(function()sl.Text=opt.."  ▾"for _,c in ipairs(lf:GetChildren())do if c:IsA("TextButton")then T:Create(c,TweenInfo.new(.15),{BackgroundColor3=(c.Text==opt)and C.ad or Color3.fromRGB(35,35,42),TextColor3=(c.Text==opt)and Color3.fromRGB(255,255,255)or C.tx}):Play()end end lf.Visible=false cb(opt)end)end
b.MouseButton1Click:Connect(function()lf.Visible=not lf.Visible end)end
function H.textbox(p,lb,df,cb,o)
local f=H.card(p,o,48)
local l=Instance.new("TextLabel",f)l.Size=UDim2.new(.55,-20,1,0)l.Position=UDim2.new(0,14,0,0)l.BackgroundTransparency=1 l.Text=lb l.TextColor3=C.tx l.TextSize=13 l.Font=Enum.Font.GothamMedium l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=7
local b=Instance.new("TextBox",f)b.Size=UDim2.new(.45,-28,0,32)b.Position=UDim2.new(.55,0,.5,-16)b.BackgroundColor3=Color3.fromRGB(20,20,25)b.Text=tostring(df or"")b.TextColor3=C.ac b.TextSize=13 b.Font=Enum.Font.GothamSemibold b.BorderSizePixel=0 b.ClearTextOnFocus=false b.ZIndex=7
Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
local bs=Instance.new("UIStroke",b)bs.Color=C.bd bs.Thickness=1
b.FocusLost:Connect(function()cb(b.Text)end)end
function H.info(p,t,v,cl,o)
local f=H.card(p,o,56)
local l=Instance.new("TextLabel",f)l.Size=UDim2.new(1,-20,0,14)l.Position=UDim2.new(0,14,0,8)l.BackgroundTransparency=1 l.Text=string.upper(t)l.TextColor3=C.tm l.TextSize=9 l.Font=Enum.Font.GothamBold l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=7
local v2=Instance.new("TextLabel",f)v2.Size=UDim2.new(1,-20,0,22)v2.Position=UDim2.new(0,14,0,24)v2.BackgroundTransparency=1 v2.Text=v v2.TextColor3=cl v2.TextSize=14 v2.Font=Enum.Font.GothamBold v2.TextXAlignment=Enum.TextXAlignment.Left v2.ZIndex=7 end

local Tabs={}
local AT=nil
local function crT(n,ic,o)
local b=Instance.new("TextButton",SS)b.Size=UDim2.new(1,0,0,34)b.BackgroundTransparency=1 b.Text=""b.AutoButtonColor=false b.BorderSizePixel=0 b.LayoutOrder=o b.ZIndex=12
Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
local il=Instance.new("TextLabel",b)il.Size=UDim2.new(0,20,1,0)il.Position=UDim2.new(0,8,0,0)il.BackgroundTransparency=1 il.Text=ic il.TextColor3=C.td il.TextSize=14 il.Font=Enum.Font.GothamBold il.TextXAlignment=Enum.TextXAlignment.Center il.ZIndex=13
local l=Instance.new("TextLabel",b)l.Size=UDim2.new(1,-32,1,0)l.Position=UDim2.new(0,30,0,0)l.BackgroundTransparency=1 l.Text=n l.TextColor3=C.td l.TextSize=13 l.Font=Enum.Font.GothamMedium l.TextXAlignment=Enum.TextXAlignment.Left l.ZIndex=13
-- SCROLLINGFRAME (FIX)
local pg=Instance.new("ScrollingFrame",CA)
pg.Size=UDim2.new(1,0,1,0)
pg.BackgroundTransparency=1
pg.BorderSizePixel=0
pg.Visible=false
pg.ZIndex=6
pg.ScrollBarThickness=4
pg.ScrollBarImageColor3=C.bd
pg.ScrollBarImageTransparency=0.3
pg.CanvasSize=UDim2.new(0,0,0,0)
pg.ScrollingEnabled=true
pg.ScrollingDirection=Enum.ScrollingDirection.Y
local pl=Instance.new("UIListLayout",pg)pl.SortOrder=Enum.SortOrder.LayoutOrder pl.Padding=UDim.new(0,6)
local pp=Instance.new("UIPadding",pg)pp.PaddingTop=UDim.new(0,14)pp.PaddingLeft=UDim.new(0,16)pp.PaddingRight=UDim.new(0,16)pp.PaddingBottom=UDim.new(0,20)
pl:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
pg.CanvasSize=UDim2.new(0,0,0,pl.AbsoluteContentSize.Y+30)
end)
Tabs[n]={b=b,pg=pg,il=il,l=l}
b.MouseButton1Click:Connect(function()
if AT==n then return end
for k,d in pairs(Tabs)do
local a=(k==n)d.pg.Visible=a
T:Create(d.b,TweenInfo.new(.15),{BackgroundTransparency=a and 0 or 1,BackgroundColor3=C.ad}):Play()
T:Create(d.il,TweenInfo.new(.15),{TextColor3=a and C.ac or C.td}):Play()
T:Create(d.l,TweenInfo.new(.15),{TextColor3=a and C.tx or C.td}):Play()
end
AT=n end)
return pg end

H.sec("Main",1)
local FP=crT("Fast Strength","💪",2)
local RP=crT("Auto Rebirth","🔄",3)
H.sec("Info",4)
local IP=crT("Info","ℹ️",5)

H.hdr(FP,"Status",1)
local sv=H.stat(FP,"Status","OFF",C.td,2)
local rv=H.stat(FP,"Reps Done","0",C.ac,3)
local spv=H.stat(FP,"Speed Mode","Normal",C.gd,4)
local mv=H.stat(FP,"Current Mode","AUTO",C.tx,5)
H.hdr(FP,"Configuration",6)
H.toggle(FP,"Fast Rep (Auto Train)",false,function(s)St.fr=s sv.Text=s and"ON"or"OFF"sv.TextColor3=s and C.gr or C.td end,7)
H.dropdown(FP,"Rep Speed",{"Slow","Normal","Fast"},"Normal",function(v)St.sp=v spv.Text=v end,8)

H.hdr(RP,"Rebirth Stats",1)
local crv=H.stat(RP,"Current Rebirth","0",C.gd,2)
local rgv=H.stat(RP,"Rebirth Gains","0",C.ac,3)
local trv=H.stat(RP,"Target Rebirth","10",C.gr,4)
H.hdr(RP,"Configuration",5)
H.textbox(RP,"Amount Target Rebirth",10,function(t)local n=tonumber(t)if n and n>0 then St.rt=math.floor(n)trv.Text=tostring(St.rt)end end,6)
H.toggle(RP,"Auto Rebirth",false,function(s)St.arT=s if s then St.arI=false end end,7)
H.toggle(RP,"Auto Rebirth Infinite",false,function(s)St.arI=s if s then St.arT=false end end,8)

H.hdr(IP,"About",1)
H.info(IP,"Script Name","SYAZWI HUB l PUBLIC",C.ac,2)
H.info(IP,"Script Made By","RTX_DevSyazzz",C.gd,3)
H.info(IP,"Version","v8.0",C.gr,4)
H.info(IP,"Status","NEW VERSION COMING SOON",C.rd,5)

AT="Fast Strength"
Tabs["Fast Strength"].pg.Visible=true
Tabs["Fast Strength"].b.BackgroundTransparency=0
Tabs["Fast Strength"].b.BackgroundColor3=C.ad
Tabs["Fast Strength"].il.TextColor3=C.ac
Tabs["Fast Strength"].l.TextColor3=C.tx

local FG=Instance.new("ScreenGui")
FG.Name="SYAZWIFloatIcon"FG.ResetOnSpawn=false FG.IgnoreGuiInset=true FG.DisplayOrder=1000 FG.Parent=PG
local FB=Instance.new("TextButton",FG)
FB.Size=UDim2.new(0,52,0,52)FB.Position=UDim2.new(0,20,.5,-26)FB.BackgroundColor3=C.bg FB.Text="👑"FB.TextSize=24 FB.Font=Enum.Font.GothamBold FB.TextColor3=C.gd FB.AutoButtonColor=false FB.Draggable=true FB.Visible=false
Instance.new("UICorner",FB).CornerRadius=UDim.new(1,0)
local fst=Instance.new("UIStroke",FB)fst.Color=C.ac fst.Thickness=1.5

CB.MouseButton1Click:Connect(function()T:Create(M,TweenInfo.new(.2),{Size=UDim2.new(0,0,0,0),Position=UDim2.new(.5,0,.5,0)}):Play()task.wait(.2)M.Visible=false FB.Visible=true end)
FB.MouseButton1Click:Connect(function()M.Visible=true M.Size=UDim2.new(0,0,0,0)M.Position=UDim2.new(.5,0,.5,0)T:Create(M,TweenInfo.new(.25),{Size=UDim2.new(0,560,0,400),Position=UDim2.new(.5,-280,.5,-200)}):Play()FB.Visible=false end)
local mz=false
MB.MouseButton1Click:Connect(function()mz=not mz if mz then T:Create(M,TweenInfo.new(.2),{Size=UDim2.new(0,560,0,46)}):Play()SB.Visible=false CA.Visible=false else T:Create(M,TweenInfo.new(.2),{Size=UDim2.new(0,560,0,400)}):Play()task.wait(.2)SB.Visible=true CA.Visible=true end end)
XB.MouseButton1Click:Connect(function()SG:Destroy()FG:Destroy()end)

local function gRd()local s=SM[St.sp]or 60 return math.max(2,200-((s-20)/120)*198)/1000 end
local function aC()
local c=LP.Character
if not c then return end
local hT=false
for _,t in pairs(c:GetChildren())do if t:IsA("Tool")then hT=true break end end
pcall(function()LP.muscleEvent:FireServer("punch","leftHand")LP.muscleEvent:FireServer("punch","rightHand")end)
if hT then pcall(function()for _,t in pairs(c:GetChildren())do if t:IsA("Tool")then t:Activate()break end end end)pcall(function()mv.Text="DUMBBELL"end)
else pcall(function()mv.Text="AUTO"end)end end
local rr=false
task.spawn(function()while task.wait(.05)do if St.fr and not rr then rr=true task.spawn(function()while St.fr do aC()St.rc=St.rc+1 if St.rc%5==0 then pcall(function()rv.Text=tostring(St.rc)end)end task.wait(gRd())end rr=false end)end end end)
local function gS(p,n)if not p then return 0 end local s=p:FindFirstChild(n)if s and s:IsA("ValueBase")then return s.Value end local ls=p:FindFirstChild("leaderstats")if ls then local s2=ls:FindFirstChild(n)if s2 and s2:IsA("ValueBase")then return s2.Value end end return 0 end
local function doR()
local r=RS:FindFirstChild("rEvents")
if not r then return end
r=r:FindFirstChild("rebirthRemote")
if not r then return end
local ok=pcall(function()r:InvokeServer("rebirthRequest")end)
if ok then St.sr=St.sr+1 end end
task.spawn(function()while task.wait(.5)do pcall(function()crv.Text=tostring(gS(LP,"Rebirths"))rgv.Text=tostring(St.sr)end)end end)
task.spawn(function()while task.wait(.1)do if St.arT then local c=gS(LP,"Rebirths")if c<St.rt then doR()else St.arT=false end end if St.arI then doR()end end end)
print("[SYAZWI HUB l PUBLIC] v8.0 loaded 👑")
