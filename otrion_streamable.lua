getgenv().Otrion = {
    Silent_Aim = {
        Main = {
            Enabled = true,
            Mode = "Target", -- { Target }, { Silent }
            Toggle = "C",
            Prediction = 0.13,
            BodyParts = {"Head", "LowerTorso", "UpperTorso"}
        },
        FOV = {
            ShowFOV = false,
            Radius = 70,
            Filled = false,
            Transparency = 0.8,
            Color = Color3.fromRGB(0, 71, 171)
        }
    },
    Aimbot = {
        Main = {
            Enabled = true,
            Key = "C",
            Smoothing = true,
            Smoothness = 0.067,
            Predict = true,
            Prediction = 0.51,
            Shake = true,
            Shakiness = 55,
            BodyParts = {"Head"}
        },
        FOV = {
            UseFOV = true,
            ShowFOV = false,
            Radius = 120,
            Filled = false,
            Transparency = 0.4,
            Color = Color3.fromRGB(0, 71, 171)
        }
    },
    Tracer = {
        Enabled = false,
        Transparency = 0.4,
        Visible = false,
        Color = Color3.fromRGB(137, 207, 240)
    },
    Auto_Prediction = {
        Enabled = true,
        ping20_30 = 0.12588,
        ping30_40 = 0.11911,
        ping40_50 = 0.12471,
        ping50_60 = 0.12766,
        ping60_70 = 0.12731,
        ping70_80 = 0.12951,
        ping80_90 = 0.13181,
        ping90_100 = 0.138,
        ping100_110 = 0.146,
        ping110_120 = 0.1367,
        ping120_130 = 0.1401,
        ping130_140 = 0.1437,
        ping140_150 = 0.153,
        ping150_160 = 0.1514,
        ping160_170 = 0.1663,
        ping170_180 = 0.1672,
        ping180_190 = 0.1848,
        ping190_200 = 0.1865
    },
    Utility = {
        FOVPosition = "Target", -- { Player }, { Mouse }
        Notifications = true
    }
}

