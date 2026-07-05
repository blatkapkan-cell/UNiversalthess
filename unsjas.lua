local P=game:GetService("Players") local R=game:GetService("RunService") local T=game:GetService("TweenService") local U=game:GetService("UserInputService") local C=game:GetService("CoreGui") local W=game:GetService("Workspace") local A=W.CurrentCamera local L=P.LocalPlayer local M=L:GetMouse()
local HRP,HM

local function gc() local c=L.Character if c then HRP=c:FindFirstChild("HumanoidRootPart") HM=c:FindFirstChildOfClass("Humanoid") end return c end
L.CharacterAdded:Connect(function(c) HRP=c:WaitForChild("HumanoidRootPart") HM=c:WaitForChild("Humanoid") end)

local CFG={ac=Color3.fromRGB(0,255,255),ac2=Color3.fromRGB(255,0,255),bg=Color3.fromRGB(15,15,25),pc=Color3.fromRGB(25,25,40),tc=Color3.fromRGB(240,240,255),stc=Color3.fromRGB(150,150,170),tk=Enum.KeyCode.RightShift,mw=620,mh=480,ct="Visuals",as=0.35}
local E={En=true,Box=true,B3D=false,RB=false,HP=true,HL=true,Dist=true,Skel=true,Chams=false,Name=true,Line=true,Item=true,Wep=true,Snap=true,TO="Bottom",MD=2000,TC=false,BC=Color3.fromRGB(0,255,255),IC=Color3.fromRGB(255,215,0),WC=Color3.fromRGB(255,0,128),RS=2,TS=13,BT=1.5,ST=1.5,LT=1.5,CT=0.5,SLT=1.5}
local CB={Aim=false,FOV=150,Sm=0.15,AP="Head",WB=false,NR=false,NS=false,NC=false,RF=false,ATC=true,SF=true,FC=Color3.fromRGB(255,0,255)}
local MS={Fly=false,FS=1,Nc=false,Inv=false,WS=16,JP=50,SH=false,SHV=1,FH=false,FHS=1,NH=false,IJ=false,AC=true}
local RGB={R=0,G=255,B=255,mR=0,mG=255,mB=255}
local CF={cur="default",sv={}}

local function ST(o,p,d,e)d=d or CFG.as e=e or Enum.EasingStyle.Quart T:Create(o,TweenInfo.new(d,e,Enum.EasingDirection.Out),p):Play()end
local function NG(p,c,t)local g=Instance.new("UIStroke")g.Color=c or CFG.ac g.Thickness=t or 2 g.Transparency=0.3 g.ApplyStrokeMode=Enum.ApplyStrokeMode.Border g.Parent=p return g end
local function CC(p,r)local c=Instance.new("UICorner")c.CornerRadius=r or UDim.new(0,8)c.Parent=p return c end

local function CT(pr,t,ds,cb,yp)
 local f=Instance.new("Frame")f.Size=UDim2.new(1,-20,0,40)f.Position=UDim2.new(0,10,0,yp)f.BackgroundColor3=CFG.pc f.BackgroundTransparency=0.5 f.BorderSizePixel=0 f.Parent=pr CC(f) local gl=NG(f)
 local l=Instance.new("TextLabel")l.Size=UDim2.new(0,200,1,0)l.Position=UDim2.new(0,12,0,0)l.BackgroundTransparency=1 l.Text=t l.TextColor3=CFG.tc l.TextSize=14 l.Font=Enum.Font.GothamSemibold l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
 local sb=Instance.new("Frame")sb.Size=UDim2.new(0,50,0,26)sb.Position=UDim2.new(1,-62,0.5,-13)sb.BackgroundColor3=ds and CFG.ac or Color3.fromRGB(60,60,80)sb.BorderSizePixel=0 sb.Parent=f CC(sb,UDim.new(1,0))
 local k=Instance.new("Frame")k.Size=UDim2.new(0,22,0,22)k.Position=ds and UDim2.new(1,-24,0.5,-11)or UDim2.new(0,2,0.5,-11)k.BackgroundColor3=Color3.fromRGB(255,255,255)k.BorderSizePixel=0 k.Parent=sb CC(k,UDim.new(1,0))
 local kg=Instance.new("UIStroke")kg.Color=ds and CFG.ac or Color3.fromRGB(100,100,120)kg.Thickness=2 kg.Transparency=0.5 kg.Parent=k
 local s=ds
 local function up()s=not s if s then ST(sb,{BackgroundColor3=CFG.ac},0.2)ST(k,{Position=UDim2.new(1,-24,0.5,-11)},0.2)ST(kg,{Color=CFG.ac},0.2)ST(gl,{Color=CFG.ac},0.2)else ST(sb,{BackgroundColor3=Color3.fromRGB(60,60,80)},0.2)ST(k,{Position=UDim2.new(0,2,0.5,-11)},0.2)ST(kg,{Color=Color3.fromRGB(100,100,120)},0.2)ST(gl,{Color=CFG.ac2},0.2)end if cb then cb(s)end end
 f.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then up()end end)
 f.MouseEnter:Connect(function()ST(f,{BackgroundTransparency=0.3},0.15)end)f.MouseLeave:Connect(function()ST(f,{BackgroundTransparency=0.5},0.15)end)
 return f,function()return s end,function(v)if v~=s then up()end end
end

