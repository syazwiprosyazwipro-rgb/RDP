-- OBRK CLAN l PRIVATE | Key: OBRKONTOP
local P=game:GetService("Players")local R=game:GetService("ReplicatedStorage")local T=game:GetService("TweenService")local U=game:GetService("UserInputService")local V=game:GetService("VirtualInputManager")local L=P.LocalPlayer local KEY="OBRKONTOP"
local function mk(c,p,t)local o=Instance.new(c)for k,v in pairs(t)do o[k]=v end o.Parent=p return o end
-- KEY UI
local kg=mk("ScreenGui",L:WaitForChild("PlayerGui"),{Name="OBRK_Key",ResetOnSpawn=false,IgnoreGuiInset=true})
mk("Frame",kg,{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.new(),BackgroundTransparency=.5,BorderSizePixel=0})
local card=mk("Frame",kg,{Size=UDim2.new(0,380,0,240),Position=UDim2.new(.5,-190,.5,-120),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0})
mk("UICorner",card,{CornerRadius=UDim.new(0,12)})
mk("UIStroke",card,{Color=Color3.fromRGB(225,225,230)})
mk("TextLabel",card,{Size=UDim2.new(1,0,0,40),Position=UDim2.new(0,0,0,18),BackgroundTransparency=1,Text="🔥",TextSize=32,Font=Enum.Font.GothamBold})
mk("TextLabel",card,{Size=UDim2.new(1,0,0,24),Position=UDim2.new(0,0,0,60),BackgroundTransparency=1,Text="OBRK CLAN l PRIVATE",TextColor3=Color3.fromRGB(30,30,35),Font=Enum.Font.GothamBold,TextSize=16})
mk("TextLabel",card,{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,84),BackgroundTransparency=1,Text="Masukkan key",TextColor3=Color3.fromRGB(120,120,130),Font=Enum.Font.Gotham,TextSize=12})
local tb=mk("TextBox",card,{Size=UDim2.new(1,-48,0,40),Position=UDim2.new(0,24,0,115),BackgroundColor3=Color3.fromRGB(248,248,250),BorderSizePixel=0,Text="",PlaceholderText="Taip key...",Font=Enum.Font.GothamMedium,TextSize=14,ClearTextOnFocus=false})
mk("UICorner",tb,{CornerRadius=UDim.new(0,8)})
local stl=mk("TextLabel",card,{Size=UDim2.new(1,-48,0,16),Position=UDim2.new(0,24,0,160),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(220,60,60),Font=Enum.Font.GothamMedium,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left})
local sbt=mk("TextButton",card,{Size=UDim2.new(1,-48,0,40),Position=UDim2.new(0,24,0,182),BackgroundColor3=Color3.fromRGB(0,120,215),Text="🔥 SUBMIT KEY",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=13})
mk("UICorner",sbt,{CornerRadius=UDim.new(0,8)})
card.Size=UDim2.new(0,380,0,0)T:Create(card,TweenInfo.new(.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,380,0,240)}):Play()
local function main()
local fN=function(n)if n>=1e18 then return string.format("%.2fQi",n/1e18)end if n>=1e15 then return string.format("%.2fQa",n/1e15)end if n>=1e12 then return string.format("%.2fT",n/1e12)end if n>=1e9 then return string.format("%.2fB",n/1e9)end if n>=1e6 then return string.format("%.2fM",n/1e6)end if n>=1e3 then return string.format("%.2fK",n/1e3)end return string.format("%.0f",n)end
local fR=function(s)return string.format("%dd %dh %dm %ds",math.floor(s/86400),math.floor(s%86400/3600),math.floor(s%3600/60),math.floor(s%60))end
local PETS={["Omega Overlord"]={r=20},["Swift Samurai"]={r=15},["Powercore Hound"]={s=25,d=15},["Titanium Hydra"]={b=2},["Tribal Overlord"]={b=2},["Inferno Unicorn"]={s=25,d=25},["Common Boss Pet"]={r=5},["Rare Boss Pet"]={r=7},["Epic Boss Pet"]={r=10},["Rainbow Boss Pet"]={r=10,s=7},["Legendary Boss Pet"]={r=10,s=10},["Mythic Boss Pet"]={r=10,s=20},["Inferno Drake"]={r=40}}
local rE=R:WaitForChild("rEvents",30)local eEv=rE and rE:FindFirstChild("equipPetEvent")local rbR=rE and rE:FindFirstChild("rebirthRemote")local mEv=L:WaitForChild("muscleEvent",30)local pF=L:WaitForChild("petsFolder",30)
local unq=function()if not pF then return end for _,f in ipairs(pF:GetChildren())do if f:IsA("Folder")then for _,p in ipairs(f:GetChildren())do pcall(function()eEv:FireServer("unequipPet",p)end)end end end task.wait(.1)end
local eP=function(p)pcall(function()eEv:FireServer("equipPet",p)end)end
local getO=function()local o={}if not pF then return o end for _,f in ipairs(pF:GetChildren())do if f:IsA("Folder")then for _,p in ipairs(f:GetChildren())do local x=PETS[p.Name]if x then table.insert(o,{i=p,r=x.r or 0,s=x.s or 0,d=x.d or 0,b=x.b or 0})end end end end return o end
local eqF=function()unq()local ps=getO()local e,n,rs={},0,0 table.sort(ps,function(a,b)return a.r>b.r end)for _,p in ipairs(ps)do if n>=12 or rs>=100 then break end if p.r>0 then eP(p.i)e[p.i]=true n=n+1 rs=rs+p.r end end local q={}for _,p in ipairs(ps)do if not e[p.i]then table.insert(q,p)end end table.sort(q,function(a,b)return a.s+a.d>b.s+b.d end)for _,p in ipairs(q)do if n>=12 then break end if p.s>0 or p.d>0 then eP(p.i)n=n+1 end end end
local eqR=function()unq()local ps=getO()table.sort(ps,function(a,b)return a.b>b.b end)local n=0 for _,p in ipairs(ps)do if n>=12 then break end if p.b>0 then eP(p.i)n=n+1 end end end
local ls=L:WaitForChild("leaderstats",30)local sRB=ls and ls:WaitForChild("Rebirths",30)local sST=ls and ls:WaitForChild("Strength",30)local sDU=L:WaitForChild("Durability",30)
local G=mk("ScreenGui",L:WaitForChild("PlayerGui"),{Name="OBRK_CLAN",ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling})
local fb=mk("TextButton",G,{Size=UDim2.new(0,110,0,34),Position=UDim2.new(0,20,.5,-17),BackgroundColor3=Color3.fromRGB(0,120,215),Text="🔥 OBRK CLAN",TextColor3=Color3.new(1,1,1),Font=Enum.Font.GothamBold,TextSize=13,Visible=false})
mk("UICorner",fb,{CornerRadius=UDim.new(0,6)})
local M=mk("Frame",G,{Size=UDim2.new(0,560,0,400),Position=UDim2.new(.5,-280,.5,-200),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Active=true,Draggable=true,ClipsDescendants=true})
mk("UICorner",M,{CornerRadius=UDim.new(0,10)})
mk("UIStroke",M,{Color=Color3.fromRGB(225,225,230)})
local Tb=mk("Frame",M,{Size=UDim2.new(1,0,0,42),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0})
mk("UICorner",Tb,{CornerRadius=UDim.new(0,10)})
mk("Frame",Tb,{Size=UDim2.new(1,0,0,10),Position=UDim2.new(0,0,1,-10),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0})
mk("TextLabel",Tb,{Size=UDim2.new(0,30,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text="🔥",TextSize=18,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left})
mk("TextLabel",Tb,{Size=UDim2.new(1,-130,1,0),Position=UDim2.new(0,44,0,0),BackgroundTransparency=1,Text="OBRK CLAN l PRIVATE",TextColor3=Color3.fromRGB(30,30,35),Font=Enum.Font.GothamBold,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left})
local hb=mk("TextButton",Tb,{Size=UDim2.new(0,26,0,26),Position=UDim2.new(1,-66,.5,-13),BackgroundColor3=Color3.fromRGB(240,240,240),Text="—",TextColor3=Color3.fromRGB(120,120,130),Font=Enum.Font.GothamBold,TextSize=14})
mk("UICorner",hb,{CornerRadius=UDim.new(0,5)})
local cb2=mk("TextButton",Tb,{Size=UDim2.new(0,26,0,26),Position=UDim2.new(1,-36,.5,-13),BackgroundColor3=Color3.fromRGB(240,240,240),Text="X",TextColor3=Color3.fromRGB(120,120,130),Font=Enum.Font.GothamBold,TextSize=12})
mk("UICorner",cb2,{CornerRadius=UDim.new(0,5)})
local Sd=mk("Frame",M,{Size=UDim2.new(0,140,1,-42),Position=UDim2.new(0,0,0,42),BackgroundColor3=Color3.fromRGB(248,248,250),BorderSizePixel=0})
mk("Frame",Sd,{Size=UDim2.new(0,10,1,0),Position=UDim2.new(1,-10,0,0),BackgroundColor3=Color3.fromRGB(248,248,250),BorderSizePixel=0})
local Tc=mk("Frame",Sd,{Size=UDim2.fromScale(1,1),BackgroundTransparency=1})
mk("UIListLayout",Tc,{Padding=UDim.new(0,4)})
mk("UIPadding",Tc,{PaddingTop=UDim.new(0,12),PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10)})
local Ct=mk("Frame",M,{Size=UDim2.new(1,-140,1,-42),Position=UDim2.new(0,140,0,42),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0})
mk("UICorner",Ct,{CornerRadius=UDim.new(0,10)})
local tabs,pg,at={},{},nil
local mkP=function(n)local p=mk("ScrollingFrame",Ct,{Size=UDim2.new(1,-24,1,-24),Position=UDim2.new(0,12,0,12),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=2,ScrollBarImageColor3=Color3.fromRGB(225,225,230),CanvasSize=UDim2.new(),Visible=false})local l=mk("UIListLayout",p,{Padding=UDim.new(0,6)})mk("UIPadding",p,{PaddingRight=UDim.new(0,8)})l:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()p.CanvasSize=UDim2.new(0,0,0,l.AbsoluteContentSize.Y+10)end)pg[n]=p end
local mkT=function(n,ic)local b=mk("TextButton",Tc,{Size=UDim2.new(1,0,0,34),BackgroundColor3=Color3.fromRGB(248,248,250),Text="  "..ic.."  "..n,TextColor3=Color3.fromRGB(120,120,130),Font=Enum.Font.GothamMedium,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false})mk("UICorner",b,{CornerRadius=UDim.new(0,6)})local i=mk("Frame",b,{Size=UDim2.new(0,3,.6,0),Position=UDim2.new(0,0,.2,0),BackgroundColor3=Color3.fromRGB(0,120,215),BorderSizePixel=0,Visible=false})mk("UICorner",i,{CornerRadius=UDim.new(1,0)})tabs[n]={B=b,I=i}b.MouseButton1Click:Connect(function()at=n for tn,td in pairs(tabs)do local a=(tn==n)td.B.BackgroundColor3=a and Color3.fromRGB(255,255,255)or Color3.fromRGB(248,248,250)td.B.TextColor3=a and Color3.fromRGB(30,30,35)or Color3.fromRGB(120,120,130)td.I.Visible=a if pg[tn]then pg[tn].Visible=a end end end)mkP(n)end
local mkC=function(par,h)local c=mk("Frame",par,{Size=UDim2.new(1,-8,0,h or 44),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0})mk("UICorner",c,{CornerRadius=UDim.new(0,6)})mk("UIStroke",c,{Color=Color3.fromRGB(225,225,230)})return c end
local aL=function(par,tx,co,sz)return mk("TextLabel",par,{Size=UDim2.new(1,-8,0,sz or 20),BackgroundTransparency=1,Text=tx,TextColor3=co or Color3.fromRGB(30,30,35),Font=Enum.Font.GothamMedium,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left})end
local aT=function(par,tx,df,cb)local c=mkC(par,44)mk("TextLabel",c,{Size=UDim2.new(1,-70,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text=tx,TextColor3=Color3.fromRGB(30,30,35),Font=Enum.Font.GothamMedium,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left})local tr=mk("Frame",c,{Size=UDim2.new(0,36,0,20),Position=UDim2.new(1,-52,.5,-10),BackgroundColor3=df and Color3.fromRGB(0,120,215)or Color3.fromRGB(200,200,205),BorderSizePixel=0})mk("UICorner",tr,{CornerRadius=UDim.new(1,0)})local kn=mk("Frame",tr,{Size=UDim2.new(0,16,0,16),Position=df and UDim2.new(0,18,.5,-8)or UDim2.new(0,2,.5,-8),BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0})mk("UICorner",kn,{CornerRadius=UDim.new(1,0)})local ck=mk("TextButton",c,{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text=""})local v=df or false ck.MouseButton1Click:Connect(function()v=not v T:Create(tr,TweenInfo.new(.15),{BackgroundColor3=v and Color3.fromRGB(0,120,215)or Color3.fromRGB(200,200,205)}):Play()T:Create(kn,TweenInfo.new(.15),{Position=v and UDim2.new(0,18,.5,-8)or UDim2.new(0,2,.5,-8)}):Play()if cb then pcall(cb,v)end end)return c end
local aB=function(par,tx,cb)local b=mk("TextButton",par,{Size=UDim2.new(1,-8,0,36),BackgroundColor3=Color3.fromRGB(255,255,255),Text=tx,TextColor3=Color3.fromRGB(30,30,35),Font=Enum.Font.GothamMedium,TextSize=13})mk("UICorner",b,{CornerRadius=UDim.new(0,6)})mk("UIStroke",b,{Color=Color3.fromRGB(225,225,230)})b.MouseButton1Click:Connect(function()T:Create(b,TweenInfo.new(.06),{BackgroundColor3=Color3.fromRGB(0,120,215)}):Play()task.delay(.1,function()T:Create(b,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()end)pcall(cb)end)return b end
  mkT("Rebirths","🔄")mkT("Strength","💪")mkT("Slower","🐢")mkT("Other","⚙️")mkT("Info","ℹ️")
local rp=pg["Rebirths"]
local rbS=aL(rp,"Status: Inactive",Color3.fromRGB(220,60,60))
local rbR2=aL(rp,"Runtime: 0d 0h 0m 0s")
local rbSt=aL(rp,"Rebirths: 0 | Gained: 0")
local rbP=aL(rp,"Pace: -- / Hour | -- / Day | -- / Week")
local rbs={run=false,wa=false,sAt=0,tS=false,tot=0,has=false,start=sRB and sRB.Value or 0,gB=false,lrAt=tick(),lrV=sRB and sRB.Value or 0,pR=false}
aT(rp,"Fast Rebirth",false,function(v)rbs.run=v if v then rbs.has=true rbs.tS=false if not rbs.gB then rbs.start=sRB.Value rbs.gB=true end rbs.lrAt=tick()rbs.lrV=sRB.Value rbs.pR=false rbS.Text="Status: Rebirthing"rbS.TextColor3=Color3.fromRGB(46,204,113)else if rbs.tS and rbs.sAt>0 then rbs.tot=rbs.tot+tick()-rbs.sAt rbs.sAt=0 rbs.tS=false end rbS.Text=rbs.has and"Status: Paused"or"Status: Inactive"rbS.TextColor3=rbs.has and Color3.fromRGB(241,196,15)or Color3.fromRGB(220,60,60)end end)
local sp=pg["Strength"]
local stS=aL(sp,"Status: Inactive",Color3.fromRGB(220,60,60))
local stR=aL(sp,"Runtime: 0d 0h 0m 0s")
local stSt=aL(sp,"Strength: 0 | Gained: 0")
local stD=aL(sp,"Durability: 0 | Gained: 0")
local st={run=false,wa=false,sAt=0,tot=0,tS=false,gB=false,start=sST and sST.Value or 0,startD=sDU and sDU.Value or 0,lCAt2=tick(),lCS2=sST and sST.Value or 0,lCD2=sDU and sDU.Value or 0,iR=500,mR=999,sR=500,tok=0,mB=60,cI2=.35,stall=0,lLAt=os.clock(),mode="999"}
local sc=mkC(sp,64)
mk("TextLabel",sc,{Size=UDim2.new(1,-16,0,22),Position=UDim2.new(0,12,0,4),BackgroundTransparency=1,Text="⚡ Max Rep Speed Mode",TextColor3=Color3.fromRGB(30,30,35),Font=Enum.Font.GothamBold,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left})
local sbh=mk("Frame",sc,{Size=UDim2.new(1,-16,0,28),Position=UDim2.new(0,8,0,30),BackgroundTransparency=1})
mk("UIListLayout",sbh,{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6)})
local sBtns={}
for _,m in ipairs({"698","999"})do local b=mk("TextButton",sbh,{Size=UDim2.new(0,110,1,0),BackgroundColor3=(m==st.mode)and Color3.fromRGB(0,120,215)or Color3.fromRGB(245,245,248),Text=m.." reps/s",TextColor3=(m==st.mode)and Color3.new(1,1,1)or Color3.fromRGB(30,30,35),Font=Enum.Font.GothamBold,TextSize=12})mk("UICorner",b,{CornerRadius=UDim.new(0,5)})sBtns[m]=b b.MouseButton1Click:Connect(function()st.mode=m st.mR=tonumber(m)for mm,bb in pairs(sBtns)do local a=(mm==m)bb.BackgroundColor3=a and Color3.fromRGB(0,120,215)or Color3.fromRGB(245,245,248)bb.TextColor3=a and Color3.new(1,1,1)or Color3.fromRGB(30,30,35)end end)end
aT(sp,"Fast Strength ⚡",false,function(v)st.run=v if v then st.tS=false st.mR=tonumber(st.mode)or 999 st.sR=math.min(500,st.mR)st.iR=math.min(500,st.mR)if not st.gB then st.start=sST.Value st.startD=sDU.Value st.gB=true end stS.Text="Status: 🔥 Farming @ "..st.sR.." reps/s"stS.TextColor3=Color3.fromRGB(46,204,113)else if st.tS and st.sAt>0 then st.tot=st.tot+tick()-st.sAt st.sAt=0 st.tS=false end stS.Text=st.gB and"Status: Paused"or"Status: Inactive"stS.TextColor3=st.gB and Color3.fromRGB(241,196,15)or Color3.fromRGB(220,60,60)end end)
local slp=pg["Slower"]
aL(slp,"Mode slow & selamat.",Color3.fromRGB(120,120,130))
aT(slp,"Fast Strength (Slower)",false,function(v)st.run=v if v then st.iR=100 st.mR=300 st.mB=12 st.sR=100 stS.Text="Status: Farming (Slower)"stS.TextColor3=Color3.fromRGB(46,204,113)else stS.Text="Status: Inactive"stS.TextColor3=Color3.fromRGB(220,60,60)end end)
local op=pg["Other"]
aB(op,"Equip Best Farming Pets",eqF)
aB(op,"Equip Best Rebirth Pets",eqR)
local ip=pg["Info"]
aL(ip,"🔥 OBRK CLAN l PRIVATE",Color3.fromRGB(0,120,215),24)
aL(ip,"Custom UI - Delta Executor",Color3.fromRGB(120,120,130))
aL(ip,"Features:",Color3.fromRGB(30,30,35))
aL(ip,"• Fast Rebirth",Color3.fromRGB(120,120,130))
aL(ip,"• Fast Strength 698/999",Color3.fromRGB(120,120,130))
aL(ip,"• Fast Strength Slower",Color3.fromRGB(120,120,130))
aL(ip,"• Anti AFK",Color3.fromRGB(120,120,130))
aL(ip,"• Auto Equip Best Pet",Color3.fromRGB(120,120,130))
aL(ip,"Key: Verified ✅",Color3.fromRGB(46,204,113))
hb.MouseButton1Click:Connect(function()M.Visible=false fb.Visible=true end)
cb2.MouseButton1Click:Connect(function()G:Destroy()end)
fb.MouseButton1Click:Connect(function()M.Visible=true fb.Visible=false end)
U.InputBegan:Connect(function(i,gp)if gp then return end if i.KeyCode==Enum.KeyCode.RightControl then M.Visible=not M.Visible fb.Visible=not M.Visible end end)
at="Rebirths"
for tn,td in pairs(tabs)do local a=(tn=="Rebirths")td.B.BackgroundColor3=a and Color3.fromRGB(255,255,255)or Color3.fromRGB(248,248,250)td.B.TextColor3=a and Color3.fromRGB(30,30,35)or Color3.fromRGB(120,120,130)td.I.Visible=a if pg[tn]then pg[tn].Visible=a end end
M.Size=UDim2.new(0,560,0,0)T:Create(M,TweenInfo.new(.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,560,0,400)}):Play()
L.Idled:Connect(function()pcall(function()V:SendKeyEvent(true,Enum.KeyCode.Y,false,game)task.wait(.05)V:SendKeyEvent(false,Enum.KeyCode.Y,false,game)end)end)
local doR=function()local tgt=5000+sRB.Value*2550 local rp2=L.MembershipType==Enum.MembershipType.Premium and 6 or 12 while rbs.run and sST.Value<tgt do for _=1,rp2 do pcall(function()mEv:FireServer("rep")end)end task.wait(.02)end if rbs.run and sST.Value>=tgt then eqR()task.wait(.25)local b=sRB.Value repeat pcall(function()rbR:InvokeServer("rebirthRequest")end)task.wait(.05)until sRB.Value>b or not rbs.run end end
task.spawn(function()while true do task.wait(.5)if rbs.run and not rbs.wa then rbs.wa=true task.spawn(function()while rbs.run do eqF()doR()task.wait(.5)end rbs.wa=false end)end end end)
if sRB then sRB:GetPropertyChangedSignal("Value"):Connect(function()if not rbs.run then return end if not rbs.pR then rbs.pR=true rbs.tS=true rbs.sAt=tick()rbs.lrAt=tick()rbs.lrV=sRB.Value return end if sRB.Value<=rbs.lrV then return end local g2=sRB.Value-rbs.lrV local sp2=(tick()-rbs.lrAt)/g2 local h=3600/sp2 rbP.Text=string.format("Pace: %s / Hour | %s / Day | %s / Week",fN(h),fN(h*24),fN(h*168))rbs.lrAt=tick()rbs.lrV=sRB.Value end)end
local sL=function()st.lLAt=os.clock()while st.run do local n=os.clock()local e=math.min(.1,n-st.lLAt)st.lLAt=n local cn=tick()if cn-st.lCAt2>=st.cI2 then local pr=(sST.Value>st.lCS2)or(sDU and sDU.Value>st.lCD2)if pr then st.stall=0 st.sR=math.min(st.mR,st.sR*1.35)stS.Text="Status: 🔥 "..fN(st.sR).." reps/s | MAX "..st.mode stS.TextColor3=Color3.fromRGB(46,204,113)else st.stall=st.stall+1 end if st.stall>=3 then st.sR=math.max(st.iR,st.sR*.85)st.tok=0 stS.Text="Status: Stabilizing | "..fN(st.sR).." reps/s"stS.TextColor3=Color3.fromRGB(241,196,15)st.stall=0 end st.lCAt2=cn st.lCS2=sST.Value st.lCD2=sDU and sDU.Value or 0 end st.tok=math.min(st.mB,st.tok+st.sR*e)local b=math.max(1,math.min(st.mB,math.ceil(st.tok)))for _=1,b do pcall(function()mEv:FireServer("rep")end)end st.tok=st.tok-b task.wait(.005)end end
task.spawn(function()while true do task.wait(.5)if st.run and not st.wa then st.wa=true task.spawn(function()sL()st.wa=false end)end end end)
task.spawn(function()while true do task.wait(1)local el=rbs.tot if rbs.run and rbs.tS then el=el+tick()-rbs.sAt end rbR2.Text="Runtime: "..fR(el)if sRB then rbSt.Text="Rebirths: "..fN(sRB.Value).." | Gained: "..fN(sRB.Value-rbs.start)end local se=st.tot if st.run and st.tS then se=se+tick()-st.sAt end stR.Text="Runtime: "..fR(se)if sST then stSt.Text="Strength: "..fN(sST.Value).." | Gained: "..fN(sST.Value-st.start)end if sDU then stD.Text="Durability: "..fN(sDU.Value).." | Gained: "..fN(sDU.Value-st.startD)end if st.run and not st.tS and sST and sDU then if sST.Value>st.start or sDU.Value>st.startD then st.tS=true st.sAt=tick()end end end end)
end
local att=0 local lk=false
local vf=function()if lk then return end if tb.Text==KEY then stl.Text="✅ Key betul!"stl.TextColor3=Color3.fromRGB(46,204,113)T:Create(card,TweenInfo.new(.25),{Size=UDim2.new(0,380,0,0)}):Play()task.wait(.3)kg:Destroy()main()else att=att+1 stl.Text="❌ Salah! Cuba lagi ("..att..")"local o=card.Position for j=1,4 do card.Position=o+UDim2.new(0,j%2==0 and 6 or -6,0,0)task.wait(.04)end card.Position=o if att>=3 then lk=true stl.Text="🚫 Locked!"tb.TextEditable=false sbt.Text="🔒 LOCKED"sbt.BackgroundColor3=Color3.fromRGB(150,150,150)task.wait(2)kg:Destroy()end end end
sbt.MouseButton1Click:Connect(vf)
tb.FocusLost:Connect(function(e)if e then vf()end end)