local function a()if game.PlaceId==2788229376 then return"UpdateMousePos"elseif game.PlaceId==5602055394 or game.PlaceId==7951883376 then return"MousePos"elseif game.PlaceId==9825515356 then return"GetMousePos"end end;local b=a()function locatemainevent()for c,d in pairs(game:GetService("ReplicatedStorage"):GetDescendants())do if d.Name=="MainEvent"then return d end end end;local e=locatemainevent()local f=getgenv().Otrion;local g=f.Utility;local h=f.Aimbot.Main;local i=f.Aimbot.FOV;local j=f.Silent_Aim.Main;local k=f.Silent_Aim.FOV;local l=f.Tracer;local m=f.Auto_Prediction;local n=Vector3.new;local o=Vector2.new;local p=CFrame.new;local q=game:GetService("UserInputService")local r=game:GetService("RunService")local s=game:GetService("Players")local t=game:GetService("Workspace")local u=false;local v=s.LocalPlayer;local w=nil;local x=nil;local y=false;local z=nil;local A=nil;local B=v:GetMouse()local C=t.CurrentCamera;if g.Notifications then game.StarterGui:SetCore("SendNotification",{Title="Otrion",Text="loading...",Duration=5})wait(3.5)game.StarterGui:SetCore("SendNotification",{Title="Otrion",Text="loaded / SOURCE LEAKED XDDD SKIDDED",Duration=5})end;local D=Drawing.new("Circle")D.Visible=i.ShowFOV;D.Thickness=1;D.NumSides=30;D.Radius=i.Radius*3;D.Color=i.Color;D.Filled=i.Filled;D.Transparency=i.Transparency;local E=Drawing.new("Circle")E.Visible=k.ShowFOV;E.Thickness=1;E.NumSides=30;E.Radius=k.Radius*3;E.Color=k.Color;E.Filled=k.Filled;E.Transparency=k.Transparency;local F=Drawing.new("Line")F.Color=l.Color;F.Transparency=l.Transparency;F.Thickness=1;F.Visible=l.Visible;local function G()local H,I=math.huge,nil;for c,d in pairs(s:GetPlayers())do local c,J=C:WorldToViewportPoint(d.Character.PrimaryPart.Position)if d~=v and d.Character and d.Character:FindFirstChild("Humanoid")and d.Character.Humanoid.Health~=0 and d.Character:FindFirstChild("HumanoidRootPart")and J then local K=C:WorldToViewportPoint(d.Character.PrimaryPart.Position)local L=(o(K.X,K.Y)-o(B.X,B.Y+36)).magnitude;if L<H then I=d;H=L end end end;return I end;local function M()local H,N=math.huge,nil;if w then for c,d in pairs(w.Character:GetChildren())do if table.find(h.BodyParts,d.Name)then local K=C:WorldToViewportPoint(d.Position)local O=(o(B.X,B.Y+36)-o(K.X,K.Y)).Magnitude;if O<H then H=O;N=d end end end;return N.Name end end;local function P()local H,N=math.huge,nil;if w then for c,d in pairs(w.Character:GetChildren())do if table.find(j.BodyParts,d.Name)then local K=C:WorldToViewportPoint(d.Position)local O=(o(B.X,B.Y+36)-o(K.X,K.Y)).Magnitude;if O<H then H=O;N=d end end end;return N.Name end end;local function Q(R)if R.Character.HumanoidRootPart.Velocity.Y<-5 and R.Character.Humanoid:GetState()~=Enum.HumanoidStateType.Freefall or R.Character.HumanoidRootPart.Velocity.Y<-50 then return true elseif R and(R.Character.HumanoidRootPart.Velocity.X>35 or R.Character.HumanoidRootPart.Velocity.X<-35)then return true elseif R and R.Character.HumanoidRootPart.Velocity.Y>60 then return true elseif R and(R.Character.HumanoidRootPart.Velocity.Z>35 or R.Character.HumanoidRootPart.Velocity.Z<-35)then return true else return false end end;local function S(T,U,V)if T then local K=nil;if not Q(T)then K=C:WorldToViewportPoint(T.Character.PrimaryPart.Position+T.Character.PrimaryPart.Velocity*U.Prediction)else K=C:WorldToViewportPoint(T.Character.PrimaryPart.Position+T.Character.Humanoid.MoveDirection*T.Character.Humanoid.WalkSpeed*U.Prediction)end;local W=(o(B.X,B.Y+36)-o(K.X,K.Y)).Magnitude;if W<V*3 then return true else return false end end end;local function X()if z then if A and S(z,j,E.Radius)then if not Q(z)then e:FireServer(b,z.Character[A].Position+z.Character[A].Velocity*j.Prediction)else e:FireServer(b,z.Character[A].Position+z.Character.Humanoid.MoveDirection*z.Character.Humanoid.WalkSpeed*j.Prediction)end end end end;local function Y(T,U,V)if T then if i.UseFOV then local K=nil;if not Q(T)then K=C:WorldToViewportPoint(T.Character.PrimaryPart.Position+T.Character.PrimaryPart.Velocity*U.Prediction)else K=C:WorldToViewportPoint(T.Character.PrimaryPart.Position+T.Character.Humanoid.MoveDirection*T.Character.Humanoid.WalkSpeed*U.Prediction)end;local W=(o(B.X,B.Y+36)-o(K.X,K.Y)).Magnitude;if W<V*3 then return true else return false end else return true end end end;q.InputBegan:Connect(function(Z,I)if not I then if Z.KeyCode==Enum.KeyCode[h.Key:upper()]then u=not u;if u then w=G()if g.Notifications then game.StarterGui:SetCore("SendNotification",{Title="Otrion",Text="Targetting "..w.Name,Duration=5})end elseif not u then w=nil;if g.Notifications then game.StarterGui:SetCore("SendNotification",{Title="Otrion",Text="Untargetted",Duration=5})end end end;if Z.KeyCode==Enum.KeyCode[j.Toggle:upper()]and j=="Silent"then if y then y=false;if g.Notifications then game.StarterGui:SetCore("SendNotification",{Title="Otrion",Text="Disabled Silent Aim ",Duration=5})end else y=true;if g.Notifications then game.StarterGui:SetCore("SendNotification",{Title="Otrion",Text="Enabled Silent Aim ",Duration=5})end end end end end)r.RenderStepped:Connect(function()if w then x=M()local K=nil;local _=nil;if w.Character.BodyEffects["K.O"].Value==true or v.Character.BodyEffects["K.O"].Value==true then u=false;w=nil else if h.Shake then if h.Predict then if not Q(w)then _=w.Character[x].Position+w.Character[x].Velocity*h.Prediction+n(math.random(-h.Shakiness,h.Shakiness),math.random(-h.Shakiness,h.Shakiness),math.random(-h.Shakiness,h.Shakiness))*0.1 else _=w.Character[x].Position+w.Character.Humanoid.MoveDirection*w.Character.Humanoid.WalkSpeed*h.Prediction+n(math.random(-h.Shakiness,h.Shakiness),math.random(-h.Shakiness,h.Shakiness),math.random(-h.Shakiness,h.Shakiness))*0.1 end;K=C:WorldToViewportPoint(_)else _=w.Character[x].Position+n(math.random(-h.Shakiness,h.Shakiness),math.random(-h.Shakiness,h.Shakiness),math.random(-h.Shakiness,h.Shakiness))*0.1;K=C:WorldToViewportPoint(_)end else if h.Predict then if not Q(w)then _=w.Character[x].Position+w.Character[x].Velocity*h.Prediction else _=w.Character[x].Position+w.Character.Humanoid.MoveDirection*w.Character.Humanoid.WalkSpeed*h.Prediction end;K=C:WorldToViewportPoint(_)else _=w.Character[x].Position;K=C:WorldToViewportPoint(_)end end;if Y(w,h,D.Radius)then local a0=nil;if h.Smoothing then a0=p(C.CFrame.p,_)C.CFrame=C.CFrame:Lerp(a0,h.Smoothness,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut)else C.CFrame=p(C.CFrame.p,_)end end;if g.FOVPosition=="Mouse"then if i.ShowFOV then D.Position=o(B.X,B.Y+36)end;if k.ShowFOV then E.Position=o(B.X,B.Y+36)end elseif g.FOVPosition=="Target"then if i.ShowFOV then D.Position=o(K.X,K.Y)end;if k.ShowFOV then E.Position=o(K.X,K.Y)end end;if l.Enabled then F.Visible=true;F.From=o(B.X,B.Y+36)F.To=o(K.X,K.Y)end end else D.Position=o(B.X,B.Y+36)E.Position=o(B.X,B.Y+36)F.Visible=false end end)v.Character.ChildAdded:Connect(function(a1)if a1:IsA("Tool")then a1.Activated:connect(function()if j.Mode=="Silent"then if y then z=G()if z then A=P()if A then X()end end end elseif j.Mode=="Target"then if u then z=w;if z then A=P()if A then X()end end end end end)end end)v.CharacterAdded:Connect(function(a2)a2.ChildAdded:Connect(function(a1)a1.Activated:connect(function()if j.Mode=="Silent"then if y then z=G()if z then A=P()if A then X()end end end elseif j.Mode=="Target"then if u then z=w;if z then A=P()if A then X()end end end end end)end)end)coroutine.resume(coroutine.create(function()while true do if m.Enabled then local a3=game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()if a3<=40 then j.Prediction=m.ping30_40 elseif a3<=50 then j.Prediction=m.ping40_50 elseif a3<=60 then j.Prediction=m.ping50_60 elseif a3<=70 then j.Prediction=m.ping60_70 elseif a3<=80 then j.Prediction=m.ping70_80 elseif a3<=90 then j.Prediction=m.ping80_90 elseif a3<=100 then j.Prediction=m.ping90_100 elseif a3<=110 then j.Prediction=m.ping100_110 elseif a3<=120 then j.Prediction=m.ping110_120 elseif a3<=130 then j.Prediction=m.ping120_130 elseif a3<=140 then j.Prediction=m.ping130_140 elseif a3<=150 then j.Prediction=m.ping140_150 elseif a3<=160 then j.Prediction=m.ping150_160 elseif a3<=170 then j.Prediction=m.ping160_170 elseif a3<=180 then j.Prediction=m.ping170_180 elseif a3<=190 then j.Prediction=m.ping180_190 elseif a3<=200 then j.Prediction=m.ping190_200 end end;task.wait(0.7)end end))