local function CS(pr,t,mn,mx,df,cb,yp,fl)
 local f=Instance.new("Frame")f.Size=UDim2.new(1,-20,0,50)f.Position=UDim2.new(0,10,0,yp)f.BackgroundColor3=CFG.pc f.BackgroundTransparency=0.5 f.BorderSizePixel=0 f.Parent=pr CC(f) NG(f,CFG.ac,1)
 local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-20,0,18)l.Position=UDim2.new(0,10,0,4)l.BackgroundTransparency=1 l.Text=t..": "..tostring(df) l.TextColor3=CFG.tc l.TextSize=12 l.Font=Enum.Font.GothamSemibold l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
 local tr=Instance.new("Frame")tr.Size=UDim2.new(1,-30,0,8)tr.Position=UDim2.new(0,15,0,28)tr.BackgroundColor3=Color3.fromRGB(40,40,60)tr.BorderSizePixel=0 tr.Parent=f CC(tr,UDim.new(1,0))
 local flb=Instance.new("Frame")flb.Name="Fill"flb.Size=UDim2.new((df-mn)/(mx-mn),0,1,0)flb.BackgroundColor3=CFG.ac flb.BorderSizePixel=0 flb.Parent=tr CC(flb,UDim.new(1,0))
 local kn=Instance.new("Frame")kn.Size=UDim2.new(0,14,0,14)kn.Position=UDim2.new((df-mn)/(mx-mn),-7,0.5,-7)kn.BackgroundColor3=Color3.fromRGB(255,255,255)kn.BorderSizePixel=0 kn.Parent=tr CC(kn,UDim.new(1,0)) NG(kn,CFG.ac,2)
 local dg=false
 local function up(i)local p=math.clamp((i.Position.X-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)local v=mn+p*(mx-mn)if not fl then v=math.floor(v)end flb.Size=UDim2.new(p,0,1,0)kn.Position=UDim2.new(p,-7,0.5,-7)l.Text=t..": "..(fl and string.format("%.2f",v)or tostring(v))if cb then cb(v)end end
 tr.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=true up(i)end end)
 U.InputChanged:Connect(function(i)if dg and i.UserInputType==Enum.UserInputType.MouseMovement then up(i)end end)
 U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=false end end)
 return f
end

local function CRP(pr,tt,yp,cb,sr)
 local f=Instance.new("Frame")f.Size=UDim2.new(1,-20,0,130)f.Position=UDim2.new(0,10,0,yp)f.BackgroundColor3=CFG.pc f.BackgroundTransparency=0.5 f.BorderSizePixel=0 f.Parent=pr CC(f) NG(f,CFG.ac,1.5)
 local tl=Instance.new("TextLabel")tl.Size=UDim2.new(1,-20,0,20)tl.Position=UDim2.new(0,10,0,5)tl.BackgroundTransparency=1 tl.Text=tt tl.TextColor3=CFG.tc tl.TextSize=13 tl.Font=Enum.Font.GothamBold tl.TextXAlignment=Enum.TextXAlignment.Left tl.Parent=f
 local pv=Instance.new("Frame")pv.Size=UDim2.new(0,40,0,40)pv.Position=UDim2.new(1,-50,0,5)pv.BackgroundColor3=Color3.fromRGB(sr.R,sr.G,sr.B)pv.BorderSizePixel=0 pv.Parent=f CC(pv,UDim.new(0,6))local pg=NG(pv,CFG.ac,2)
 local sl={"R","G","B"} local cl={Color3.fromRGB(255,0,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,0,255)}
 for i,sn in ipairs(sl)do local sf=Instance.new("Frame")sf.Size=UDim2.new(1,-20,0,26)sf.Position=UDim2.new(0,10,0,30+(i-1)*30)sf.BackgroundTransparency=1 sf.Parent=f
  local lb=Instance.new("TextLabel")lb.Size=UDim2.new(0,20,1,0)lb.BackgroundTransparency=1 lb.Text=sn lb.TextColor3=cl[i]lb.TextSize=12 lb.Font=Enum.Font.GothamBold lb.Parent=sf
  local tr=Instance.new("Frame")tr.Size=UDim2.new(1,-70,0,6)tr.Position=UDim2.new(0,30,0.5,-3)tr.BackgroundColor3=Color3.fromRGB(40,40,60)tr.BorderSizePixel=0 tr.Parent=sf CC(tr,UDim.new(1,0))
  local fl=Instance.new("Frame")fl.Name="Fill"fl.Size=UDim2.new(sr[sn]/255,0,1,0)fl.BackgroundColor3=cl[i]fl.BorderSizePixel=0 fl.Parent=tr CC(fl,UDim.new(1,0))
  local vt=Instance.new("TextLabel")vt.Size=UDim2.new(0,35,1,0)vt.Position=UDim2.new(1,-35,0,0)vt.BackgroundTransparency=1 vt.Text=tostring(sr[sn])vt.TextColor3=CFG.stc vt.TextSize=11 vt.Font=Enum.Font.Gotham vt.Parent=sf
  local dg=false
  local function up(i)local p=math.clamp((i.Position.X-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)local v=math.floor(p*255)sr[sn]=v fl.Size=UDim2.new(p,0,1,0)vt.Text=tostring(v)pv.BackgroundColor3=Color3.fromRGB(sr.R,sr.G,sr.B)pg.Color=pv.BackgroundColor3 if cb then cb(pv.BackgroundColor3)end end
  tr.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=true up(i)end end)
  U.InputChanged:Connect(function(i)if dg and i.UserInputType==Enum.UserInputType.MouseMovement then up(i)end end)
  U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=false end end)
 end return f
end

local G=Instance.new("ScreenGui")G.Name="NursiClient_v1"G.ResetOnSpawn=false G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling G.Parent=C
local MF=Instance.new("Frame")MF.Name="MF"MF.Size=UDim2.new(0,CFG.mw,0,CFG.mh)MF.Position=UDim2.new(0.5,-CFG.mw/2,0.5,-CFG.mh/2)MF.BackgroundColor3=CFG.bg MF.BackgroundTransparency=0.05 MF.BorderSizePixel=0 MF.ClipsDescendants=true MF.Active=true MF.Draggable=true MF.Parent=G CC(MF,UDim.new(0,12))local mGl=NG(MF,CFG.ac,2.5)
local gr=Instance.new("UIGradient")gr.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,CFG.ac),ColorSequenceKeypoint.new(0.5,CFG.ac2),ColorSequenceKeypoint.new(1,CFG.ac)})gr.Rotation=45 gr.Transparency=NumberSequence.new(0.92,0.95)gr.Parent=MF
local gri=0 R.RenderStepped:Connect(function()gri=gri+0.5 gr.Rotation=gri end)

local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,42)TB.BackgroundColor3=CFG.pc TB.BackgroundTransparency=0.3 TB.BorderSizePixel=0 TB.Parent=MF CC(TB,UDim.new(0,12))NG(TB,CFG.ac,1.5)
local TTL=Instance.new("TextLabel")TTL.Size=UDim2.new(0,200,1,0)TTL.Position=UDim2.new(0,15,0,0)TTL.BackgroundTransparency=1 TTL.Text="Nursi Client"TTL.TextColor3=CFG.tc TTL.TextSize=22 TTL.Font=Enum.Font.GothamBold TTL.TextXAlignment=Enum.TextXAlignment.Left TTL.Parent=TB
local TTL2=Instance.new("TextLabel")TTL2.Size=UDim2.new(0,120,0,14)TTL2.Position=UDim2.new(0,148,0,24)TTL2.BackgroundTransparency=1 TTL2.Text="tiktok-netovsez"TTL2.TextColor3=CFG.ac2 TTL2.TextSize=9 TTL2.Font=Enum.Font.Gotham TTL2.TextXAlignment=Enum.TextXAlignment.Left TTL.Parent=TB
local BTL=Instance.new("TextLabel")BTL.Size=UDim2.new(0,80,0,14)BTL.Position=UDim2.new(0,148,0,5)BTL.BackgroundTransparency=1 BTL.Text="beta v1"BTL.TextColor3=CFG.stc BTL.TextSize=10 BTL.Font=Enum.Font.Gotham BTL.TextXAlignment=Enum.TextXAlignment.Left BTL.Parent=TB
local CBt=Instance.new("TextButton")CBt.Size=UDim2.new(0,32,0,32)CBt.Position=UDim2.new(1,-42,0,5)CBt.BackgroundColor3=Color3.fromRGB(255,60,60)CBt.BackgroundTransparency=0.2 CBt.BorderSizePixel=0 CBt.Text="×"CBt.TextColor3=CFG.tc CBt.TextSize=20 CBt.Font=Enum.Font.GothamBold CBt.Parent=TB CC(CBt,UDim.new(0,8))
local MB=Instance.new("TextButton")MB.Size=UDim2.new(0,32,0,32)MB.Position=UDim2.new(1,-80,0,5)MB.BackgroundColor3=Color3.fromRGB(255,180,0)MB.BackgroundTransparency=0.2 MB.BorderSizePixel=0 MB.Text="−"MB.TextColor3=CFG.tc MB.TextSize=20 MB.Font=Enum.Font.GothamBold MB.Parent=TB CC(MB,UDim.new(0,8))

local TC=Instance.new("Frame")TC.Size=UDim2.new(1,0,0,40)TC.Position=UDim2.new(0,0,0,42)TC.BackgroundColor3=CFG.pc TC.BackgroundTransparency=0.5 TC.BorderSizePixel=0 TC.Parent=MF NG(TC,CFG.ac2,1)
local CF=Instance.new("Frame")CF.Size=UDim2.new(1,-20,1,-92)CF.Position=UDim2.new(0,10,0,87)CF.BackgroundColor3=CFG.pc CF.BackgroundTransparency=0.6 CF.BorderSizePixel=0 CF.ClipsDescendants=true CF.Parent=MF CC(CF,UDim.new(0,10))NG(CF,CFG.ac,1.5)

local tC={} local tB={} local tabs={"Visuals","Combat","Misc","Settings","Configs"}
for i,tn in ipairs(tabs)do local btn=Instance.new("TextButton")btn.Name=tn.."Tab"btn.Size=UDim2.new(1/#tabs,-4,1,-8)btn.Position=UDim2.new((i-1)/#tabs,2,0,4)btn.BackgroundColor3=i==1 and CFG.ac or CFG.pc btn.BackgroundTransparency=i==1 and 0.2 or 0.7 btn.BorderSizePixel=0 btn.Text=tn btn.TextColor3=i==1 and CFG.tc or CFG.stc btn.TextSize=12 btn.Font=Enum.Font.GothamSemibold btn.Parent=TC CC(btn,UDim.new(0,8))local bg=NG(btn,i==1 and CFG.ac or CFG.ac2,1)
 local cnt=Instance.new("ScrollingFrame")cnt.Name=tn.."Content"cnt.Size=UDim2.new(1,0,1,0)cnt.BackgroundTransparency=1 cnt.BorderSizePixel=0 cnt.ScrollBarThickness=4 cnt.ScrollBarImageColor3=CFG.ac cnt.ScrollingDirection=Enum.ScrollingDirection.Y cnt.AutomaticCanvasSize=Enum.AutomaticSize.Y cnt.CanvasSize=UDim2.new(0,0,0,0)cnt.Visible=i==1 cnt.Parent=CF
 Instance.new("UIListLayout").Padding=UDim.new(0,8)cnt:FindFirstChildOfClass("UIListLayout").SortOrder=Enum.SortOrder.LayoutOrder cnt:FindFirstChildOfClass("UIListLayout").Parent=cnt
 tC[tn]=cnt tB[i]={button=btn,glow=bg,content=cnt}
 btn.MouseEnter:Connect(function()if CFG.ct~=tn then ST(btn,{BackgroundTransparency=0.4},0.2)ST(btn,{TextColor3=CFG.tc},0.2)end end)
 btn.MouseLeave:Connect(function()if CFG.ct~=tn then ST(btn,{BackgroundTransparency=0.7},0.2)ST(btn,{TextColor3=CFG.stc},0.2)end end)
 btn.MouseButton1Click:Connect(function()if CFG.ct==tn then return end local old=tB[CFG.ct]if old then ST(old.button,{BackgroundColor3=CFG.pc,BackgroundTransparency=0.7},0.25)ST(old.button,{TextColor3=CFG.stc},0.25)ST(old.glow,{Color=CFG.ac2},0.25)old.content.Visible=false end CFG.ct=tn ST(btn,{BackgroundColor3=CFG.ac,BackgroundTransparency=0.2},0.25)ST(btn,{TextColor3=CFG.tc},0.25)ST(bg,{Color=CFG.ac},0.25)cnt.Visible=true end)
end

-- Visuals
local vc=tC["Visuals"] local vy=10
CT(vc,"Box ESP",E.Box,function(s)E.Box=s end,vy)vy=vy+48 CT(vc,"3D Box ESP",E.B3D,function(s)E.B3D=s end,vy)vy=vy+48 CT(vc,"Rainbow ESP",E.RB,function(s)E.RB=s end,vy)vy=vy+48 CT(vc,"Health ESP",E.HP,function(s)E.HP=s end,vy)vy=vy+48 CT(vc,"Highlight ESP",E.HL,function(s)E.HL=s end,vy)vy=vy+48 CT(vc,"Distance ESP",E.Dist,function(s)E.Dist=s end,vy)vy=vy+48 CT(vc,"Skeleton ESP",E.Skel,function(s)E.Skel=s end,vy)vy=vy+48 CT(vc,"Chams ESP",E.Chams,function(s)E.Chams=s end,vy)vy=vy+48 CT(vc,"Name ESP",E.Name,function(s)E.Name=s end,vy)vy=vy+48 CT(vc,"Line ESP",E.Line,function(s)E.Line=s end,vy)vy=vy+48 CT(vc,"Item ESP",E.Item,function(s)E.Item=s end,vy)vy=vy+48 CT(vc,"Weapon ESP",E.Wep,function(s)E.Wep=s end,vy)vy=vy+48 CT(vc,"Snap Lines",E.Snap,function(s)E.Snap=s end,vy)vy=vy+48 CS(vc,"Max Distance",100,5000,E.MD,function(v)E.MD=v end,vy)vy=vy+58 CS(vc,"Rainbow Speed",1,10,E.RS,function(v)E.RS=v end,vy)vy=vy+58 CRP(vc,"ESP Color",vy,function(c)E.BC=c end,RGB)vy=vy+140

-- Combat
local cc=tC["Combat"] local cy=10
CT(cc,"Aimbot",CB.Aim,function(s)CB.Aim=s end,cy)cy=cy+48 CT(cc,"Show FOV",CB.SF,function(s)CB.SF=s end,cy)cy=cy+48 CS(cc,"Aimbot FOV",50,500,CB.FOV,function(v)CB.FOV=v end,cy)cy=cy+58 CS(cc,"Smoothness",0.01,1,CB.Sm,function(v)CB.Sm=v end,cy,true)cy=cy+58
local dd=Instance.new("Frame")dd.Size=UDim2.new(1,-20,0,40)dd.Position=UDim2.new(0,10,0,cy)dd.BackgroundColor3=CFG.pc dd.BackgroundTransparency=0.5 dd.BorderSizePixel=0 dd.Parent=cc CC(dd) NG(dd,CFG.ac,1)
local dl=Instance.new("TextLabel")dl.Size=UDim2.new(0,120,1,0)dl.Position=UDim2.new(0,12,0,0)dl.BackgroundTransparency=1 dl.Text="Aim Part"dl.TextColor3=CFG.tc dl.TextSize=13 dl.Font=Enum.Font.GothamSemibold dl.TextXAlignment=Enum.TextXAlignment.Left dl.Parent=dd
local db=Instance.new("TextButton")db.Size=UDim2.new(0,140,0,28)db.Position=UDim2.new(1,-152,0.5,-14)db.BackgroundColor3=CFG.bg db.BackgroundTransparency=0.3 db.BorderSizePixel=0 db.Text=CB.AP db.TextColor3=CFG.ac db.TextSize=12 db.Font=Enum.Font.Gotham db.Parent=dd CC(db,UDim.new(0,6)) NG(db,CFG.ac,1)
local dopen=false local dlst=Instance.new("Frame")dlst.Size=UDim2.new(0,140,0,0)dlst.Position=UDim2.new(1,-152,0,36)dlst.BackgroundColor3=CFG.bg dlst.BackgroundTransparency=0.1 dlst.BorderSizePixel=0 dlst.ClipsDescendants=true dlst.Visible=false dlst.Parent=dd CC(dlst,UDim.new(0,6)) NG(dlst,CFG.ac,1.5) Instance.new("UIListLayout").Padding=UDim.new(0,2)dlst:FindFirstChildOfClass("UIListLayout").Parent=dlst
for _,o in ipairs({"Head","Torso","HumanoidRootPart"})do local ob=Instance.new("TextButton")ob.Size=UDim2.new(1,0,0,26)ob.BackgroundColor3=CFG.pc ob.BackgroundTransparency=0.5 ob.BorderSizePixel=0 ob.Text=o ob.TextColor3=CFG.tc ob.TextSize=11 ob.Font=Enum.Font.Gotham ob.Parent=dlst CC(ob,UDim.new(0,4))ob.MouseEnter:Connect(function()ST(ob,{BackgroundTransparency=0.2},0.15)end)ob.MouseLeave:Connect(function()ST(ob,{BackgroundTransparency=0.5},0.15)end)ob.MouseButton1Click:Connect(function()db.Text=o CB.AP=o dopen=false ST(dlst,{Size=UDim2.new(0,140,0,0)},0.2)wait(0.2)dlst.Visible=false end)end
db.MouseButton1Click:Connect(function()dopen=not dopen if dopen then dlst.Visible=true ST(dlst,{Size=UDim2.new(0,140,0,86)},0.2)else ST(dlst,{Size=UDim2.new(0,140,0,0)},0.2)wait(0.2)dlst.Visible=false end end)
cy=cy+48 CT(cc,"Team Check",CB.ATC,function(s)CB.ATC=s end,cy)cy=cy+48 CT(cc,"Wallbang",CB.WB,function(s)CB.WB=s end,cy)cy=cy+48 CT(cc,"No Recoil",CB.NR,function(s)CB.NR=s end,cy)cy=cy+48 CT(cc,"No Spread",CB.NS,function(s)CB.NS=s end,cy)cy=cy+48 CT(cc,"No Cooldown",CB.NC,function(s)CB.NC=s end,cy)cy=cy+48 CT(cc,"Rapid Fire",CB.RF,function(s)CB.RF=s end,cy)cy=cy+48 CRP(cc,"FOV Color",cy,function(c)CB.FC=c end,{R=255,G=0,B=255})

-- Misc
local mc=tC["Misc"] local my=10
CT(mc,"Fly",MS.Fly,function(s)MS.Fly=s end,my)my=my+48 CS(mc,"Fly Speed",0.1,100,MS.FS,function(v)MS.FS=v end,my,true)my=my+58 CT(mc,"Noclip",MS.Nc,function(s)MS.Nc=s end,my)my=my+48 CT(mc,"Invisible",MS.Inv,function(s)MS.Inv=s end,my)my=my+48 CS(mc,"WalkSpeed",0.1,500,MS.WS,function(v)MS.WS=v if HM then HM.WalkSpeed=v end end,my,true)my=my+58 CS(mc,"JumpPower",0.1,500,MS.JP,function(v)MS.JP=v if HM then HM.JumpPower=v end end,my,true)my=my+58 CT(mc,"Speed Hack",MS.SH,function(s)MS.SH=s end,my)my=my+48 CS(mc,"Speed Hack Value",0.1,50,MS.SHV,function(v)MS.SHV=v end,my,true)my=my+58 CT(mc,"Fly Hack",MS.FH,function(s)MS.FH=s end,my)my=my+48 CS(mc,"Fly Hack Speed",0.1,100,MS.FHS,function(v)MS.FHS=v end,my,true)my=my+58 CT(mc,"Noclip Hack",MS.NH,function(s)MS.NH=s end,my)my=my+48 CT(mc,"Infinite Jump",MS.IJ,function(s)MS.IJ=s end,my)my=my+48 CT(mc,"Anti-Cheat Bypass",MS.AC,function(s)MS.AC=s end,my)

-- Settings
local sc=tC["Settings"] local sy=10
CRP(sc,"Menu Accent",sy,function(c)CFG.ac=c mGl.Color=c end,RGB)sy=sy+140 CS(sc,"Menu Width",400,900,CFG.mw,function(v)CFG.mw=v ST(MF,{Size=UDim2.new(0,v,0,CFG.mh)},0.3)end,sy)sy=sy+58 CS(sc,"Menu Height",300,700,CFG.mh,function(v)CFG.mh=v ST(MF,{Size=UDim2.new(0,CFG.mw,0,v)},0.3)end,sy)sy=sy+58 CS(sc,"Anim Speed",0.1,1,CFG.as,function(v)CFG.as=v end,sy,true)sy=sy+58 CT(sc,"Rainbow Menu",false,function(s)if s then R.RenderStepped:Connect(function()if not s then return end local h=(tick()*0.5)%1 local c=Color3.fromHSV(h,1,1)mGl.Color=c for _,b in ipairs(tB)do if CFG.ct==b.button.Text then b.glow.Color=c end end end)end end,sy)

-- Configs
local cfc=tC["Configs"] local cfy=10
local ci=Instance.new("TextBox")ci.Size=UDim2.new(1,-20,0,36)ci.Position=UDim2.new(0,10,0,cfy)ci.BackgroundColor3=CFG.pc ci.BackgroundTransparency=0.3 ci.BorderSizePixel=0 ci.Text="Config Name"ci.TextColor3=CFG.tc ci.TextSize=13 ci.Font=Enum.Font.Gotham ci.Parent=cfc CC(ci,UDim.new(0,8)) NG(ci,CFG.ac,1)cfy=cfy+46
local sb=Instance.new("TextButton")sb.Size=UDim2.new(0.48,-5,0,36)sb.Position=UDim2.new(0,10,0,cfy)sb.BackgroundColor3=CFG.ac sb.BackgroundTransparency=0.2 sb.BorderSizePixel=0 sb.Text="Save"sb.TextColor3=CFG.tc sb.TextSize=13 sb.Font=Enum.Font.GothamBold sb.Parent=cfc CC(sb,UDim.new(0,8))
local lb=Instance.new("TextButton")lb.Size=UDim2.new(0.48,-5,0,36)lb.Position=UDim2.new(0.52,5,0,cfy)lb.BackgroundColor3=CFG.ac2 lb.BackgroundTransparency=0.2 lb.BorderSizePixel=0 lb.Text="Load"lb.TextColor3=CFG.tc lb.TextSize=13 lb.Font=Enum.Font.GothamBold lb.Parent=cfc CC(lb,UDim.new(0,8))cfy=cfy+50
local cl=Instance.new("ScrollingFrame")cl.Size=UDim2.new(1,-20,1,-cfy-10)cl.Position=UDim2.new(0,10,0,cfy)cl.BackgroundColor3=CFG.pc cl.BackgroundTransparency=0.5 cl.BorderSizePixel=0 cl.ScrollBarThickness=4 cl.ScrollBarImageColor3=CFG.ac cl.AutomaticCanvasSize=Enum.AutomaticSize.Y cl.CanvasSize=UDim2.new(0,0,0,0)cl.Parent=cfc CC(cl,UDim.new(0,8)) NG(cl,CFG.ac,1) Instance.new("UIListLayout").Padding=UDim.new(0,4)cl:FindFirstChildOfClass("UIListLayout").Parent=cl
local function rc()for _,c in ipairs(cl:GetChildren())do if c:IsA("TextButton")then c:Destroy()end end for n,_ in pairs(CF.sv)do local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,32)b.BackgroundColor3=CFG.bg b.BackgroundTransparency=0.3 b.BorderSizePixel=0 b.Text=n b.TextColor3=CFG.tc b.TextSize=12 b.Font=Enum.Font.Gotham b.Parent=cl CC(b,UDim.new(0,6))b.MouseEnter:Connect(function()ST(b,{BackgroundTransparency=0.1},0.15)end)b.MouseLeave:Connect(function()ST(b,{BackgroundTransparency=0.3},0.15)end)b.MouseButton1Click:Connect(function()ci.Text=n end)end end
sb.MouseButton1Click:Connect(function()local n=ci.Text if n==""or n=="Config Name"then return end CF.sv[n]={e={Box=E.Box,B3D=E.B3D,RB=E.RB,HP=E.HP,HL=E.HL,Dist=E.Dist,Skel=E.Skel,Chams=E.Chams,Name=E.Name,Line=E.Line,Item=E.Item,Wep=E.Wep,Snap=E.Snap,MD=E.MD,RS=E.RS,BC=E.BC},c={Aim=CB.Aim,FOV=CB.FOV,Sm=CB.Sm,AP=CB.AP,WB=CB.WB,NR=CB.NR,NS=CB.NS,NC=CB.NC,RF=CB.RF,ATC=CB.ATC,SF=CB.SF,FC=CB.FC},m={Fly=MS.Fly,FS=MS.FS,Nc=MS.Nc,Inv=MS.Inv,WS=MS.WS,JP=MS.JP,SH=MS.SH,SHV=MS.SHV,FH=MS.FH,FHS=MS.FHS,NH=MS.NH,IJ=MS.IJ,AC=MS.AC}}rc()end)
lb.MouseButton1Click:Connect(function()local n=ci.Text if not CF.sv[n]then return end local d=CF.sv[n]for k,v in pairs(d.e)do E[k]=v end for k,v in pairs(d.c)do CB[k]=v end for k,v in pairs(d.m)do MS[k]=v end end)

-- ESP System
local EO={} local IO={} local rh=0
local SJ={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
local function gcp(c)local p={}for _,pt in ipairs(c:GetDescendants())do if pt:IsA("BasePart")then p[pt.Name]=pt end end return p end
local function cESP(pl)if pl==L then return end local d={p=pl,b={},n=nil,h={bg=nil,b=nil},di=nil,sk={},li=nil,ch=nil,hi=nil,b3={}}for i=1,4 do local l=Drawing.new("Line")l.Visible=false l.Thickness=E.BT l.Transparency=1 d.b[i]=l end for i=1,12 do local l=Drawing.new("Line")l.Visible=false l.Thickness=E.BT l.Transparency=1 d.b3[i]=l end d.n=Drawing.new("Text")d.n.Visible=false d.n.Size=E.TS d.n.Center=true d.n.Outline=true d.n.OutlineColor=Color3.fromRGB(0,0,0)d.n.Font=Drawing.Fonts.UI d.h.bg=Drawing.new("Square")d.h.bg.Visible=false d.h.bg.Filled=true d.h.bg.Color=Color3.fromRGB(40,40,40)d.h.b=Drawing.new("Square")d.h.b.Visible=false d.h.b.Filled=true d.di=Drawing.new("Text")d.di.Visible=false d.di.Size=E.TS-2 d.di.Center=true d.di.Outline=true d.di.OutlineColor=Color3.fromRGB(0,0,0)d.di.Font=Drawing.Fonts.UI for _,j in ipairs(SJ)do local l=Drawing.new("Line")l.Visible=false l.Thickness=E.ST l.Transparency=1 table.insert(d.sk,l)end d.li=Drawing.new("Line")d.li.Visible=false d.li.Thickness=E.LT d.li.Transparency=1 EO[pl]=d return d end
local function rESP(pl)local d=EO[pl]if not d then return end for _,l in ipairs(d.b)do l:Remove()end for _,l in ipairs(d.b3)do l:Remove()end d.n:Remove()d.h.bg:Remove()d.h.b:Remove()d.di:Remove()for _,l in ipairs(d.sk)do l:Remove()end d.li:Remove()if d.ch then d.ch:Destroy()end if d.hi then d.hi:Destroy()end EO[pl]=nil end
local function cIESP(it)local d={it=it,t=nil,l=nil,s=nil}d.t=Drawing.new("Text")d.t.Visible=false d.t.Size=E.TS d.t.Center=true d.t.Outline=true d.t.OutlineColor=Color3.fromRGB(0,0,0)d.t.Font=Drawing.Fonts.UI d.l=Drawing.new("Line")d.l.Visible=false d.l.Thickness=E.LT d.l.Transparency=1 d.s=Drawing.new("Line")d.s.Visible=false d.s.Thickness=E.SLT d.s.Transparency=1 IO[it]=d return d end
local function rIESP(it)local d=IO[it]if not d then return end d.t:Remove()d.l:Remove()d.s:Remove()IO[it]=nil end
local function gRC()return Color3.fromHSV(rh,1,1)end
local function wV(p)local sp,os,sd=A:WorldToViewportPoint(p)return Vector2.new(sp.X,sp.Y),os,sd end

local fovC=Drawing.new("Circle")fovC.Visible=false fovC.Thickness=1.5 fovC.NumSides=64 fovC.Filled=false
local function gCP()local cl=nil local md=CB.FOV for _,pl in ipairs(P:GetPlayers())do if pl==L then continue end if CB.ATC and pl.Team==L.Team then continue end local c=pl.Character if not c then continue end local pt=c:FindFirstChild(CB.AP)if not pt then continue end local pos,os=wV(pt.Position)if not os then continue end local dst=(Vector2.new(M.X,M.Y+36)-pos).Magnitude if dst<md then md=dst cl=pl end end return cl end

local fBG,fBV=nil,nil
local function sFly()if fBG then fBG:Destroy()end if fBV then fBV:Destroy()end local c=gc()if not c or not HRP then return end fBG=Instance.new("BodyGyro")fBG.P=9e4 fBG.MaxTorque=Vector3.new(9e9,9e9,9e9)fBG.CFrame=HRP.CFrame fBG.Parent=HRP fBV=Instance.new("BodyVelocity")fBV.Velocity=Vector3.new(0,0,0)fBV.MaxForce=Vector3.new(9e9,9e9,9e9)fBV.Parent=HRP end
local function eFly()if fBG then fBG:Destroy()fBG=nil end if fBV then fBV:Destroy()fBV=nil end end
local nC=nil
local function sNc()if nC then nC:Disconnect()end nC=R.Stepped:Connect(function()if not MS.Nc then return end local c=gc()if not c then return end for _,pt in ipairs(c:GetDescendants())do if pt:IsA("BasePart")then pt.CanCollide=false end end end)end
local function eNc()if nC then nC:Disconnect()nC=nil end local c=gc()if not c then return end for _,pt in ipairs(c:GetDescendants())do if pt:IsA("BasePart")then pt.CanCollide=true end end end
local sHC=nil
local function sSH()if sHC then sHC:Disconnect()end sHC=R.Heartbeat:Connect(function()if not MS.SH then return end local c=gc()if not c or not HRP then return end local mv=Vector3.new()if U:IsKeyDown(Enum.KeyCode.W)then mv=mv+A.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S)then mv=mv-A.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A)then mv=mv-A.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D)then mv=mv+A.CFrame.RightVector end if mv.Magnitude>0 then mv=mv.Unit*MS.SHV HRP.Velocity=Vector3.new(mv.X,HRP.Velocity.Y,mv.Z)end end)end
local fHC=nil
local function sFH()if fHC then fHC:Disconnect()end fHC=R.Heartbeat:Connect(function()if not MS.FH then return end local c=gc()if not c or not HRP then return end local mv=Vector3.new()if U:IsKeyDown(Enum.KeyCode.W)then mv=mv+A.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S)then mv=mv-A.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A)then mv=mv-A.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D)then mv=mv+A.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.Space)then mv=mv+Vector3.new(0,1,0)end if U:IsKeyDown(Enum.KeyCode.LeftShift)then mv=mv-Vector3.new(0,1,0)end if mv.Magnitude>0 then HRP.CFrame=HRP.CFrame+mv.Unit*MS.FHS*0.1 end end)end
local nHC=nil
local function sNH()if nHC then nHC:Disconnect()end nHC=R.Heartbeat:Connect(function()if not MS.NH then return end local c=gc()if not c then return end for _,pt in ipairs(c:GetDescendants())do if pt:IsA("BasePart")then pt.CanCollide=false end end end)end

U.InputBegan:Connect(function(i,g)if g then return end if i.KeyCode==Enum.KeyCode.Space and MS.IJ then local c=gc()if c and HRP then HRP.Velocity=Vector3.new(HRP.Velocity.X,MS.JP,HRP.Velocity.Z)end end end)

P.PlayerAdded:Connect(function(pl)cESP(pl)end)
P.PlayerRemoving:Connect(function(pl)rESP(pl)end)
for _,pl in ipairs(P:GetPlayers())do cESP(pl)end

R.RenderStepped:Connect(function()
 rh=(rh+E.RS*0.001)%1
 fovC.Position=Vector2.new(M.X,M.Y+36)fovC.Radius=CB.FOV fovC.Color=CB.FC fovC.Visible=CB.SF and CB.Aim
 if CB.Aim then local t=gCP()if t and t.Character then local pt=t.Character:FindFirstChild(CB.AP)if pt then local pos=wV(pt.Position)local mp=Vector2.new(M.X,M.Y+36)local dst=(pos-mp).Magnitude if dst<=CB.FOV then mousemoverel((pos.X-mp.X)*CB.Sm,(pos.Y-mp.Y)*CB.Sm)end end end end
 if MS.Fly then if not fBG then sFly()end if fBG and fBV then fBG.CFrame=A.CFrame local v=Vector3.new()if U:IsKeyDown(Enum.KeyCode.W)then v=v+A.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S)then v=v-A.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A)then v=v-A.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D)then v=v+A.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.Space)then v=v+Vector3.new(0,1,0)end if U:IsKeyDown(Enum.KeyCode.LeftShift)then v=v-Vector3.new(0,1,0)end fBV.Velocity=v*MS.FS*50 end else eFly()end
 if MS.Nc then sNc()else eNc()end
 if MS.SH then sSH()end
 if MS.FH then sFH()end
 if MS.NH then sNH()end
 if MS.Inv then local c=gc()if c then for _,pt in ipairs(c:GetDescendants())do if pt:IsA("BasePart")then pt.Transparency=1 end end end end
 
 for pl,d in pairs(EO)do
  if not pl or not pl.Parent then rESP(pl)continue end
  local c=pl.Character
  if not c then for _,l in ipairs(d.b)do l.Visible=false end for _,l in ipairs(d.b3)do l.Visible=false end d.n.Visible=false d.h.bg.Visible=false d.h.b.Visible=false d.di.Visible=false for _,l in ipairs(d.sk)do l.Visible=false end d.li.Visible=false continue end
  local h=c:FindFirstChildOfClass("Humanoid")local hrp=c:FindFirstChild("HumanoidRootPart")local hd=c:FindFirstChild("Head")
  if not hrp or not hd or not h then for _,l in ipairs(d.b)do l.Visible=false end for _,l in ipairs(d.b3)do l.Visible=false end d.n.Visible=false d.h.bg.Visible=false d.h.b.Visible=false d.di.Visible=false for _,l in ipairs(d.sk)do l.Visible=false end d.li.Visible=false continue end
  if E.TC and pl.Team==L.Team then for _,l in ipairs(d.b)do l.Visible=false end for _,l in ipairs(d.b3)do l.Visible=false end d.n.Visible=false d.h.bg.Visible=false d.h.b.Visible=false d.di.Visible=false for _,l in ipairs(d.sk)do l.Visible=false end d.li.Visible=false continue end
  local hp,hos,hd=wV(hd.Position+Vector3.new(0,0.5,0))local rp,ros,rd=wV(hrp.Position-Vector3.new(0,3,0))
  if not hos or hd>E.MD then for _,l in ipairs(d.b)do l.Visible=false end for _,l in ipairs(d.b3)do l.Visible=false end d.n.Visible=false d.h.bg.Visible=false d.h.b.Visible=false d.di.Visible=false for _,l in ipairs(d.sk)do l.Visible=false end d.li.Visible=false continue end
  local bh=hp.Y-rp.Y local bw=bh*0.6 local bc=Vector2.new((hp.X+rp.X)/2,(hp.Y+rp.Y)/2)local tl=Vector2.new(bc.X-bw/2,hp.Y)local br=Vector2.new(bc.X+bw/2,rp.Y)
  local cl=E.RB and gRC()or E.BC
  if E.Box then local b=d.b b[1].From=tl b[1].To=Vector2.new(br.X,tl.Y)b[2].From=Vector2.new(br.X,tl.Y)b[2].To=br b[3].From=br b[3].To=Vector2.new(tl.X,br.Y)b[4].From=Vector2.new(tl.X,br.Y)b[4].To=tl for _,l in ipairs(b)do l.Color=cl l.Visible=true end else for _,l in ipairs(d.b)do l.Visible=false end end
  if E.B3D then local sz=c:GetExtentsSize()local cf=hrp.CFrame local cr={cf*CFrame.new(sz.X/2,sz.Y/2,sz.Z/2),cf*CFrame.new(-sz.X/2,sz.Y/2,sz.Z/2),cf*CFrame.new(-sz.X/2,-sz.Y/2,sz.Z/2),cf*CFrame.new(sz.X/2,-sz.Y/2,sz.Z/2),cf*CFrame.new(sz.X/2,sz.Y/2,-sz.Z/2),cf*CFrame.new(-sz.X/2,sz.Y/2,-sz.Z/2),cf*CFrame.new(-sz.X/2,-sz.Y/2,-sz.Z/2),cf*CFrame.new(sz.X/2,-sz.Y/2,-sz.Z/2)}local sc={}for _,crn in ipairs(cr)do local p,os=wV(crn.Position)table.insert(sc,{p=p,os=os})end local ed={{1,2},{2,3},{3,4},{4,1},{5,6},{6,7},{7,8},{8,5},{1,5},{2,6},{3,7},{4,8}}for i,edp in ipairs(ed)do local c1=sc[edp[1]]local c2=sc[edp[2]]if c1.os and c2.os then d.b3[i].From=c1.p d.b3[i].To=c2.p d.b3[i].Color=cl d.b3[i].Visible=true else d.b3[i].Visible=false end end else for _,l in ipairs(d.b3)do l.Visible=false end end
  if E.Name then d.n.Position=Vector2.new(bc.X,tl.Y-18)d.n.Text=pl.Name d.n.Color=cl d.n.Visible=true else d.n.Visible=false end
  if E.HP then local hpct=h.Health/h.MaxHealth local bhgt=bh*0.8 local bx=tl.X-8 local by=bc.Y-bhgt/2 d.h.bg.Position=Vector2.new(bx-2,by-2)d.h.bg.Size=Vector2.new(6,bhgt+4)d.h.bg.Visible=true d.h.b.Position=Vector2.new(bx,by+bhgt*(1-hpct))d.h.b.Size=Vector2.new(4,bhgt*hpct)d.h.b.Color=Color3.fromRGB(255*(1-hpct),255*hpct,0)d.h.b.Visible=true else d.h.bg.Visible=false d.h.b.Visible=false end
  if E.Dist then local dst=math.floor((hrp.Position-A.CFrame.Position).Magnitude)d.di.Position=Vector2.new(bc.X,br.Y+5)d.di.Text="["..dst.."m]"d.di.Color=cl d.di.Visible=true else d.di.Visible=false end
  if E.Skel then local pts=gcp(c)for i,j in ipairs(SJ)do local p1=pts[j[1]]local p2=pts[j[2]]if p1 and p2 then local pp1,o1=wV(p1.Position)local pp2,o2=wV(p2.Position)if o1 and o2 then d.sk[i].From=pp1 d.sk[i].To=pp2 d.sk[i].Color=cl d.sk[i].Visible=true else d.sk[i].Visible=false end else d.sk[i].Visible=false end end else for _,l in ipairs(d.sk)do l.Visible=false end end
  if E.Line then local org=E.TO=="Bottom"and Vector2.new(A.ViewportSize.X/2,A.ViewportSize.Y)or Vector2.new(A.ViewportSize.X/2,A.ViewportSize.Y/2)d.li.From=org d.li.To=Vector2.new(bc.X,br.Y)d.li.Color=cl d.li.Visible=true else d.li.Visible=false end
  if E.Chams then if not d.ch or d.ch.Parent~=c then if d.ch then d.ch:Destroy()end d.ch=Instance.new("Highlight")d.ch.Name="OC"d.ch.FillColor=cl d.ch.OutlineColor=cl d.ch.FillTransparency=E.CT d.ch.OutlineTransparency=0 d.ch.Parent=c end d.ch.FillColor=cl d.ch.OutlineColor=cl d.ch.Enabled=true elseif d.ch then d.ch.Enabled=false end
  if E.HL then if not d.hi or d.hi.Parent~=c then if d.hi then d.hi:Destroy()end d.hi=Instance.new("Highlight")d.hi.Name="OCH"d.hi.FillColor=Color3.fromRGB(0,0,0)d.hi.OutlineColor=cl d.hi.FillTransparency=1 d.hi.OutlineTransparency=0 d.hi.Parent=c end d.hi.OutlineColor=cl d.hi.Enabled=true elseif d.hi then d.hi.Enabled=false end
 end
 
 if E.Item or E.Wep then for _,it in ipairs(W:GetDescendants())do if it:IsA("BasePart")or it:IsA("Model")then local ii=E.Item and(it.Name:lower():match("item")or it.Name:lower():match("loot")or it.Name:lower():match("coin")or it.Name:lower():match("gem"))local iw=E.Wep and(it.Name:lower():match("gun")or it.Name:lower():match("weapon")or it.Name:lower():match("sword")or it.Name:lower():match("tool"))if ii or iw then if not IO[it]then cIESP(it)end local d=IO[it]local pos=it:IsA("BasePart")and it.Position or(it:FindFirstChildWhichIsA("BasePart")and it:FindFirstChildWhichIsA("BasePart").Position)if pos then local sp,os,dp=wV(pos)if os and dp<E.MD then d.t.Position=sp d.t.Text=it.Name d.t.Color=iw and E.WC or E.IC d.t.Visible=true if E.Line then d.l.From=Vector2.new(A.ViewportSize.X/2,A.ViewportSize.Y)d.l.To=sp d.l.Color=iw and E.WC or E.IC d.l.Visible=true else d.l.Visible=false end if E.Snap then d.s.From=Vector2.new(M.X,M.Y+36)d.s.To=sp d.s.Color=iw and E.WC or E.IC d.s.Visible=true else d.s.Visible=false end else d.t.Visible=false d.l.Visible=false d.s.Visible=false end end end end end
end)

local vis=true
U.InputBegan:Connect(function(i,g)if g then return end if i.KeyCode==CFG.tk then vis=not vis MF.Visible=vis end end)
CBt.MouseButton1Click:Connect(function()for _,d in pairs(EO)do rESP(d.p)end G:Destroy()end)
local min=false
MB.MouseButton1Click:Connect(function()min=not min if min then ST(CF,{Size=UDim2.new(1,-20,0,0)},0.3)ST(TC,{Size=UDim2.new(1,0,0,0)},0.3)ST(MF,{Size=UDim2.new(0,CFG.mw,0,66)},0.3)else ST(MF,{Size=UDim2.new(0,CFG.mw,0,CFG.mh)},0.3)wait(0.15)ST(CF,{Size=UDim2.new(1,-20,1,-92)},0.2)ST(TC,{Size=UDim2.new(1,0,0,40)},0.2)end end)

MF.Size=UDim2.new(0,0,0,0)MF.Position=UDim2.new(0.5,0,0.5,0)
ST(MF,{Size=UDim2.new(0,CFG.mw,0,CFG.mh)},0.6,Enum.EasingStyle.Back)
ST(MF,{Position=UDim2.new(0.5,-CFG.mw/2,0.5,-CFG.mh/2)},0.6,Enum.EasingStyle.Back)

print("Nursi Client | tiktok-netovsez | Loaded | Nastya was here")
