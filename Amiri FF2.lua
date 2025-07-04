
-- // FF2 Made by Amiri \\ --

-- // Variables \\ --

local Ocean = {}

local RS 	 = game:GetService("RunService")
local TS	 = game:GetService("TweenService")
local UIS	 = game:GetService("UserInputService")
local Mouse  = game:GetService("Players").LocalPlayer:GetMouse()

-- Create GUI Instance
local TyrantUI = Instance.new("ScreenGui", RS:IsStudio() and game.Players.LocalPlayer.PlayerGui or gethui())
TyrantUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Variable to track GUI visibility
local guiVisible = true -- Initially visible

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end -- Ignore input if it's already used by the game

    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        TyrantUI.Enabled = guiVisible -- Toggle GUI visibility
    end
end)

function Ocean:NewWindow()
    local Window = {CurrentTab = nil}
    local Main = Instance.new("Frame", TyrantUI)
    Main.Name = "Main"
    Main.Position = UDim2.fromScale(0.248, 0.220)
    Main.Size = UDim2.fromScale(0.350, 0.550)
    Main.BackgroundColor3 = Color3.fromRGB(9, 8, 8)
    Main.BorderSizePixel = 0
    Main.ZIndex = 1

    -- Additional UI setup goes here
    
    return Window
end

function createInstance(className, properties)
	local instance = Instance.new(className)
	for k, v in pairs(properties) do
		if typeof(k) ~= 'string' then
			continue
		end

		instance[k] = v
	end
	return instance
end
	
local function CreateDrag(gui)
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		TS:Create(gui, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play();
	end

	local lastEnd = 0
	local lastMoved = 0
	local con
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

		end
	end)

	UIS.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)


	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
			lastMoved = os.clock()
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

-- // Instances

local TyrantUI = Instance.new("ScreenGui", RS:IsStudio() and game.Players.LocalPlayer.PlayerGui or gethui())
TyrantUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function Ocean:NewWindow()

	local Window = {
		CurrentTab = nil
	}
	

	local Main = createInstance("Frame", {
		Name = "Main",
		Position = UDim2.fromScale(0.248, 0.220),
		Size = UDim2.fromScale(0.350, 0.550),
		Parent = TyrantUI,
		BackgroundColor3 = Color3.fromRGB(9, 8, 8),
		BorderSizePixel = 0,
		ZIndex = 1
	})

	local Divider1 = createInstance("Frame", {
		Name = "Divider1",
		Position = UDim2.fromScale(0.311, 0.000),
		Size = UDim2.new(0, 2, 1, 0),
		Parent = Main,
		BackgroundColor3 = Color3.fromRGB(82, 81, 81),
		BorderSizePixel = 0,
		ZIndex = 2
	})

	local Divider1_1 = createInstance("Frame", {
		Name = "Divider1_1",
		Position = UDim2.fromScale(0.311, 0.130),
		Size = UDim2.new(.689, 0, 0, 2),
		Parent = Main,
		BackgroundColor3 = Color3.fromRGB(82, 81, 81),
		BorderSizePixel = 0,
		ZIndex = 2
	})

	local TabHolder = createInstance("ScrollingFrame", {
		Name = "TabHolder",
		Position = UDim2.fromScale(0.000, 0.200),
		Size = UDim2.fromScale(0.311, 0.800),
		Parent = Main,
		BackgroundTransparency = 1,
		ScrollBarThickness = 0,
		ClipsDescendants = true,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = 3
	})
	
	local Title = createInstance("TextLabel", {
		Name = "Title",
		Position = UDim2.fromScale(0.029, 0.030),
		Size = UDim2.fromScale(0.250, 0.100),
		Parent = Main,
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		Text = '<font color="#FFFFFF">Wiiii</font>',
		TextScaled = true,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		RichText = true,
		TextWrapped = true,
		TextColor3 = Color3.fromRGB(28, 28, 28),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 18,
		BorderSizePixel = 0,
		ZIndex = 4
	})

	local TabLayout = createInstance("UIListLayout", {
		Parent = TabHolder,
		Padding = UDim.new(0, 5),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	local MainCorner = createInstance("UICorner", {
		Parent = Main
	})

	local MainConstraint = createInstance("UIAspectRatioConstraint", {
		AspectRatio = 1.251,
		Parent = Main
	})
	
	CreateDrag(Main)
	
	function Window:Tab(Title: string, ImageID: string)
		
		local tab = {}
		
		local Tab = createInstance("ImageButton", {
			Name = "Tab",
			Position = UDim2.fromScale(0.000, 0.000),
			Size = UDim2.fromScale(0.800, 0.040),
			Parent = TabHolder,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			BackgroundColor3 = Color3.fromRGB(0, 128, 0),
			BorderSizePixel = 0,
			ZIndex = 1
		})

		local TabCorner = createInstance("UICorner", {
			Parent = Tab,
			CornerRadius = UDim.new(0, 6)
		})

		local TabTitle = createInstance("TextLabel", {
			Name = "TabTitle",
			Position = UDim2.fromScale(0.300, 0.500),
			Size = UDim2.fromScale(0.700, 0.600),
			Parent = Tab,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Font = Enum.Font.SourceSans,
			Text = Title or "Tab",
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			TextColor3 = Color3.fromRGB(153, 153, 153),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 14,
			BorderSizePixel = 0,
			ZIndex = 1
		})

		local Icon = createInstance("ImageLabel", {
			Name = "Icon",
			Position = UDim2.fromScale(0.044, 0.200),
			Size = UDim2.fromScale(0.600, 0.600),
			Parent = Tab,
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			ImageColor3 = Color3.fromRGB(153, 153, 153),
			Image = "rbxassetid://"..ImageID,
			BorderSizePixel = 0,
			ZIndex = 1
		})

		local IconConstraint = createInstance("UIAspectRatioConstraint", {
			AspectRatio = 1.000,
			Parent = Icon
		})

		local Canvas = createInstance("ScrollingFrame", {
			Name = "Canvas",
			Position = UDim2.fromScale(0.311, 0.150),
			Size = UDim2.fromScale(0.689, 0.850),
			Parent = Main,
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			ClipsDescendants = true,
			Visible	= false,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			ZIndex = 1
		})
		
		local CanvasLayout = createInstance("UIListLayout", {
			Parent = Canvas,
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		local CanvasPad = createInstance("UIPadding", {
			Parent = Canvas,
			PaddingTop = UDim.new(0, 5)
		})
		
		local Path = createInstance("TextLabel", {
			Name = "Path",
			Position = UDim2.fromScale(0.350, 0.045),
			Size = UDim2.fromScale(0.7, 0.055),
			Parent = Main,
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			Text = 'Wii / FF2 / <font color="#FFFFFF">'..Title..'</font>',
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			RichText = true,
			TextWrapped = true,
			Visible = false,
			TextColor3 = Color3.fromRGB(102, 102, 102),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 18,
			BorderSizePixel = 0,
			ZIndex = 1
		})
		
		function tab:Activate()
			if Window.CurrentTab ~= nil then
				Window.CurrentTab:Deactivate()
			end
			Window.CurrentTab = tab
			TS:Create(Tab, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {BackgroundTransparency =.5}):Play()
			TS:Create(TabTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(0, 128, 0)}):Play()
			TS:Create(Icon, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {ImageColor3 = Color3.fromRGB(0, 128, 0)}):Play()
			Path.Visible = true
			Canvas.Visible = true
		end
		
		function tab:Deactivate()
			TS:Create(Tab, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {BackgroundTransparency =1}):Play()
			TS:Create(TabTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(153, 153, 153)}):Play()
			TS:Create(Icon, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {ImageColor3 = Color3.fromRGB(153, 153, 153)}):Play()
			Path.Visible = false
			Canvas.Visible = false
		end
		
		Tab.MouseButton1Down:Connect(function()
			tab:Activate()
		end)
		
		if Window.CurrentTab == nil then
			tab:Activate()
		end
		
		function tab:Toggle(Title: string, Options: table)
			
			local Settings = {
				Title 	 = Title or "Toggle",
				Value	 = Options.Default or false,
				Default  = Options.Default or false,
				Callback = Options.Callback or function() end
			}
			
			local Toggle = createInstance("ImageButton", {
				Name = "Toggle",
				Position = UDim2.fromScale(0.000, 0.000),
				Size = UDim2.fromScale(0.900, 0.10),
				Parent = Canvas,
				BackgroundTransparency = 0.8999999761581421,
				BackgroundColor3 = Color3.fromRGB(0, 128, 0),
				BorderSizePixel = 0,
				ZIndex = 1,
				AutoButtonColor = false
			})

			local ToggleCorner_12 = createInstance("UICorner", {
				Parent = Toggle,
				CornerRadius = UDim.new(0, 6)
			})

			local ToggleStroke_13 = createInstance("UIStroke", {
				Parent = Toggle,
				Color = Color3.fromRGB(169,169,169),
				Thickness = 1,
				Transparency = 0.5
			})

			local ToggleTitle_14 = createInstance("TextLabel", {
				Name = "ToggleTitle_14",
				Position = UDim2.fromScale(0.030, 0.500),
				Size = UDim2.fromScale(.9, 0.500),
				Parent = Toggle,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Font = Enum.Font.SourceSans,
				Text = Settings.Title,
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				TextColor3 = Color3.fromRGB(188, 188, 188),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local Switch_15 = createInstance("Frame", {
				Name = "Switch_15",
				Position = UDim2.fromScale(0.850, 0.500),
				Size = UDim2.fromScale(0.100, 0.300),
				Parent = Toggle,
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(56, 56, 56),
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local SwitchCorner_16 = createInstance("UICorner", {
				Parent = Switch_15,
				CornerRadius = UDim.new(1, 0)
			})

			local Knob_17 = createInstance("Frame", {
				Name = "Knob_17",
				Position = UDim2.fromScale(-0.150, 0.500),
				Size = UDim2.fromScale(1.100, 1.500),
				Parent = Switch_15,
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(171, 171, 171),
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local KnobConstraint_18 = createInstance("UIAspectRatioConstraint", {
				AspectRatio = 1.000,
				Parent = Knob_17
			})

			local KnobCorner_19 = createInstance("UICorner", {
				Parent = Knob_17,
				CornerRadius = UDim.new(1, 0)
			})
			
			function Settings:Toggle(v)
				if v ~= nil then
					Settings.Callback(v)
				else
					Settings.Value = not Settings.Value
					Settings.Callback(Settings.Value)
				end
				
				if Settings.Value then
					TS:Create(Switch_15, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(52, 51, 74)}):Play()
					TS:Create(Knob_17, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(0, 128, 0)}):Play()
					TS:Create(Knob_17, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Position = UDim2.fromScale(0.550, 0.500)}):Play()
				else
					TS:Create(Switch_15, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(56, 56, 56)}):Play()
					TS:Create(Knob_17, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(171, 171, 171)}):Play()
					TS:Create(Knob_17, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {Position = UDim2.fromScale(-0.150, 0.500)}):Play()
				end
			end
			
			Settings:Toggle(Settings.Default)
			
			Toggle.MouseButton1Down:Connect(function()
				Settings:Toggle()
			end)
			
			return Settings
		end
		
		function tab:Slider(Title: string, Options: table)
			
			local Settings = {
				Title	    = Title or "Slider",
				Default	    = Options.Default or 0,
				Value		= Options.Default,
				Min 	    = Options.Min or 0,
				Max		    = Options.Max or 100,
				Callback    = Options.Callback or function() end,
				Connections = {}
			}
			
			local Slider = createInstance("ImageButton", {
				Name = "Slider",
				Position = UDim2.new(0.000, 0.000, 0.000, 0.000),
				Size = UDim2.new(0.900, 0.000, 0.15, 0.000),
				Parent = Canvas,
				BackgroundTransparency = 0.8999999761581421,
				BackgroundColor3 = Color3.fromRGB(192,192,192),
				BorderSizePixel = 0,
				ZIndex = 1,
				AutoButtonColor = false
			})

			local SliderCorner = createInstance("UICorner", {
				Parent = Slider,
				CornerRadius = UDim.new(0, 6)
			})

			local SliderStroke = createInstance("UIStroke", {
				Parent = Slider,
				Color = Color3.fromRGB(192,192,192),
				Thickness = 1,
				Transparency = 0.5
			})

			local SliderAmount = createInstance("TextBox", {
				Name = "SliderAmount",
				Position = UDim2.new(0.880, 0.000, 0.300, 0.000),
				Size = UDim2.new(0.100, 0.000, 0.350, 0.000),
				Parent = Slider,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Font = Enum.Font.SourceSans,
				Text = Settings.Default,
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				TextColor3 = Color3.fromRGB(188, 188, 188),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local SliderTitle = createInstance("TextLabel", {
				Name = "SliderTitle",
				Position = UDim2.new(0.030, 0.000, 0.300, 0.000),
				Size = UDim2.new(0.900, 0.000, 0.350, 0.000),
				Parent = Slider,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Font = Enum.Font.SourceSans,
				Text = Settings.Title,
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				TextColor3 = Color3.fromRGB(188, 188, 188),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local SliderBack = createInstance("Frame", {
				Name = "SliderBack",
				Position = UDim2.new(0.500, 0.000, 0.700, 0.000),
				Size = UDim2.new(0.930, 0.000, 0.000, 4.000),
				Parent = Slider,
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.fromRGB(59,59,59),
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local BackCorner = createInstance("UICorner", {
				Parent = SliderBack,
				CornerRadius = UDim.new(1, 0)
			})

			local SliderMain = createInstance("Frame", {
				Name = "SliderMain",
				Position = UDim2.new(0.000, 0.000, 0.000, 0.000),
				Size = UDim2.new(0.431, 0.000, 0.000, 4.000),
				Parent = SliderBack,
				BackgroundColor3 = Color3.fromRGB(192,192,192),
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local SMCorner = createInstance("UICorner", {
				Parent = SliderMain,
				CornerRadius = UDim.new(1, 0)
			})

			Settings.Callback(Settings.Value)

			-- // Functions

			function Settings:GetValue()
				return tonumber(SliderAmount.Text)
			end

			function Settings:SetValue(v)
				if not v then

					local percent   = math.clamp((Mouse.X - SliderBack.AbsolutePosition.X) / (SliderBack.AbsoluteSize.X), 0, 1)
					local Value   	= ((Settings.Max - Settings.Min) * percent) + Settings.Min

					SliderMain.Size = UDim2.fromScale(percent, 1)
					SliderAmount.Text  = tonumber(Value % 1 == 0 and string.format("%.0f", Value) or string.format("%.1f", Value))

				else

					SliderAmount.Text  = tonumber(v % 1 == 0 and string.format("%.0f", v) or string.format("%.1f", v))
					TS:Create(SliderMain, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.fromScale((v - Settings.Min) / (Settings.Max - Settings.Min), 1)}):Play()

				end
				Settings.Callback(Settings:GetValue())
				Settings.Value = SliderAmount.Text
			end


			-- // Input Listener

			SliderAmount.FocusLost:Connect(function()
				Settings:SetValue(math.clamp(SliderAmount.Text, Settings.Min, Settings.Max))
			end)

			table.insert(Settings.Connections, UIS.InputEnded:Connect(function(input, gpe)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
				end
			end))

			table.insert(Settings.Connections, Slider.MouseButton1Down:Connect(function()
				if Connection then Connection:Disconnect() end

				Connection = RS.Heartbeat:Connect(function()
					Settings:SetValue()
				end)
			end))
			
			return Settings
		end
		
		function tab:Dropdown(Title: string, Options: table)
			
			local Settings = {
				Title 	 = Title or "Dropdown",
				Default  = Options.Default or "None",
				Options  = Options.Options or {},
				Callback = Options.Callback or function() end
			}
			

			local Dropdown = createInstance("ImageButton", {
				Name = "Dropdown",
				Position = UDim2.new(0.000, 0.000, 0.000, 0.000),
				Size = UDim2.fromScale(0.900, 0.10),
				Parent = Canvas,
				BackgroundTransparency = 0.8999999761581421,
				BackgroundColor3 = Color3.fromRGB(169, 169, 169),
				BorderSizePixel = 0,
				AutoButtonColor = false,
				ZIndex = 20
			})

			local DropdownCorner = createInstance("UICorner", {
				Parent = Dropdown,
				CornerRadius = UDim.new(0, 6)
			})

			local DropdownStroke = createInstance("UIStroke", {
				Parent = Dropdown,
				Color = Color3.fromRGB(169, 169, 169),
				Thickness = 1,
				Transparency = 0.5
			})

			local DropdownTitle = createInstance("TextLabel", {
				Name = "DropdownTitle",
				Position = UDim2.new(0.030, 0.000, 0.500, 0.000),
				Size = UDim2.new(0.000, 200.000, 0.500, 0.000),
				Parent = Dropdown,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Font = Enum.Font.SourceSans,
				Text = Settings.Title,
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				TextColor3 = Color3.fromRGB(188, 188, 188),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local Selected = createInstance("Frame", {
				Name = "Selected",
				Position = UDim2.new(0.950, 0.000, 0.500, 0.000),
				Size = UDim2.new(0.100, 0.000, 0.500, 0.000),
				Parent = Dropdown,
				BackgroundTransparency = 0.5,
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local SelectedCorner = createInstance("UICorner", {
				Parent = Selected,
				CornerRadius = UDim.new(0, 6)
			})

			local SelectedText = createInstance("TextLabel", {
				Name = "SelectedText",
				Position = UDim2.new(0.000, 0.000, 0.500, 0.000),
				Size = UDim2.new(1.000, 0.000, 1.000, 0.000),
				Parent = Selected,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Font = Enum.Font.SourceSans,
				Text = Settings.Default,
				AutomaticSize = Enum.AutomaticSize.X,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				TextColor3 = Color3.fromRGB(188, 188, 188),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				BorderSizePixel = 0,
				ZIndex = 1
			})

			local SelectedPad = createInstance("UIPadding", {
				Parent = Selected,
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			})

			local OptionHolder = createInstance("Frame", {
				Name = "OptionHolder",
				Position = UDim2.new(0.950, 0.000, 0.900, 0.000),
				Size = UDim2.new(0.100, 0.000, 0.000, 0.000),
				Parent = Dropdown,
				AnchorPoint = Vector2.new(1, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = Color3.fromRGB(10, 12, 19),
				BorderSizePixel = 0,
				Visible = false,
				ZIndex = 1
			})

			local OptionLayout = createInstance("UIListLayout", {
				Parent = OptionHolder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			})

			local OptionPad = createInstance("UIPadding", {
				Parent = OptionHolder,
				PaddingBottom = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			})

			local OptionsCorner = createInstance("UICorner", {
				Parent = OptionHolder,
				CornerRadius = UDim.new(0, 6)
			})

			local DropdownStroke_1 = createInstance("UIStroke", {
				Parent = OptionHolder,
				Color = Color3.fromRGB(169, 169, 169),
				Thickness = 1,
				Transparency = 0.5
			})
			
			Dropdown.MouseButton1Down:Connect(function()
				OptionHolder.Visible = not OptionHolder.Visible
			end)

			table.foreach(Settings.Options, function(i, v)
				
				local Option = createInstance("TextButton", {
					Name = "Option",
					Position = UDim2.new(0.000, 0.000, 0.500, 0.000),
					Size = UDim2.new(0.195, 0.000, 0.000, 20.000),
					Parent = OptionHolder,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Font = Enum.Font.SourceSans,
					Text = v,
					AutomaticSize = Enum.AutomaticSize.X,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextWrapped = true,
					TextColor3 = Color3.fromRGB(188, 188, 188),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutoButtonColor = false,
					TextSize = 14,
					BorderSizePixel = 0,
					ZIndex = 21
				})
				
				Option.MouseButton1Down:Connect(function()
					SelectedText.Text = Option.Text
					OptionHolder.Visible = false
					Settings.Callback(Option.Text)
				end)
				
			end)
			
			return Settings
		end
		
		return tab
	end
	
	return Window
end
local on2
local on = false
local legmagdist = 5
local bldist = 25
local regdist = 20
local leaguedist = 3
local magType = "Unknown"
local tprange = 0
getgenv().msVersion = "Unknown"
getgenv().msSecondVerRange = 15
--// Mags made by 4dsdevalt on discord // --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local NewC
local CatchRight;

task.spawn(function()
    while task.wait() do
        Character.ChildRemoved:Connect(function(child)
            if child.Name == "CatchRight" then
                CatchRight = nil
            end
        end)
        Character.ChildAdded:Connect(function(child)
            if child.Name == "CatchRight" then
                CatchRight = child
            end
        end)
    end
end)




LocalPlayer.CharacterAdded:Connect(function(character)
    wait()
    Character = character 
end)








 

local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
--// Functions
local CustomFireTouchInterest = function(Part, Transmitter, Toggle)
    if on and Transmitter and Part then
        if (Toggle == 1) then
            local Direction = (Part.Position - Transmitter.Position).Unit
            local Calculation = Direction + Vector3.new(1, 1, 1)
            Transmitter.CFrame = (Part.CFrame + Calculation)
        else
            return
        end
    else
        return
    end
end

--// Main Loop
task.spawn(function()
    CatchRight = Character:WaitForChild("CatchRight")
    while task.wait() do
        if on then
            for Index, Object in next, workspace:GetChildren() do
                    if on then
                    if Object:IsA("BasePart") and Object.Name == "Football" then
						if msVersion == "Magnets V1" then
							local Distance = (HumanoidRootPart.Position - Object.Position).Magnitude
								if string.find(getexecutorname(), "Solara") or string.find(getexecutorname(), "Wind") or string.find(getexecutorname(), "Zorara")   then
									if magType == "Legit" then
											if (Distance <= legmagdist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										elseif magType == "Blatant" then
											if (Distance <= bldist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										elseif magType == "League" then
											if (Distance <= leaguedist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										elseif magType == "Regular" then
											if (Distance <= regdist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										end
									else
									if not firetouchinterest then
										if magType == "Legit" then
											if (Distance <= legmagdist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										elseif magType == "Blatant" then
											if (Distance <= bldist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										elseif magType == "League" then
											if (Distance <= leaguedist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										elseif magType == "Regular" then
											if (Distance <= regdist) then
												CustomFireTouchInterest(CatchRight, Object, 1)
												CustomFireTouchInterest(CatchRight, Object, 1)
												task.wait()
												CustomFireTouchInterest(CatchRight, Object, 0)
												CustomFireTouchInterest(CatchRight, Object, 0)
											end
										end
									else
										if magType == "Legit" then
											if (Distance <= legmagdist) then
												firetouchinterest(CatchRight, Object, 1)
												firetouchinterest(CatchRight, Object, 1)
												task.wait()
												firetouchinterest(CatchRight, Object, 0)
												firetouchinterest(CatchRight, Object, 0)
											end
										elseif magType == "Blatant" then
											if (Distance <= bldist) then
												firetouchinterest(CatchRight, Object, 1)
												firetouchinterest(CatchRight, Object, 1)
												task.wait()
												firetouchinterest(CatchRight, Object, 0)
												firetouchinterest(CatchRight, Object, 0)
											end
										elseif magType == "League" then
											if (Distance <= leaguedist) then

												firetouchinterest(CatchRight, Object, 1)
												firetouchinterest(CatchRight, Object, 1)
												task.wait()
												firetouchinterest(CatchRight, Object, 0)
												firetouchinterest(CatchRight, Object, 0)
											end
										elseif magType == "Regular" then
											if (Distance <= regdist) then
												firetouchinterest(CatchRight, Object, 1)
												firetouchinterest(CatchRight, Object, 1)
												task.wait()
												firetouchinterest(CatchRight, Object, 0)
												firetouchinterest(CatchRight, Object, 0)
											end
										end
									end
								end
							else
								workspace.ChildAdded:Connect(function(child)
									if child.Name == "Football" and child:IsA("BasePart") and on then
										child.CanCollide = false
										child.Size = Vector3.new(msSecondVerRange, msSecondVerRange, msSecondVerRange)
									end
								end)
							end
						end
                    end
                end
            end
        end
    end)
    

	local on3;
	task.spawn(function()
		workspace.ChildAdded:Connect(function(c)
			if c.Name == "Football" and c:IsA("BasePart") then
				local part = Instance.new("Part")
				part.Name = "visual"
				part.Anchored = false
				part.Parent = workspace
				part.Transparency = 0.5
				part.CanCollide = false
	
				
				local function upd()
					while on3 and on do
						task.wait()
						if magType == "Regular" then
							part.Size = Vector3.new(regdist, regdist, regdist)
						elseif magType == "Blatant" then
							part.Size = Vector3.new(bldist, bldist, bldist)
						elseif magType == "Legit" then
							part.Size = Vector3.new(legmagdist, legmagdist, legmagdist)
						elseif magType == "League" then
							part.Size = Vector3.new(leaguedist, leaguedist, leaguedist)
						end
						part.CFrame = c.CFrame
					end
				end
	
				
				task.spawn(upd)
	
				
				task.delay(10, function()
					if part and part.Parent then
						part:Destroy()
					end
				end)
			end
		end)
	end)

    local ScreenGui = Instance.new("ScreenGui")
    local Angle = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local UIGradient = Instance.new("UIGradient")
    local TextLabel = Instance.new("TextLabel")
    local AngleNum = Instance.new("TextLabel")
    local Powa = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local UIGradient_2 = Instance.new("UIGradient")
    local TextLabel_2 = Instance.new("TextLabel")
    local PowerNum = Instance.new("TextLabel")
    local UIStroke_2 = Instance.new("UIStroke")
    local Target = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local UIGradient_3 = Instance.new("UIGradient")
    local TextLabel_3 = Instance.new("TextLabel")
    local TargetPlr = Instance.new("TextLabel")
    local UIStroke_3 = Instance.new("UIStroke")
    local Mode = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local UIGradient_4 = Instance.new("UIGradient")
    local TextLabel_4 = Instance.new("TextLabel")
    local ModeText = Instance.new("TextLabel")
    local UIStroke_4 = Instance.new("UIStroke")
    local Catchable = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local UIGradient_5 = Instance.new("UIGradient")
    local TextLabel_5 = Instance.new("TextLabel")
    local CatchText = Instance.new("TextLabel")
    local UIStroke_5 = Instance.new("UIStroke")
    local Interceptable = Instance.new("Frame")
    local UICorner_6 = Instance.new("UICorner")
    local UIGradient_6 = Instance.new("UIGradient")
    local TextLabel_6 = Instance.new("TextLabel")
    local IntText = Instance.new("TextLabel")
    local UIStroke_6 = Instance.new("UIStroke")
    local ATime = Instance.new("Frame")
    local UICorner_7 = Instance.new("UICorner")
    local UIGradient_7 = Instance.new("UIGradient")
    local TextLabel_7 = Instance.new("TextLabel")
    local airtimetext = Instance.new("TextLabel")
    local UIStroke_7 = Instance.new("UIStroke")
    
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui
    
    Angle.Name = "Angle"
    Angle.Size = UDim2.new(0, 115, 0, 106)
    Angle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Angle.BackgroundTransparency = 0.44999998807907104
    Angle.Position = UDim2.new(0.216752619, 0, -0.00772987632, 0)
    Angle.BorderSizePixel = 0
    Angle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Angle.Parent = ScreenGui
    
    UICorner.Name = "UICorner"
    UICorner.Parent = Angle
    
    UIStroke.Name = "UIStroke"
    UIStroke.Color = Color3.fromRGB(165, 170, 167)
    UIStroke.Thickness = 1.2000000476837158
    UIStroke.Parent = Angle
    
    UIGradient.Name = "UIGradient"
    UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient.Parent = Angle
    
    TextLabel.Name = "TextLabel"
    TextLabel.Size = UDim2.new(0, 150, 0, 42)
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel.Text = "Angle"
    TextLabel.TextSize = 28
    TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel.Parent = Angle
    
    AngleNum.Name = "AngleNum"
    AngleNum.Size = UDim2.new(0, 115, 0, 50)
    AngleNum.BorderColor3 = Color3.fromRGB(0, 0, 0)
    AngleNum.BackgroundTransparency = 1
    AngleNum.Position = UDim2.new(0, 0, 0.132075474, 0)
    AngleNum.BorderSizePixel = 0
    AngleNum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    AngleNum.TextColor3 = Color3.fromRGB(220, 13, 13)
    AngleNum.Text = "45"
    AngleNum.TextSize = 66
    AngleNum.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    AngleNum.Parent = Angle
    
    Powa.Name = "Powa"
    Powa.Size = UDim2.new(0, 115, 0, 106)
    Powa.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Powa.BackgroundTransparency = 0.44999998807907104
    Powa.Position = UDim2.new(0.717355251, 0, -0.00802642666, 0)
    Powa.BorderSizePixel = 0
    Powa.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Powa.Parent = ScreenGui
    
    UICorner_2.Name = "UICorner"
    UICorner_2.Parent = Powa
    
    UIGradient_2.Name = "UIGradient"
    UIGradient_2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient_2.Parent = Powa
    TextLabel_2.Name = "TextLabel"
    TextLabel_2.Size = UDim2.new(0, 150, 0, 42)
    TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BackgroundTransparency = 1
    TextLabel_2.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel_2.Text = "Power"
    TextLabel_2.TextSize = 28
    TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel_2.Parent = Powa
    
    PowerNum.Name = "PowerNum"
    PowerNum.Size = UDim2.new(0, 115, 0, 50)
    PowerNum.BorderColor3 = Color3.fromRGB(0, 0, 0)
    PowerNum.BackgroundTransparency = 1
    PowerNum.Position = UDim2.new(0, 0, 0.132075474, 0)
    PowerNum.BorderSizePixel = 0
    PowerNum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PowerNum.TextColor3 = Color3.fromRGB(220, 13, 13)
    PowerNum.Text = "60"
    PowerNum.TextSize = 70
    PowerNum.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    PowerNum.Parent = Powa
    
    UIStroke_2.Name = "UIStroke"
    UIStroke_2.Color = Color3.fromRGB(165, 170, 167)
    UIStroke_2.Thickness = 1.2000000476837158
    UIStroke_2.Parent = Powa
    
    Target.Name = "Target"
    Target.Size = UDim2.new(0, 115, 0, 106)
    Target.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Target.BackgroundTransparency = 0.44999998807907104
    Target.Position = UDim2.new(0.550999999, 0, -0.00800000038, 0)
    Target.BorderSizePixel = 0
    Target.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Target.Parent = ScreenGui
    
    UICorner_3.Name = "UICorner"
    UICorner_3.Parent = Target
    
    UIGradient_3.Name = "UIGradient"
    UIGradient_3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient_3.Parent = Target
    
    TextLabel_3.Name = "TextLabel"
    TextLabel_3.Size = UDim2.new(0, 150, 0, 42)
    TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BackgroundTransparency = 1
    TextLabel_3.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.RichText = true
    TextLabel_3.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel_3.Text = "Target"
    TextLabel_3.TextSize = 28
    TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel_3.Parent = Target
    
    TargetPlr.Name = "TargetPlr"
    TargetPlr.Size = UDim2.new(0, 115, 0, 50)
    TargetPlr.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TargetPlr.BackgroundTransparency = 1
    TargetPlr.Position = UDim2.new(0, 0, 0.207547173, 0)
    TargetPlr.BorderSizePixel = 0
    TargetPlr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TargetPlr.TextColor3 = Color3.fromRGB(220, 13, 13)
    TargetPlr.Text = "MrCODADUDE"
    TargetPlr.TextSize = 19
    TargetPlr.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TargetPlr.Parent = Target
    
    UIStroke_3.Name = "UIStroke"
    UIStroke_3.Color = Color3.fromRGB(165, 170, 167)
    UIStroke_3.Thickness = 1.2000000476837158
    UIStroke_3.Parent = Target
    
    Mode.Name = "Mode"
    Mode.Size = UDim2.new(0, 115, 0, 106)
    Mode.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Mode.BackgroundTransparency = 0.44999998807907104
    Mode.Position = UDim2.new(0.298999995, 0, -0.00800000038, 0)
    Mode.BorderSizePixel = 0
    Mode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Mode.Parent = ScreenGui
    
    UICorner_4.Name = "UICorner"
    UICorner_4.Parent = Mode
    
    UIGradient_4.Name = "UIGradient"
    UIGradient_4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient_4.Parent = Mode
    
    TextLabel_4.Name = "TextLabel"
    TextLabel_4.Size = UDim2.new(0, 150, 0, 42)
    TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_4.BackgroundTransparency = 1
    TextLabel_4.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel_4.BorderSizePixel = 0
    TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_4.RichText = true
    TextLabel_4.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel_4.Text = "Mode"
    TextLabel_4.TextSize = 28
    TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel_4.Parent = Mode
    
    ModeText.Name = "ModeText"
    ModeText.Size = UDim2.new(0, 115, 0, 50)
    ModeText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ModeText.BackgroundTransparency = 1
    ModeText.Position = UDim2.new(0, 0, 0.198113203, 0)
    ModeText.BorderSizePixel = 0
    ModeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ModeText.TextColor3 = Color3.fromRGB(220, 13, 13)
    ModeText.Text = "Dime"
    ModeText.TextSize = 52
    ModeText.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    ModeText.Parent = Mode
    
    UIStroke_4.Name = "UIStroke"
    UIStroke_4.Color = Color3.fromRGB(165, 170, 167)
    UIStroke_4.Thickness = 1.2000000476837158
    UIStroke_4.Parent = Mode
    
    Catchable.Name = "Catchable"
    Catchable.Size = UDim2.new(0, 115, 0, 106)
    Catchable.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Catchable.BackgroundTransparency = 0.44999998807907104
    Catchable.Position = UDim2.new(0.381919622, 0, -0.00773477927, 0)
    Catchable.BorderSizePixel = 0
    Catchable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Catchable.Parent = ScreenGui
    
    UICorner_5.Name = "UICorner"
    UICorner_5.Parent = Catchable
    
    UIGradient_5.Name = "UIGradient"
    UIGradient_5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient_5.Parent = Catchable
    
    TextLabel_5.Name = "TextLabel"
    TextLabel_5.Size = UDim2.new(0, 150, 0, 42)
    TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_5.BackgroundTransparency = 1
    TextLabel_5.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel_5.BorderSizePixel = 0
    TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_5.RichText = true
    TextLabel_5.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel_5.Text = "Catchable"
    TextLabel_5.TextSize = 28
    TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel_5.Parent = Catchable
    
    CatchText.Name = "CatchText"
    CatchText.Size = UDim2.new(0, 115, 0, 50)
    CatchText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CatchText.BackgroundTransparency = 1
    CatchText.Position = UDim2.new(0, 0, 0.179245278, 0)
    CatchText.BorderSizePixel = 0
    CatchText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CatchText.TextColor3 = Color3.fromRGB(220, 13, 13)
    CatchText.Text = "Yes"
    CatchText.TextSize = 67
    CatchText.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    CatchText.Parent = Catchable
    
    UIStroke_5.Name = "UIStroke"
    UIStroke_5.Color = Color3.fromRGB(165, 170, 167)
    UIStroke_5.Thickness = 1.2000000476837158
    UIStroke_5.Parent = Catchable
    
    Interceptable.Name = "Interceptable"
    Interceptable.Size = UDim2.new(0, 115, 0, 106)
    Interceptable.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Interceptable.BackgroundTransparency = 0.44999998807907104
    Interceptable.Position = UDim2.new(0.465902418, 0, -0.00773796486, 0)
    Interceptable.BorderSizePixel = 0
    Interceptable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Interceptable.Parent = ScreenGui
    
    UICorner_6.Name = "UICorner"
    UICorner_6.Parent = Interceptable
    
    UIGradient_6.Name = "UIGradient"
    UIGradient_6.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient_6.Parent = Interceptable
    
    TextLabel_6.Name = "TextLabel"
    TextLabel_6.Size = UDim2.new(0, 150, 0, 42)
    TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_6.BackgroundTransparency = 1
    TextLabel_6.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel_6.BorderSizePixel = 0
    TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_6.RichText = true
    TextLabel_6.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel_6.Text = "Interceptable"
    TextLabel_6.TextSize = 23
    TextLabel_6.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel_6.Parent = Interceptable
    
    IntText.Name = "IntText"
    IntText.Size = UDim2.new(0, 115, 0, 50)
    IntText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IntText.BackgroundTransparency = 1
    IntText.Position = UDim2.new(0, 0, 0.188679248, 0)
    IntText.BorderSizePixel = 0
    IntText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IntText.RichText = true
    IntText.TextColor3 = Color3.fromRGB(220, 13, 13)
    IntText.Text = "No"
    IntText.TextSize = 67
    IntText.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    IntText.Parent = Interceptable
    
    UIStroke_6.Name = "UIStroke"
    UIStroke_6.Color = Color3.fromRGB(165, 170, 167)
    UIStroke_6.Thickness = 1.2000000476837158
    UIStroke_6.Parent = Interceptable
    
    ATime.Name = "ATime"
    ATime.Size = UDim2.new(0, 115, 0, 106)
    ATime.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ATime.BackgroundTransparency = 0.44999998807907104
    ATime.Position = UDim2.new(0.634458601, 0, -0.00793353934, 0)
    ATime.BorderSizePixel = 0
    ATime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ATime.Parent = ScreenGui
    
    UICorner_7.Name = "UICorner"
    UICorner_7.Parent = ATime
    
    UIGradient_7.Name = "UIGradient"
    UIGradient_7.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
    UIGradient_7.Parent = ATime
    
    TextLabel_7.Name = "TextLabel"
    TextLabel_7.Size = UDim2.new(0, 150, 0, 42)
    TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_7.BackgroundTransparency = 1
    TextLabel_7.Position = UDim2.new(-0.156521738, 0, 0.603773594, 0)
    TextLabel_7.BorderSizePixel = 0
    TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_7.RichText = true
    TextLabel_7.TextColor3 = Color3.fromRGB(202, 202, 202)
    TextLabel_7.Text = "Airtime"
    TextLabel_7.TextSize = 28
    TextLabel_7.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    TextLabel_7.Parent = ATime
    
    airtimetext.Name = "airtimetext"
    airtimetext.Size = UDim2.new(0, 115, 0, 50)
    airtimetext.BorderColor3 = Color3.fromRGB(0, 0, 0)
    airtimetext.BackgroundTransparency = 1
    airtimetext.Position = UDim2.new(0, 0, 0.179245278, 0)
    airtimetext.BorderSizePixel = 0
    airtimetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    airtimetext.TextColor3 = Color3.fromRGB(220, 13, 13)
    airtimetext.Text = "2s"
    airtimetext.TextSize = 61
    airtimetext.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    airtimetext.Parent = ATime
    
    UIStroke_7.Name = "UIStroke"
    UIStroke_7.Color = Color3.fromRGB(165, 170, 167)
    UIStroke_7.Thickness = 1.2000000476837158
    UIStroke_7.Parent = ATime
    
    



	

	local beam = Instance.new("Beam", workspace.Terrain)
	local Attach0 = Instance.new("Attachment", workspace.Terrain)
	local Attach1 = Instance.new("Attachment", workspace.Terrain)
    local customLeads = false
    local customLead = 18





   
	local isLocked = false
    local autopmode = false
	--// Handle Locking Connection //--
	game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
		if input.KeyCode == Enum.KeyCode.Q and not gpe then
			isLocked = not isLocked
		end
	end)
	local endPartOfBeam = false
	beam.Attachment0 = Attach0
	beam.Attachment1 = Attach1  
	beam.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 13, 13)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 128, 0))
})
beam.Width0 = 0.5

		beam.Width1 = 0.5
		
		
	local VisPart = Instance.new("Part")
	VisPart.Size =  VisPart.Size + Vector3.new(1.2, 0, 1.2)
	VisPart.Name = "TargetVisualPart"
	VisPart.Anchored = true
	VisPart.Parent = workspace
	VisPart.CanCollide = false
	VisPart.Material = Enum.Material.Neon
	VisPart.Color = Color3.fromRGB(0, 0, 0)
	beam.Segments = 5000
	

	local function grabMousePos()
		return Vector2.new(game:GetService('UserInputService'):GetMouseLocation().X, game:GetService('UserInputService'):GetMouseLocation().Y)
	end

	local function isVisandPos(Pos)
		local camPos, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(Pos)
		if OnScreen then
			return camPos, OnScreen
		end
	end

	--// QB Aimbot Made By 4dsdev on discord. //--

	--// Variables & Services //--
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	local Char = Player.Character or Player.CharacterAdded:Wait()

    Player.CharacterAdded:Connect(function(character)
        Char = character
    end)
	local HumanoidRootPart = Char:FindFirstChild("HumanoidRootPart")
	local FF2Grav = 28
	local mse = Player:GetMouse()
	local camera = workspace.CurrentCamera
	local ClosestPlr = nil
    local autoswr = false
	
	local uis =  game:GetService("UserInputService")
	-- used this shit for equations and some of my calcs are just me predicting shit
	-- https://openstax.org/books/university-physics-volume-1/pages/4-3-projectile-motion

   

	local QBAIMtab = {
		OffSetBased = false
	}

	  --// Get Closest Player To Our Mouse Function //--

	local Workspace = game:GetService("Workspace")
	local UserInputService = game:GetService("UserInputService")

local function getNearestPlayerToMouse()
local MousePosition = Vector2.new(mse.X, mse.Y)
local ClosestPlayer
local ClosestDistance = math.huge

local function getScreenPosition(part)
local ScreenPoint, onScreen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
return Vector2.new(ScreenPoint.X, ScreenPoint.Y), onScreen
end

for _, player in ipairs(Players:GetPlayers()) do
if player ~= Players.LocalPlayer and player.Team == Players.LocalPlayer.Team then
local Character = player.Character
if Character then
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
if HumanoidRootPart then
local ScreenPosition, onScreen = getScreenPosition(HumanoidRootPart)
local Distance = (ScreenPosition - MousePosition).Magnitude
if Distance < ClosestDistance then
ClosestPlayer = player
ClosestDistance = Distance
end
end
end
end
end


for _, bot in ipairs(workspace:GetChildren()) do
if bot.Name == "npcwr" then
local stationA = bot:FindFirstChild("a")
local stationB = bot:FindFirstChild("b")

if stationA and stationB then
local bot1 = stationA:FindFirstChild("bot 1")
local bot2 = stationB:FindFirstChild("bot 3")

if bot1 then
local bot1HumanoidRootPart = bot1:FindFirstChild("HumanoidRootPart")
if bot1HumanoidRootPart then
local bot1ScreenPosition, onScreen = getScreenPosition(bot1HumanoidRootPart)
local bot1Distance = (bot1ScreenPosition - MousePosition).Magnitude
if bot1Distance < ClosestDistance then
ClosestPlayer = bot1
ClosestDistance = bot1Distance
end
end
end

if bot2 then
local bot2HumanoidRootPart = bot2:FindFirstChild("HumanoidRootPart")
if bot2HumanoidRootPart then
local bot2ScreenPosition, onScreen = getScreenPosition(bot2HumanoidRootPart)
local bot2Distance = (bot2ScreenPosition - MousePosition).Magnitude
if bot2Distance < ClosestDistance then
ClosestPlayer = bot2
ClosestDistance = bot2Distance
end
end
end
end
end
end

return ClosestPlayer
end

local dradius = 20
	

local AutoAngie = false
local AutoPowa = false
local state = false
	--// Basic moving check function //--
	local function isMoving(PlayerDaddy)
		if not string.find(PlayerDaddy.Name, "bot 1") or not string.find(PlayerDaddy.Name, "bot 3") then
			if PlayerDaddy.Character:FindFirstChild("Humanoid").MoveDirection.Magnitude > 0 then
				return true
			else
				return false
			end
		end
	end


	--// Bezier Curve Formula //--

	local function beamProjectile(g, v0, x0, t1) --// aw hell yeah ego moose you da goat ! //--
		-- calculate the bezier points
		local c = 0.5*0.5*0.5;
		local p3 = 0.5*g*t1*t1 + v0*t1 + x0;
		local p2 = p3 - (g*t1*t1 + v0*t1)/3;
		local p1 = (c*g*t1*t1 + 0.5*v0*t1 + x0 - c*(x0+p3))/(3*c) - p2;
		
		-- the curve sizes
		local curve0 = (p1 - x0).magnitude;
		local curve1 = (p2 - p3).magnitude;
		
		-- build the world CFrames for the attachments
		local b = (x0 - p3).unit;
		local r1 = (p1 - x0).unit;
		local u1 = r1:Cross(b).unit;
		local r2 = (p2 - p3).unit;
		local u2 = r2:Cross(b).unit;
		b = u1:Cross(r1).unit;
		
		local cf1 = CFrame.new(
			x0.x, x0.y, x0.z,
			r1.x, u1.x, b.x,
			r1.y, u1.y, b.y,
			r1.z, u1.z, b.z
		)
		
		local cf2 = CFrame.new(
			p3.x, p3.y, p3.z,
			r2.x, u2.x, b.x,
			r2.y, u2.y, b.y,
			r2.z, u2.z, b.z
		)
		
		return curve0, -curve1, cf1, cf2;
	end

	local function getFieldOrientation(throwerPosition, playerPosition)
		if playerPosition.Z > 0 then
			return 1
		else
			return -1
		end
	end

	local function clampnum(val, minmimum, maxValue)
		return math.min(math.max(val, minmimum), maxValue)
	end

	----------------------------------------
	--// CALCULATION FUNCTIONS & MATH //--
	----------------------------------------
	local function CalculateRouteofPlayer(Playa)
		--[[local MovingCheck = isMoving(getNearestPlayerToMouse())--]]
		local RouteType;
		if not string.find(Playa.Name, "bot 1") and not string.find(Playa.Name, "bot 3") then
			local DirectionMoving = Playa.Character:FindFirstChild("Humanoid").MoveDirection
			local DirectionMovingLeftRight = Playa.Character:FindFirstChild("Humanoid").MoveDirection.X
			local DirectionMovingFoward = Playa.Character:FindFirstChild("Humanoid").MoveDirection.Z
			local Distance = (Playa.Character:FindFirstChild("HumanoidRootPart").Position - Player.Character:FindFirstChild("HumanoidRootPart").Position)
			local Direction = Distance.Unit
			local magdist = Distance.magnitude
			local X = Direction * Vector3.new(1, 0, 0)
			local X2 = Direction * Vector3.new(-1, 0, 0)
			local Z = Direction * Vector3.new(0, 0, 1)
			local DirectionDot = DirectionMoving:Dot(Distance)
			local Z2;
			
			if getFieldOrientation(Player.Character:FindFirstChild("HumanoidRootPart"), DirectionMoving) == -1 then
				Z2 = Direction * Vector3.new(0, 0, -1)
			else
				Z2 = Direction * Vector3.new(0, 0, 1)
			end
				
			local XZ = Direction * Vector3.new(1, 0, 1)
			local StreakingRoutesDotProduct = DirectionMoving:Dot(Z2) --// gets the dot product between two vectors //--
			
			if StreakingRoutesDotProduct >= .80 or StreakingRoutesDotProduct <= -0.80 then
				RouteType = "Straight"
			elseif StreakingRoutesDotProduct >= .45 or StreakingRoutesDotProduct <= -0.45 then
				RouteType = "Post"
			elseif StreakingRoutesDotProduct >= .2 or StreakingRoutesDotProduct <= -.2  then
				RouteType = 'Slant'			
			elseif StreakingRoutesDotProduct == 0 then
				RouteType = "Still"
			end
			if DirectionDot < 0 then
				RouteType = "Comeback"
			end
		else
			RouteType = "Straight"
		end
		return RouteType
	end
	

	local function HorizontalRangeOfProjectile(NearestPlayer)
		local NearestPlayerRootPart;
		if string.find(NearestPlayer.Name, "bot 1") or string.find(NearestPlayer.Name, "bot 3") then
			NearestPlayerRootPart = NearestPlayer:FindFirstChild("Head")
		else
			NearestPlayerRootPart  = NearestPlayer.Character.Head
		end
		local PlayerRootPart = Player.Character.HumanoidRootPart
		local ProjectileRange = PlayerRootPart.Position - NearestPlayerRootPart.Position
		local HorizontalRange = Vector2.new(ProjectileRange.X, ProjectileRange.Z).Magnitude
		return HorizontalRange
	end

	local function HighSpeedLowAngleCalcs(Grav, Speed)
		local RP = HorizontalRangeOfProjectile(getNearestPlayerToMouse())
	   
		local Eq
		local asin = math.asin
	  
			local routee = CalculateRouteofPlayer(getNearestPlayerToMouse())
		  
			if routee == "Comeback"  then
				if RP < 150 then
					Eq = 0.52 * asin((RP * Grav) / (Speed ^ 2))
				else
					Eq = 0.47 * asin((RP * Grav) / (Speed ^ 2))
				end
			elseif routee == "Still" then
				Eq = 0.6 * asin((RP * Grav) / (Speed ^ 2))
			elseif routee == "Post" then
				if RP < 150 then
					Eq = 0.85 * asin((RP * Grav) / (Speed ^ 2))
				else
					Eq = 0.88 * asin((RP * Grav) / (Speed ^ 2))
				end
			else
				if RP < 150 then
					Eq = 0.87 * asin((RP * Grav) / (Speed ^ 2))
				else
					Eq = 0.9 * asin((RP * Grav) / (Speed ^ 2))
				end
			end

		   
		return Eq
	end

	local function ProjectilePeakPosition(InitialPos, Speed, g)
		local timeToPeak = -Speed.Y / g.Y
		local equation = InitialPos + Speed * timeToPeak + 0.5 * g * timeToPeak ^ 2
		return equation
	end
	 
	local function calculateLaunchAngle(Gravvv, FootballSpeed) -- this took a shit long time to make
		local RangeYes = HorizontalRangeOfProjectile(getNearestPlayerToMouse())
		--print(RangeYes)
		local launchAngle = math.asin(Gravvv * RangeYes / (FootballSpeed ^ 2)) 
		return launchAngle
	end          

	local function CalculateInitalVelocityYAxis(InitalVelocity, AngleNeeded)
		local VelocityY = InitalVelocity * math.sin(AngleNeeded)
		return VelocityY
	end

	local function calculateInitalVelocityXAxis(InitalVelocity, AngleNeeded)
		local VelocityX = InitalVelocity * math.cos(AngleNeeded)
		return VelocityX
	end


	local function CalculateMaxHeightOfProjectile(Initalvel, angle, gravv)
		local InitalVelocityY = CalculateVelocityYAxis(Initalvel, angle)
		local Hmax = (InitalVelocityY ^ 2) / (2 * gravv)
		return Hmax
	end

	local function GetTimeOfFlightProjectile(FootballInitalVelocity, AngleNeeded, Grav)
		local TimeOfflightEquation = (2 * FootballInitalVelocity * math.sin(AngleNeeded)) / Grav
		return TimeOfflightEquation
	end

	local function TimeOfFlight2(FootballS, A,  FootballDownwardGravity)
		local VerticalVelocity = CalculateInitalVelocityYAxis(FootballS, A)
		local Tlowest = VerticalVelocity / FootballDownwardGravity --// tested this equation to see if its better or not //--
		return Tlowest
	end

	local function calculateThrowType(ClosestPlay)
		local RP = HorizontalRangeOfProjectile(ClosestPlay)
		local r = CalculateRouteofPlayer(ClosestPlay)
		local calculatedThrowType = ""
		if ClosestPlay.Name == "bot 1" or ClosestPlay.Name == "bot 3" then
			calculatedThrowType = "Dime"
			ModeText.Text =  calculatedThrowType
		else
			if RP <= 100 and r == "Slant" then
				calculatedThrowType = "Bullet"
				ModeText.Text =  calculatedThrowType
			elseif RP > 100 and r == "Slant" then
				calculatedThrowType = "Dive"
				ModeText.Text =  calculatedThrowType
			elseif RP <= 150 and r == "Straight" then
				calculatedThrowType = "Dive"
				ModeText.Text =  calculatedThrowType
			elseif RP > 150 and r == "Straight" then
				calculatedThrowType = "Dime"
				ModeText.Text =  calculatedThrowType
			elseif RP <= 150 and r == "Post" then
				calculatedThrowType = "Dive"
				ModeText.Text =  calculatedThrowType
			elseif RP > 150 and r == "Post" then
				calculatedThrowType = "Dime"
				ModeText.Text =  calculatedThrowType
			elseif RP <= 100 and r == "Still" then
				calculatedThrowType = "Dot"
				ModeText.Text =  calculatedThrowType
			elseif RP > 100 and r == "Still" then
				calculatedThrowType = "Dime"
				ModeText.Text =  calculatedThrowType
			elseif RP <= 150 and r == "Comeback" then
				calculatedThrowType = "Dime"
				ModeText.Text =  calculatedThrowType
			elseif RP > 150 and r == "Comeback" then
				calculatedThrowType = "Dive"
				ModeText.Text =  calculatedThrowType
			end
		end
	end


local Highestpwrmode = false
	local function OverallVelocityNeededToReachAPosition(Angie, StartPos, EndPositon, Gravity, Time)
		local VelocityNeeded = (EndPositon - StartPos - 0.5 * Gravity * Time * Time) / Time
		local Y = (EndPositon - StartPos)
		local Xz1 = (Y * Vector3.new(0.25, 0, 0.25)) 
		local xz2 = Vector2.new(Y.X, Y.Z).Magnitude
		local VelOverTime = xz2 / Time
		local notVector = Xz1 / Xz1.Magnitude
		local Equationderived = notVector * VelOverTime
		local EstimatedVel = Equationderived + Vector3.new(0, VelocityNeeded.Y, 0)
		local VelocityTotal = StartPos + EstimatedVel
		local direction = ((VelocityTotal) - StartPos).unit
		local toMatch = 0.05
		local pow = EstimatedVel.Magnitude + toMatch
		if Highestpwrmode then
			return EstimatedVel, direction, clampnum(math.round(pow), 85, 95)
		else
			return EstimatedVel, direction, clampnum(math.round(pow), 0, 95)
		end
	end

	local function CalculateHeightOfTwoPositions(Start, End)
		local Dis = (Start - End)
		local h = Dis.Y
		return h
	end


	local function getThrowType()
		return tostring(ModeText.Text)
	end

	--// Handle Changing Throw Types //--
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
		local ThrowTypee = getThrowType()
        if not autopmode then
			if input.KeyCode == Enum.KeyCode.C and ThrowTypee == "Dime" and not gameProcessedEvent then
				ModeText.Text = "Dive"
			elseif input.KeyCode == Enum.KeyCode.C and ThrowTypee == "Dive" and not gameProcessedEvent then
				ModeText.Text = "Dot"
            elseif input.KeyCode == Enum.KeyCode.C and ThrowTypee == "Dot" and not gameProcessedEvent then
                ModeText.Text = "Mag"
            elseif input.KeyCode == Enum.KeyCode.C and ThrowTypee == "Mag" and not gameProcessedEvent then
                ModeText.Text = "Bullet"
            elseif input.KeyCode == Enum.KeyCode.C and ThrowTypee == "Bullet" and not gameProcessedEvent then
                ModeText.Text = "Fade"
            elseif input.KeyCode == Enum.KeyCode.C and ThrowTypee == "Fade" and not gameProcessedEvent then
                ModeText.Text = "Dime"
			end
        end
	end)

	
	local function CalculateHorizandVeri(TimeOFF,  End, Beginning, GravV)
		local Displace = (Beginning - End)
		local Xaxis = (Displace.X)
		local ZAxis = (Displace.Z)
		local YAXis = CalculateHeightOfTwoPositions(Beginning, End)
		local XYZVector3 = Vector3.new(Xaxis, YAXis, ZAxis)
		local Horizontally = Vector2.new(Xaxis, Zxis).magnitude
		local HorizVelNeeded =  Horizontally  / TimeOFF --// Using the Projectile motion Formula Horizontal Velocity: xz/t and yes shlat made this comment//--

		local UpWardVel = (YAXis - (0.5 * -GravV * (TimeOFF ^ 2))) --// modified the velocity calculation formula so it just takes into account the y axis  //--
		local UpWARDVelneeded = UpWardVel / TimeOFF
		
		
		return UpWardVel, HorizVelNeeded
	end

	

	local function CalculateHeightOfTwoPositions(Start, End)
		local Dis = (Start - End)
		local h = Dis.Y
		return h
	end

	--// Function to check if the bot is moving //--
	local function isBotMoving(SpeedOFBot)
		if SpeedOFBot == Vector3.new(0,0,0) then
			return false
		else
			return true
		end
	end

	local function getMostIsolatedPlayer(radius)
		local Players = game:GetService("Players")
		local mostIsolatedPlayer = nil
		local minNearbyCount = math.huge 
	
		local function isBot(name)
			return string.find(name, "bot 1") or string.find(name, "bot 3")
		end
	
  
		local function countPlayersNearby(player)
				local count = 0
				local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
				if not playerPos then return count end
				if game.PlaceId == 8206123457 then
					for _, otherPlayer in ipairs(Players:GetPlayers()) do
						if otherPlayer ~= player and otherPlayer.Character and otherPlayer ~= Player  then
							local otherPos = otherPlayer.Character:FindFirstChild("HumanoidRootPart").Position
							local dist = (otherPos - playerPos).magnitude
							if dist <= radius then
								count = count + 1
							end
						end
					end
				else
					for _, otherPlayer in ipairs(Players:GetPlayers()) do
						if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Team ~= player.Team and otherPlayer ~= Player then
							local otherPos = otherPlayer.Character:FindFirstChild("HumanoidRootPart").Position
							local dist = (otherPos - playerPos).magnitude
							if dist <= radius then
								count = count + 1
							end
						end
					end
				end
			
			return count
		end
	
		if game.PlaceId == 8206123457 then
			for _, player in ipairs(Players:GetPlayers()) do
				if player.Character and not isBot(player.Name) and player ~= Player then
					local nearbyCount = countPlayersNearby(player)
					if nearbyCount < minNearbyCount then
						minNearbyCount = nearbyCount
						mostIsolatedPlayer = player
					end
				end
			end
		else
			for _, player in ipairs(Players:GetPlayers()) do
				if player.Character and player.Team == Players.LocalPlayer.Team and player ~= Player then
					local nearbyCount = countPlayersNearby(player)
					if nearbyCount < minNearbyCount then
						minNearbyCount = nearbyCount
						mostIsolatedPlayer = player
					end
				end
			end
		end
	
		return mostIsolatedPlayer
	end
	

	
  


	--// Bot Estimated Velocity Function //--
	local function BotEstimatedVel(Time, Bot)
		local Speed = Bot:FindFirstChild("HumanoidRootPart").Velocity
		local TOFF = Time
		local TypeThroww = getThrowType()
		local Botequation;
		local LeadNumtabBot3;
		local LeadNumtabBot1;
		if isBotMoving(Bot:FindFirstChild("HumanoidRootPart").Velocity) then
			 LeadNumtabBot3 = {
				["Dime"] = Vector3.new(-1, 1.25, -6),
				["Mag"] = Vector3.new(-2, 2, -11),
				["Dive"] = Vector3.new(-1.25, 1.5, -9),
				["Dot"] = Vector3.new(-0.09, 0.09, -4),
				["Fade"] = Vector3.new(0, 0, 0),
				["Bullet"] = Vector3.new(-5, -1, -1.25),
				["Jump"] = Vector3.new(-1, 2.25, -5)
			}
			LeadNumtabBot1 = {
				["Dime"] = Vector3.new(1, 1.25, 6),
				["Mag"] = Vector3.new(2, 2, 11),
				["Dive"] = Vector3.new(1.25, 1.5, 9),
				["Dot"] = Vector3.new(0.09, 0.09, 4),
				["Fade"] = Vector3.new(0, 0, 0),
				["Bullet"] = Vector3.new(5, 1, 1.25),
				["Jump"] = Vector3.new(1, 2, 5)
			}
		else
			LeadNumtabBot3 = {
				["Dime"] = Vector3.new(0, 0, 0),
				["Mag"] = Vector3.new(0, 0, 0),
				["Dive"] = Vector3.new(0, 0, 0),
				["Dot"] = Vector3.new(0, 0, 0),
				["Fade"] = Vector3.new(0, 0, 0),
				["Bullet"] = Vector3.new(0, 0, 0),
				["Jump"] = Vector3.new(0, 4, 0)
			}
			LeadNumtabBot1 = {
				["Dime"] = Vector3.new(0, 0, 0),
				["Mag"] = Vector3.new(0, 0, 0),
				["Dive"] = Vector3.new(0, 0, 0),
				["Dot"] = Vector3.new(0, 0, 0),
				["Fade"] = Vector3.new(0, 0, 0),
				["Bullet"] = Vector3.new(0, 0, 0),
				["Jump"] = Vector3.new(0, 5, 0)
			}
		end
		local TimeAccount = (Speed * Time)
		if Bot.Name == "bot 3"  and isBotMoving(Bot:FindFirstChild("HumanoidRootPart").Velocity) then
			Botequation = Bot:FindFirstChild("HumanoidRootPart").Position + (TimeAccount) +  LeadNumtabBot3[TypeThroww]
		elseif Bot.Name == "bot 1"  and isBotMoving(Bot:FindFirstChild("HumanoidRootPart").Velocity) then
			Botequation = Bot:FindFirstChild("HumanoidRootPart").Position + (TimeAccount) +  LeadNumtabBot1[TypeThroww]
		elseif Bot.Name == "bot 3" and not isBotMoving(Bot:FindFirstChild("HumanoidRootPart").Velocity) then
			Botequation = Bot:FindFirstChild("HumanoidRootPart").Position + LeadNumtabBot3[TypeThroww]
		elseif Bot.Name == "bot 1" and not isBotMoving(Bot:FindFirstChild("HumanoidRootPart").Velocity) then
			Botequation = Bot:FindFirstChild("HumanoidRootPart").Position
		end
			
		return Botequation
	end

	--// old calculated throw direction function //--
	local function toThrowDirection(HVelocity, VVelocity, Time, Gravity, Beginning, End)
		local XThroughZVelocity = HVelocity
		local UPVel = VVelocity
		local PositionFromTwoPoints = (Beginning - End)
		local UpWardVelocityOffset = Vector3.new(0, UPVel, 0)
		local FowardAndBackward = Vector3.new(0, 0, PositionFromTwoPoints.Z)
		
		local toSide = Vector3.new(PositionFromTwoPoints.X, 0, 0)
		
		local BothAxis = Vector3.new(1, 0, 1)
		
		local DirectionMag = (PositionFromTwoPoints * BothAxis).magnitude
		local DirectionUnit = (PositionFromTwoPoints * BothAxis).Unit
		local DirectionNormalVec3 = (PositionFromTwoPoints * BothAxis)

		local DivisonToCalcAverage = (DirectionNormalVec3 / DirectionMag) 
		local HorizontalVelocityAccountedfor = DivisonToCalcAverage * XThroughZVelocity
		local VelocityOffsetAccountedFor = HorizontalVelocityAccountedfor + UpWardVelocityOffset

		return VelocityOffsetAccountedFor
	end


	--/-//-/-/-/-/-/-/-//////////////////-/-//-/-/-/-/-/-/-/-


	----------------------------------------------
			--// Prediciton Functions //--
	----------------------------------------------
	local function getOffsetPredictionBasedOnRouteandThrowType(Route, ThrowType)
		if QBAIMtab.OffSetBased then
		local closestPlrtomouse = getNearestPlayerToMouse()
		local CalculatedRoute = CalculateRouteofPlayer(closestPlrtomouse)
		
		local LeftandRightXOf;
		local LeftandRightZOf;

		local FowardXOf;
		local FowardZOf;

		local BackwardXOf;
		local BackwardZOf
		if Route == 'LeftRight' and ThrowType == "Dime" then
			LeftandRightXOf = 0.28
			LeftandRightZOf = 0.25
		elseif Route == "Foward" or "Backward" and ThrowType == "Dime" then
			FowardXOf = 0.27
			FowardZOf = 0.35
			BackwardXOf = 0.015
			BackwardZOf = 0.2
		elseif Route == 'LeftRight' and ThrowType == "Dive" then
			LeftandRightXOf = 0.45
			LeftandRightZOf = 0.35
			end
		end
	end

	----------------------------------------------------
			--// Highlight Functions //--
	----------------------------------------------------

		local Highlight = Instance.new("Highlight")
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	
		
		 local function updateHighlight(nearest)
		if nearest and nearest.Name ~= "bot 1" or nearest.Name ~= "bot 3"  then
			if nearest.Character and nearest.Character:FindFirstChild("HumanoidRootPart") then
				Highlight.Adornee = nearest.Character
				Highlight.Parent = nearest.Character.HumanoidRootPart
			else
				Highlight.Parent = nil  
			end
	

		elseif nearest.Name == "bot 1" or nearest.Name == "bot 3"  then
			Highlight.Parent = nearest
			Highlight.Adornee = nearest:FindFirstChild("HumanoidRootPart")
		elseif not nearest then
			Highlight.Parent = nil  
			
		end
	end
----------------------------------------------------/-/-/-/-//-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/////////////////-/-/-/-/-/-/-							
	

	----------------------------------------------------
			--// Interceptable Functions //--
	----------------------------------------------------
	
	
	local function getPeopleGuardingClosestToMouse(WR)
		local ClosestCB, MaxDistance = nil, 9e9
		if game.PlaceId == 8206123457 then
			for index, CB in next, Players:GetPlayers() do
				if CB ~= WR and CB ~= Player then
					if CB:IsA("Player") and CB.Character then
						if not string.find(WR.Name, "bot 1") or not string.find(WR.Name, "bot 1") then
							local dist = (CB.Character:FindFirstChild("HumanoidRootPart").Position - WR.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
							if dist < MaxDistance then
								ClosestCB = CB
								MaxDistance = dist
							end
						end
					end
				end
			end
		else
			for index, CB in next, Players:GetPlayers() do
				if CB ~= WR and CB ~= Player and CB.Team ~= Player.Team then
					if CB:IsA("Player") and CB.Character then
						local dist = (CB.Character:FindFirstChild("HumanoidRootPart").Position - WR.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
						if dist < MaxDistance then
							ClosestCB = CB
							MaxDistance = dist
						end
					end
				end
			end
		end
		return ClosestCB
	end

	local function Interceptable(Corner, LandingPos, t)
		if Corner and Corner.Character then
			local Dist = (Corner.Character:FindFirstChild("HumanoidRootPart").Position - LandingPos).magnitude
			
			local WalksSpeedOFPlr = Corner.Character:FindFirstChild("Humanoid").WalkSpeed
			local DiveingNumberAccountedFor = 0.31
			local eqq = (Dist / WalksSpeedOFPlr) - DiveingNumberAccountedFor --// minus some time because people can dive //--
			
			local Percent = (Dist * 0.70)
			local HighestThreshHold = (Dist - Percent)
			if eqq <= t then
				return true
			elseif Dist == 0 then
				return true
			else
				return false
			end
		end
	end


	local function getClosestCBtoBot(BotHere)
		local CbBot;
		for index, CBBot in next, workspace:GetChildren() do
			if game.PlaceId == 8206123457 and CBBot.Name == "npcwr" then
			local A = CBBot["a"]
			local B = CBBot["b"]
			local ACBBot = A["bot 2"]
			local BCBBot = B["bot 4"]
				if BotHere.Name == "bot 1" then
					CbBot = ACBBot
				elseif BotHere.Name == "bot 3" then
					CbBot = BCBBot
				end
			end  
		end
		return CbBot
	end

	local function botInterceptable(Corna, LandingEstimatedPos, t)
		if Corna:FindFirstChild("HumanoidRootPart") then
			local BotDist = (Corna:FindFirstChild("HumanoidRootPart").Position - LandingEstimatedPos).magnitude
			local WalksSpeedOFPlr = 20
			local DiveingNumberAccountedFor = 0.31
			local eqq = (BotDist / WalksSpeedOFPlr) - DiveingNumberAccountedFor --// minus some time because people can dive //--
			
			local Percenty = (BotDist * 0.70)
			local Highest = (BotDist - Percenty)
			if eqq <= t then
				return true
			elseif BotDist == 0 then
				return true
			else
				return false
			end
		end
	end

	local function CatchAble(wr, LandingPos, TimeOfProjectileFlight)
		if wr and wr.Character then
			local Dist = (wr.Character:FindFirstChild("HumanoidRootPart").Position - LandingPos).magnitude
			local WalksSpeedOFPlr = wr.Character:FindFirstChild("Humanoid").WalkSpeed
			local DiveingNumberAccountedFor = 0.31
			local eqq = (Dist / WalksSpeedOFPlr) - DiveingNumberAccountedFor --// minus some time because people can dive //--
			local Percent = (Dist * 0.70)
			local HighestThreshHold = (Dist - Percent)
			local WalkSpeed = 16
			if eqq <= TimeOfProjectileFlight then
				return true
			elseif Dist == 0 then
				return true
			else
				return false
			end
		end
	end
	
	local function botCatchAble(Wr, LandingEstimatedPoss)
		if Wr:FindFirstChild("HumanoidRootPart") then
			local BotDist = (Wr:FindFirstChild("HumanoidRootPart").Position - LandingEstimatedPoss).magnitude
			local Percenty = (BotDist * 0.70)
			local Highest = (BotDist - Percenty)
			if BotDist <= Highest then
				return true
			elseif BotDist == 0 then
				return true
			else
				return false
			end
		end
	end
	local function clampnum(val, minmimum, maxValue)
		return math.min(math.max(val, minmimum), maxValue)
	end


	-- // Keep the Throwing Position in the Bounds // --
	local function KeepPosInBounds(TargetPos, MinX, MinZ)
		local X = TargetPos.X
		local Y = TargetPos.Y
		local Z = TargetPos.Z
		local clampedX;
		local clampedZ;
		if TargetPos.X < -MinX then
			clampedX = -70.5
		elseif TargetPos.X > MinX then
			clampedX = 70.5
		elseif TargetPos.X > -MinX and TargetPos.X < MinX then
			clampedX = X
		end

		if TargetPos.Z < -MinZ then
			clampedZ = -175.5
		elseif TargetPos.Z > MinZ then
			clampedZ = 175.5
		elseif TargetPos.Z > -MinZ and TargetPos.Z < MinZ then
			clampedZ = Z
		end
		local ClampedVector3 = Vector3.new(clampedX, Y, clampedZ)
		return ClampedVector3
	end








	--// Round Number to Hundreths function //--
	local function RoundNumToHundredths(number)
		return math.floor(number * 100 + 0.5) / 100
	end

	
	local customLeadDistances = false
	local function GetTargetPositionForWR(Time, WideReceiver)
		if WideReceiver.Character and WideReceiver.Character:FindFirstChild("HumanoidRootPart") then
			local WRMovingVelocity = WideReceiver.Character:FindFirstChild("Humanoid").MoveDirection
			local WRMovingVelocity2 = WideReceiver.Character:FindFirstChild("HumanoidRootPart").Velocity
			local TypeThrow = getThrowType()
			
			local LeadNumtab;

			local fieldOrientation = getFieldOrientation(Player.Character:FindFirstChild("HumanoidRootPart").Position, WideReceiver.Character:FindFirstChild("Humanoid").MoveDirection)
			if isMoving(WideReceiver) then
				if fieldOrientation == 1 then
					LeadNumtab = {
						["Dime"] = Vector3.new(1, 1.65, 9),   
						["Mag"] = Vector3.new(2, 2, 11),
						["Dive"] = Vector3.new(1.25, 1.86, 9.5),
						["Dot"] = Vector3.new(1, 1.2, 7),
						["Fade"] = Vector3.new(0, 0, 0),
						["Bullet"] = Vector3.new(5, 1, 1),
						["Jump"] = Vector3.new(1, 2.25, 7.5)
					}
				elseif fieldOrientation == -1 then
					LeadNumtab = {
						["Dime"] = Vector3.new(1, 1.65, -9),   
						["Mag"] = Vector3.new(2, 2, -11),
						["Dive"] = Vector3.new(1.25, 1.86, -9.5),
						["Dot"] = Vector3.new(1, 1.2, -7),
						["Fade"] = Vector3.new(0, 0, 0),
						["Bullet"] = Vector3.new(-5, 1, -1),
						["Jump"] = Vector3.new(1, 2.25, -7.5)
					}
				end
			else
				LeadNumtab = {
					["Dime"] = Vector3.new(0, 0, 0),   
					["Mag"] = Vector3.new(0, 0, 0),
					["Dive"] = Vector3.new(0, 0, 0),
					["Dot"] = Vector3.new(0, 0, 0),
					["Fade"] = Vector3.new(0, 0, 0),
					["Bullet"] = Vector3.new(0, 0, 0),
					["Jump"] = Vector3.new(0, 5, 0)
				}
			end
			local ThrowTypeAccountability;
			if Highestpwrmode then
				ThrowTypeAccountability = (WRMovingVelocity2 * Time)
			else
				if customLeads then
                    if TypeThrow == "Dot" then
                        ThrowTypeAccountability = (WRMovingVelocity * customLead * Time)
                    elseif TypeThrow == "Bullet" then
                        local XZAXIS = Vector3.new(WRMovingVelocity.X, 0, WRMovingVelocity.Z)
                        ThrowTypeAccountability = (XZAXIS * customLead * Time)	
                    elseif TypeThrow == "Jump" then
                        ThrowTypeAccountability = (WRMovingVelocity * customLead * Time)					
                    elseif TypeThrow == "Dime" then
                        ThrowTypeAccountability = (WRMovingVelocity * customLead * Time)		
                    elseif TypeThrow == "Dive" then
                        ThrowTypeAccountability = (WRMovingVelocity * customLead * Time)	
                    elseif TypeThrow == "Mag" then
                        ThrowTypeAccountability = (WRMovingVelocity * customLead * Time)	
                    end
                else
                    if TypeThrow == "Dot" then
                        ThrowTypeAccountability = (WRMovingVelocity * 17.5 * Time)
                    elseif TypeThrow == "Bullet" then
                        local XZAXIS = Vector3.new(WRMovingVelocity.X, 0, WRMovingVelocity.Z)
                        ThrowTypeAccountability = (XZAXIS * 21* Time)	
                    elseif TypeThrow == "Jump" then
                        ThrowTypeAccountability = (WRMovingVelocity * 18.5 * Time)					
                    elseif TypeThrow == "Dime" then
                        ThrowTypeAccountability = (WRMovingVelocity * 18.9 * Time)		
                    elseif TypeThrow == "Dive" then
                        ThrowTypeAccountability = (WRMovingVelocity * 19.3 * Time)	
                    elseif TypeThrow == "Mag" then
                        ThrowTypeAccountability = (WRMovingVelocity * 19.7 * Time)	
                    end
                end
			end
		
			
			local Equation
			if Highestpwrmode then
				if isMoving(WideReceiver) then
					if TypeThrow == "Fade" then
						Equation = WideReceiver.Character:FindFirstChild("HumanoidRootPart").Position + LeadNumtab[TypeThrow]
					elseif TypeThrow == "Bullet" then
						Equation = WideReceiver.Character:FindFirstChild("HumanoidRootPart").Position + (ThrowTypeAccountability) + LeadNumtab[TypeThrow]
					else
						Equation = WideReceiver.Character:FindFirstChild("HumanoidRootPart").Position + (ThrowTypeAccountability) + LeadNumtab[TypeThrow]
					end
				elseif not isMoving(WideReceiver) and TypeThrow == "Jump" then --// always make it a jump throw even if not moving //--
					Equation = WideReceiver.Character:FindFirstChild("HumanoidRootPart").Position + (ThrowTypeAccountability) + Vector3.new(0, 6, 0)
				else
					Equation = WideReceiver.Character:FindFirstChild("HumanoidRootPart").Position
				end
			else
				if isMoving(WideReceiver) then
					
						Equation = WideReceiver.Character.Head.Position + (ThrowTypeAccountability) + LeadNumtab[TypeThrow]
				
				elseif not isMoving(WideReceiver) and TypeThrow == "Jump" then --// always make it a jump throw even if not moving //--
					Equation = WideReceiver.Character.Head.Position + (ThrowTypeAccountability) + Vector3.new(0, 6, 0)
				else
					Equation = WideReceiver.Character.Head.Position 
				end
			end
   

			return Equation
		else
			warn("Wide Receiver or HumanoidRootPart not found")
			return Vector3.new(0, 0, 0)
		end
	end


	local Data = {
		Direction = Vector3.new(0, 0, 0),
		NormalPower = 55,		
		BulletModeAngle = 5,
		FadeModeAngle = 55,
		LowestPower = 40,
		MaxPower = 95,
		Angle = 45,
		MaxAngle = 55,
		lowestAngle = 10
	}

	
	--// Function to predict the projectile landing position //--
	local function predicitLand(Velocity, Gravity, num, start, powa, timeoflight)
		local Vel = powa * Velocity
		local position = start + Vel * timeoflight + 0.5 * Gravity * timeoflight * timeoflight
		  return position
	end

	--// Adjust Angle Manually Connection//--
	game:GetService("UserInputService").InputBegan:Connect(function(input, typeing)
		if not AutoAngie and not typeing then
			local TT = getThrowType()
			if TT == "Bullet" then
				if input.KeyCode == Enum.KeyCode.R and Data.BulletModeAngle < 20 then
					Data.BulletModeAngle = Data.BulletModeAngle + 5
				elseif input.KeyCode == Enum.KeyCode.F and Data.BulletModeAngle > 5 then
					Data.BulletModeAngle = Data.BulletModeAngle - 5
				elseif input.KeyCode == Enum.KeyCode.R and Data.BulletModeAngle == 20 then                                        
					warn("Cannot Up Angle Any more, Max Angle is 20")
					Data.BulletModeAngle = Data.BulletModeAngle + 0
				elseif input.KeyCode == Enum.KeyCode.F and Data.BulletModeAngle == 5 then
					warn("Cannot Lower Angle Any more, Lowest Angle is 5")
					Data.BulletModeAngle = Data.BulletModeAngle - 0
				end
			elseif TT == "Fade" then
				if input.KeyCode == Enum.KeyCode.R and Data.FadeModeAngle < 75 then
					Data.FadeModeAngle = Data.FadeModeAngle + 5
				elseif input.KeyCode == Enum.KeyCode.F and Data.FadeModeAngle > 55 then
					Data.FadeModeAngle = Data.FadeModeAngle - 5
				elseif input.KeyCode == Enum.KeyCode.R and Data.FadeModeAngle == 75 then                                        
					warn("Cannot Up Angle Any more, Max Angle is 75")
					Data.FadeModeAngle = Data.FadeModeAngle + 0
				elseif input.KeyCode == Enum.KeyCode.F and Data.FadeModeAngle == 55 then
					warn("Cannot Lower Angle Any more, Lowest Angle is 55")
					Data.FadeModeAngle = Data.FadeModeAngle - 0
				end
			else
				if input.KeyCode == Enum.KeyCode.R and Data.Angle < 55 then
					Data.Angle = Data.Angle + 5
				elseif input.KeyCode == Enum.KeyCode.F and Data.Angle > 10 then
					Data.Angle = Data.Angle - 5
				elseif input.KeyCode == Enum.KeyCode.R and Data.Angle == 55 then                                        
					warn("Cannot Up Angle Any more, Max Angle is 55")
					Data.Angle = Data.Angle + 0
				elseif input.KeyCode == Enum.KeyCode.F and Data.Angle == 10 then
					warn("Cannot Lower Angle Any more, Lowest Angle is 10")
					Data.Angle = Data.Angle - 0
				end
			end
		end
	end)

	--// Adjust Power Manually Connection//--
	game:GetService("UserInputService").InputBegan:Connect(function(input, typein)
		if not AutoPowa and not typein then
			if input.KeyCode == Enum.KeyCode.Z and Data.NormalPower < Data.MaxPower then
				Data.NormalPower = Data.NormalPower + 5
			elseif input.KeyCode == Enum.KeyCode.X and Data.NormalPower > Data.LowestPower then
				Data.NormalPower = Data.NormalPower - 5
			elseif input.KeyCode == Enum.KeyCode.Z and Data.NormalPower == Data.MaxPower then
				Data.NormalPower = Data.NormalPower + 0
				warn("Max Power, Cannot Adjust Any Higher")	
			elseif input.KeyCode == Enum.KeyCode.X and Data.NormalPower == Data.LowestPower then
				Data.NormalPower = Data.NormalPower - 0
				warn("Lowest Possible Power, Cannot Adjust Any Lower")										
			end
		end
	end)
	-------/------/------/---/-------/----------/-----/------/-------------/-----------/--------------/----------/---------
	local function isVector3Valid(vec3)
		return not (vec3.X ~= vec3.X or vec3.Y ~= vec3.Y or vec3.Z ~= vec3.Z)
	end
	
	local ThrowingTab = {
		Direction = Vector3.new(0, 0, 0)
	}
	local throwingpar = Instance.new("Part")
	

								throwingpar.Size = Vector3.new(1, 1, 1)
								throwingpar.Color = Color3.fromRGB(0, 0, 0)
								throwingpar.Anchored = false
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
		if game.PlaceId ~= 8206123457 then
			if input.UserInputType == Enum.UserInputType.MouseButton1 and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Message.Text == "HIKE" and game:GetService("ReplicatedStorage").Values.Status.Value == "InPlay" and game:GetService("ReplicatedStorage").Values.Throwable and not gameProcessedEvent then
					if Char then
						local Football = Char:FindFirstChildOfClass("Tool")
						if Football then
							if state == true then
								if state == false then return end
								local start = Player.Character:FindFirstChild("Head").Position
								if not isLocked then
									if autoswr then
										ClosestPlr = getMostIsolatedPlayer(dradius)
									else
										local nearestPlayer = getNearestPlayerToMouse()
										if nearestPlayer and nearestPlayer:IsA("Player") then
											ClosestPlr = nearestPlayer
										end
									end
								end
								
								if isLocked and not ClosestPlr then
									if autoswr then
										if getMostIsolatedPlayer(dradius) == nil then
											ClosestPlr = ClosestPlr
										else
											ClosestPlr = getMostIsolatedPlayer(dradius)
										end
									else
										if getNearestPlayerToMouse() == nil then
											ClosestPlr = ClosestPlr
										else
											ClosestPlr = getNearestPlayerToMouse()
										end 
									end
								end
								local Initial = 95
								local Throwtype;
									
							
									Throwtype = getThrowType()
							
								local vel;
								local toThrowToDirection;
								local pow;


								local WhichOne2;
								if Throwtype == "Fade" then
									WhichOne2 = Data.FadeModeAngle
								elseif Throwtype == "Bullet" then
									WhichOne2 = Data.BulletModeAngle
								else
									WhichOne2 = Data.Angle
								end

								if Highestpwrmode then
									Initial = 95
								else
									if AutoPowa then
										if pow then
										Initial = pow
									else
										 Initial = 95
									end
								else
									Initial = Data.NormalPower
								end
							end
		
								local toLaunchAnlge;
								if Highestpwrmode then
									if AutoAngie then
										toLaunchAnlge = HighSpeedLowAngleCalcs(FF2Grav, Initial)
									else
										toLaunchAnlge = math.rad(WhichOne2)
									end
								else
									if AutoAngie then
										if Throwtype == "Fade" then
											toLaunchAnlge = math.rad(75)
										elseif Throwtype == "Bullet" then
											toLaunchAnlge = clampnum(HighSpeedLowAngleCalcs(FF2Grav, Initial), 0, 0.296706)
										else
											toLaunchAnlge = clampnum(calculateLaunchAngle(FF2Grav, Initial), 0, 0.975)
										end
									else
										toLaunchAnlge = math.rad(WhichOne2)
									end
								end
								local TOF = GetTimeOfFlightProjectile(Initial, toLaunchAnlge, FF2Grav)
								local YesEnd;
								if string.find(ClosestPlr.name, "bot 1") or string.find(ClosestPlr.name, "bot 3") then
									YesEnd = KeepPosInBounds(BotEstimatedVel(TOF, ClosestPlr), 70.5, 175.5)
								elseif not string.find(ClosestPlr.name, "bot 1") or not string.find(ClosestPlr.name, "bot 3") then
									YesEnd = KeepPosInBounds(GetTargetPositionForWR(TOF, ClosestPlr), 70.5, 175.5)
								end
								local PowerSir;
								 vel, toThrowToDirection, pow = OverallVelocityNeededToReachAPosition(toLaunchAnlge, start, YesEnd, Vector3.new(0,-FF2Grav,0), TOF)  
								if AutoPowa then
									if Throwtype == "Fade" then
										PowerSir = 95
									elseif Throwtype == "Bullet" then
										PowerSir = clampnum(pow, 90, 95)
									else
										PowerSir = pow
									end
								else
									PowerSir = Data.NormalPower
								end
								local neworigin = start + (ThrowingTab.Direction * 5)

								local RemoteEvent = Football.Handle:FindFirstChild("RemoteEvent")
								if RemoteEvent then
									local ThrowAnimation = Char.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Animations.Throw)
									ThrowAnimation.Name = "Throw"
									ThrowAnimation:Play()
									RemoteEvent:fireServer("Clicked", start, neworigin + ThrowingTab.Direction * 10000, (game.PlaceId == 8206123457 and PowerSir) or 95, PowerSir)
									
								else
							   
								end 
							else

							end
						else
		   
						end
					else
				   
					end
				end
			elseif game.PlaceId == 8206123457 then
				if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessedEvent then
					if Char then
						local Football = Char:FindFirstChildOfClass("Tool")
						if Football then
							if state == true then
								if state == false then return end
								local start = Player.Character:FindFirstChild("Head").Position
								if not isLocked then
									if autoswr then
										ClosestPlr = getMostIsolatedPlayer(dradius)
									else
										local nearestPlayer = getNearestPlayerToMouse()
										if nearestPlayer and nearestPlayer:IsA("Player") then
											ClosestPlr = nearestPlayer
										end
									end
								end
								
								if isLocked and not ClosestPlr then
									if autoswr then
										if getMostIsolatedPlayer(dradius) == nil then
											ClosestPlr = ClosestPlr
										else
											ClosestPlr = getMostIsolatedPlayer(20)
										end
									else
										if getNearestPlayerToMouse() == nil then
											ClosestPlr = ClosestPlr
										else
											ClosestPlr = getNearestPlayerToMouse()
										end 
									end
								end
								local Initial = 95
								local Throwtype;
                                if autopmode then
                                    Throwtype = calculateThrowType(ClosestPlr)
                                else
                                    Throwtype = getThrowType()
                                end
								
							  
								local vel;
								local toThrowToDirection;
								local pow;

								local WhichOne2;
								if Throwtype == "Fade" then
									WhichOne2 = Data.FadeModeAngle
								elseif Throwtype == "Bullet" then
									WhichOne2 = Data.BulletModeAngle
								else
									WhichOne2 = Data.Angle
								end
								if Highestpwrmode then
									Initial = 95
								else
									if AutoPowa then
										if pow then
										Initial = pow
									else
										 Initial = 95
									end
								else
									Initial = Data.NormalPower
								end
							end
								local toLaunchAnlge;
								if Highestpwrmode then
									if AutoAngie then
										toLaunchAnlge = HighSpeedLowAngleCalcs(FF2Grav, Initial)
									else
										toLaunchAnlge = math.rad(WhichOne2)
									end
								else
									if AutoAngie then
										if Throwtype == "Fade" then
											toLaunchAnlge = math.rad(75)
										elseif Throwtype == "Bullet" then
											toLaunchAnlge = clampnum(HighSpeedLowAngleCalcs(FF2Grav, Initial), 0, 0.296706)
										else
											toLaunchAnlge = clampnum(calculateLaunchAngle(FF2Grav, Initial), 0, 0.975)
										end
									else
										toLaunchAnlge = math.rad(WhichOne2)
									end
								end
								local TOF = GetTimeOfFlightProjectile(Initial, toLaunchAnlge, FF2Grav)
								local YesEnd;
								if string.find(ClosestPlr.name, "bot 1") or string.find(ClosestPlr.name, "bot 3") then
										YesEnd = BotEstimatedVel(TOF, ClosestPlr)
								elseif not string.find(ClosestPlr.name, "bot 1") or not string.find(ClosestPlr.name, "bot 3") then
										YesEnd = GetTargetPositionForWR(TOF, ClosestPlr)
								end
								local PowerSir;

								vel, toThrowToDirection, pow = OverallVelocityNeededToReachAPosition(toLaunchAnlge, start, YesEnd, Vector3.new(0,-FF2Grav,0), TOF)  
								if AutoPowa then
									if Throwtype == "Fade" then
										PowerSir = 95
									elseif Throwtype == "Bullet" then
										PowerSir = clampnum(pow, 90, 95)
									else
										PowerSir = pow
									end
								else
									PowerSir = Data.NormalPower
								end
								local neworigin = start + (ThrowingTab.Direction * 5)

								local RemoteEvent = Football.Handle:FindFirstChild("RemoteEvent")
								if RemoteEvent then
									local ThrowAnimation = Char.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").Animations.Throw)
									ThrowAnimation.Name = "Throw"
									ThrowAnimation:Play()
									RemoteEvent:fireServer("Clicked", start, neworigin + ThrowingTab.Direction * 10000, (game.PlaceId == 8206123457 and PowerSir) or 95, PowerSir)
								else
									
								end 
							else
							
							end
						else
						  
						end
					else
				  
					end
				end
			end
		end)


		
	local TargetPosition;
	local PredictedRoute
	
	--// Connection to make it Click to Throw //--
	Char.ChildAdded:Connect(function(v)
		if v.Name == "Football" and Char then
			local children = v:GetChildren()
			if children.Name == "Handle" then
				local descendants = children:GetChildren()
				if descendants.Name == "LocalScript" then
					descendants:Destroy()
				end
			end
		end
	end)
	
	local customBeam = false
	--// One big function that holds function for if conditions //--
	task.spawn(function()
		game:GetService('RunService').Heartbeat:Connect(function()
			task.wait()
			
			if not isLocked then
				if autoswr then
                    ClosestPlr = getMostIsolatedPlayer(dradius)
                else
                    ClosestPlr = getNearestPlayerToMouse()
                end
			end
			
			
			local PredictedRoute;

			
			task.wait()
			if state  then
				if Player.Character and Player.Character:FindFirstChild("Football") and ClosestPlr then
					beam.Enabled = true
				
				local Throwtype;
				if autopmode then
                    Throwtype = calculateThrowType(ClosestPlr)
                else
                    Throwtype = getThrowType()
                end
				
			  
				
				Highlight.Enabled = true
				Highlight.OutlineTransparency = 0
				Highlight.FillColor = Color3.new(0.34117647058, 0.34117647058, 1)
				Highlight.OutlineColor = Color3.new(0.803921, 0.898039, 0.941176)
				--[[if not string.find(ClosestPlr.Name, "bot 1") and not string.find(ClosestPlr.Name, "bot 3") then
					PredictedRoute = CalculateRouteofPlayer(ClosestPlr)
				elseif string.find(ClosestPlr.Name, "bot 1") or  string.find(ClosestPlr.Name, "bot 3") then
					PredictedRoute = "Straight"
				end--]]


				if not string.find(ClosestPlr.Name, "bot 1") and not string.find(ClosestPlr.Name, "bot 3") then
					if ClosestPlr.Character:FindFirstChild("HumanoidRootPart") then
						Highlight.Parent = ClosestPlr.Character
						
					end
				elseif string.find(ClosestPlr.Name, "bot 1") or string.find(ClosestPlr.Name, "bot 3") then
					Highlight.Parent = ClosestPlr	
					
				end
				ScreenGui.Enabled = true
				
				local WhichOne;
				if Throwtype == "Fade" then
					WhichOne = Data.FadeModeAngle
				elseif Throwtype == "Bullet" then
					WhichOne = Data.BulletModeAngle
				else
					WhichOne = Data.Angle
				end


				local FF2Grav = 28
				local Start = Player.Character:FindFirstChild("Head").Position
				local power;
				local velocity;
				local direction;
				local Initial;
				local LaunchAngle;
				if Highestpwrmode then
						Initial = 95
				else
					if AutoPowa then
						if power then
							Initial = power
						else
							Initial = 95
						end
					else
						Initial = Data.NormalPower
					end

				end

				if Highestpwrmode then
					if AutoAngie then
						LaunchAngle = HighSpeedLowAngleCalcs(FF2Grav, Initial)
					else
						LaunchAngle = math.rad(WhichOne)
					end
				else
					if AutoAngie then
						if Throwtype == "Fade" then
							LaunchAngle = math.rad(75)
						elseif Throwtype == "Bullet" then
							LaunchAngle = clampnum(HighSpeedLowAngleCalcs(FF2Grav, Initial), 0, 0.296706)
						else
							LaunchAngle = clampnum(calculateLaunchAngle(FF2Grav, Initial), 0, 0.975)
						end
					else
						LaunchAngle = math.rad(WhichOne)
					end
				end

				
				local TOF = GetTimeOfFlightProjectile(Initial, LaunchAngle, FF2Grav)
				local TargetPosition;
				
				if (string.find(ClosestPlr.Name, "bot 1") or string.find(ClosestPlr.Name, "bot 3")) then
					if game.PlaceId == 8206123457 then
						TargetPosition = BotEstimatedVel(TOF, ClosestPlr)
					elseif game.PlaceId ~= 8206123457 then
						TargetPosition = KeepPosInBounds(BotEstimatedVel(TOF, ClosestPlr), 70.5, 175.5)
					end
				else
					if game.PlaceId == 8206123457 then
						TargetPosition = GetTargetPositionForWR(TOF, ClosestPlr)
					elseif game.PlaceId ~= 8206123457 then
						TargetPosition = KeepPosInBounds(GetTargetPositionForWR(TOF, ClosestPlr), 70.5, 175.5)
					end
				end
				
				local POWAA;
				
				 velocity, direction, power = OverallVelocityNeededToReachAPosition(LaunchAngle, Start, TargetPosition, Vector3.new(0, -FF2Grav, 0), TOF)
					if power and Initial == 95 and AutoPowa then
						Initial = power
					else
						Initial = Data.NormalPower
					end								
					
				if AutoPowa then
					if Throwtype == "Fade" then
						POWAA = 95
					elseif Throwtype == "Bullet" then
						POWAA = clampnum(power, 90, 95)
					else
						POWAA = power
					end
				else
					POWAA = Data.NormalPower
				end         
				if isVector3Valid(direction) and isVector3Valid(TargetPosition) then
					ThrowingTab.Direction = direction
					
					local startAdjusted = Start + (ThrowingTab.Direction * 5) -- // this is the beginning offsets on the server // --
					local ATime;
					if customBeam then
						ATimee = 10
					else
						ATimee = TOF
					end
					local curve0, curve1, cf0, cf1 = beamProjectile(Vector3.new(0, -FF2Grav, 0), POWAA * ThrowingTab.Direction, Start + (ThrowingTab.Direction * 5), ATimee)
					
					beam.CurveSize0 = curve0
					beam.CurveSize1 = curve1
					beam.Attachment0.CFrame = beam.Attachment0.Parent.CFrame:inverse() * cf0
					beam.Attachment1.CFrame = beam.Attachment1.Parent.CFrame:inverse() * cf1
					local PeakPos = ProjectilePeakPosition(startAdjusted, velocity, Vector3.new(0, -28, 0))
					throwingpar.Parent = workspace
					throwingpar.CFrame = CFrame.new(PeakPos)
					throwingpar.Anchored = true
					
					---// get beam rotation //--
					local sum = (beam.Attachment1.CFrame - beam.Attachment1.Position):Inverse()
					if endPartOfBeam == false then
						VisPart.CFrame = beam.Attachment1.CFrame * sum * CFrame.Angles(math.rad(0), 0, 0)
					end
					--trace.From = game:GetService("UserInputService"):GetMouseLocation()--
					local CamPo, OnScren = isVisandPos(VisPart.Position)
					local CamPo2, OnS = isVisandPos(beam.Attachment0.Position)
			
					TargetPlr.Text = ClosestPlr.Name
					PowerNum.Text = tostring(POWAA)
					
					
					
					if not (string.find(ClosestPlr.Name, "bot 1") or string.find(ClosestPlr.Name, "bot 3")) then
						local ClosestCB = getPeopleGuardingClosestToMouse(ClosestPlr)
						if Interceptable(ClosestCB, VisPart.Position, TOF) then
							IntText.Text = "Yes"
						else
							IntText.Text = "No"
						end
					elseif string.find(ClosestPlr.Name, "bot 1") or string.find(ClosestPlr.Name, "bot 3") then
						local BotCbClosest = getClosestCBtoBot(ClosestPlr)
						if botInterceptable(BotCbClosest, VisPart.Position, TOF) then
							IntText.Text = "Yes"
						else
							IntText.Text = "No"
						end
					end


					if not string.find(ClosestPlr.Name, "bot 1") and not string.find(ClosestPlr.Name, "bot 3") then
						local ClosestWRR = getNearestPlayerToMouse()
						if CatchAble(ClosestWRR, VisPart.Position, TOF) then
							CatchText.Text = "Yes"
						else
							CatchText.Text = "No"
						end
					elseif string.find(ClosestPlr.Name, "bot 1") or string.find(ClosestPlr.Name, "bot 3") then
						local BotCbWr = getNearestPlayerToMouse()
						if botCatchAble(BotCbWr, VisPart.Position) then
							CatchText.Text = "Yes"
						else
							CatchText.Text = "No"
						end
					end
				
                    airtimetext.Text = tostring(RoundNumToHundredths(TOF)) .. "s"
					
					
					if AutoAngie then
						if Throwtype == "Fade" then
							AngleNum.Text = "75"
						else
							AngleNum.Text = tostring(RoundNumToHundredths(math.deg(LaunchAngle)))
						end
					else
						AngleNum.Text = tostring(WhichOne)
					end
				end
			else
				ScreenGui.Enabled = false
				Highlight.Enabled = false

			end
		else
			beam.Enabled = false
			ScreenGui.Enabled = false
			Highlight.Enabled = false
		end
		end)
	end)
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local Players = game:GetService("Players")

local aRushOn = false
local agDist = 100 -- Auto Rush Distance
local LocalPlayer = Players.LocalPlayer
local charplr = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp2, hum2

-- Function to update character components when respawning
local function updateCharacter(character)
    charplr = character
    hrp2 = character:WaitForChild("HumanoidRootPart", 5) -- Wait to make sure it's loaded
    hum2 = character:WaitForChild("Humanoid", 5)
end

updateCharacter(charplr) -- Initial update
LocalPlayer.CharacterAdded:Connect(updateCharacter) -- Update when respawning

-- Function to handle auto rushing
local function doGuarding()
    local QBValue = ReplicatedStorage:FindFirstChild("Values") and ReplicatedStorage.Values:FindFirstChild("QB")
    if not QBValue or not QBValue.Value then return end -- Ensure QB value exists

    local BallCarrier = QBValue.Value
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team and player == BallCarrier then
            local car = player.Character
            if car then
                local hrp = car:FindFirstChild("HumanoidRootPart")
                local hum = car:FindFirstChild("Humanoid")
                local hasBall = car:FindFirstChild("Football") -- Check if the player is holding the ball
                if hrp and hrp2 and hum and hum2 and hasBall then
                    local WS = 20 -- Walking Speed
                    local distance = (hrp.Position - hrp2.Position).Magnitude
                    local TimeToGet = distance / WS
                    if distance <= agDist then
                        local targetPos = hrp.Position + (hum.MoveDirection * TimeToGet * WS)
                        hum2:MoveTo(targetPos)
                    end
                end
            end
        end
    end
end

-- Continuous Auto Rush Check
task.spawn(function()
    while task.wait(0.1) do -- Running every 0.1s instead of every frame for efficiency
        if aRushOn then
            doGuarding()
        end
    end
end)

	local pvon = false
    local pvstrength = 10
    local pvdist = 20
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character
    plr.CharacterAdded:Connect(function(character)
        char = character
    end)
    
    task.spawn(function()
        workspace.ChildAdded:Connect(function(child)
            while task.wait() do
                if child.Name == "Football" and pvon and child:IsA("BasePart") then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local direction = (child.Position - hrp.Position).Unit
                    local dist = (child.Position - hrp.Position).magnitude


                        if dist <= pvdist then
                       
                            
                               
                                hrp.Velocity = direction * pvstrength
                                
                           
                        end
                    end
                end
        end)    
    end)
	getgenv().antiJamOn = false
task.spawn(function()
    while wait() do
        for index, player in pairs(game:GetService("Players"):GetChildren()) do
            if player ~= LocalPlayer then
                local char = player.Character
                if char then
                    for index, part in pairs(char:GetChildren()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") and part.CanCollide then
                            if antiJamOn then
                                part.CanCollide = false
                            else
                                part.CanCollide = true
                            end
                        end
                    end
                end
            end
        end
    end
end)
	local plrr = game:GetService("Players").LocalPlayer
    local charr = plr.Character
    plrr.CharacterAdded:Connect(function(character)
        charr = character
    end)
    local clicktpfon = false
	local clicktpstreng = 3
	uis.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.KeyCode == Enum.KeyCode.F and clicktpfon then
			local hrp = charr:FindFirstChild("HumanoidRootPart")

			hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * clicktpstreng)

		end
	end)


    local angleEnhance;
	local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    local char = lp.Character
    lp.CharacterAdded:Connect(function(character)
        char = character
    end)
    local function onToggle2(Value)
        angleEnhance = Value
        if angleEnhance then
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                local upWard = Vector3.new(0, 10, 0)
                local lp = Players.LocalPlayer
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChild("Humanoid")
                local AngleNumBa = (52.5 / 10)
                if hrp and hum and hum.FloorMaterial == Enum.Material.Grass and hum.Jump then
                    hrp.Velocity = upWard * AngleNumBa
                end
            end)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
local BeOn = false
	workspace.ChildAdded:Connect(function(v)
		if v.Name == "Football" and v:IsA("BasePart") and BeOn then
				task.wait()
				local startTime = tick()
				local Beginning = v.Position
				local Vel3 = v.Velocity
				local t = 10
				local ff2G = Vector3.new(0, -28, 0)
				local curve0, curve1, cf1, cf2 = beamProjectile(ff2G, Vel3, Beginning, t)
				local beam = Instance.new("Beam")
				local Attach0 = Instance.new("Attachment", workspace.Terrain)
				local Attach1 = Instance.new("Attachment", workspace.Terrain)
		
				beam.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 12, 12)),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 12, 12))
				})
		
				beam.Parent = workspace.Terrain
				beam.CurveSize0 = curve0
				beam.CurveSize1 = curve1
				beam.Segments = 1750
		
				Attach0.CFrame = Attach0.Parent.CFrame:inverse() * cf1
				Attach1.CFrame = Attach1.Parent.CFrame:inverse() * cf2
				beam.Attachment0 = Attach0
				beam.Attachment1 = Attach1
		
				beam.Width0 = 0.5
				beam.Width1 = 0.5
				repeat 
					task.wait()
				until v.Parent ~= workspace
					Attach0:Destroy()
					Attach1:Destroy()
			end
		end)

		local OceanLib = Ocean:NewWindow()
		local t1 = OceanLib:Tab("Catching", 10723426986)
		local t4 = OceanLib:Tab("QB Configs", 10723426986)
		local t5 = OceanLib:Tab("Automatics", 10723426986)
		local t6 = OceanLib:Tab("Trolling", 10723426986)
		local t7 = OceanLib:Tab("Misc", 10723426986)
		local t2 = OceanLib:Tab("Player", 10723424505)
		
		t1:Toggle("Magnets", {
			Default  = false,
			Callback = function(v)
				on = v
			end,
		})
		t1:Dropdown("Magnet Version", {
			Default  = "None",
			Options = {"Legit", "Blatant", "League", "Regular"},
			Callback = function(v)
				msVersion = v
			end,
		})
		t1:Slider("Magnet Range", {
			Default  = 0,
			Min		 = 0,
			Max		 = 35,
			Callback = function(v)
				msSecondVerRange = v
			end,
		})

	
             t4:Toggle("QbAimbot", {
                     Default = false,
                     Callback = function(v)
                        isLocked = v
           end
})

		getgenv().VIM = game:GetService("VirtualInputManager")
getgenv().plrrrr = game:GetService("Players").LocalPlayer
getgenv().charrrr = plrrrr.Character or plrrrr.CharacterAdded:Wait()  -- Ensure the character is loaded
getgenv().kickOn = false

-- Reconnect the character on CharacterAdded
plrrrr.CharacterAdded:Connect(function(character)
    charrrr = character
end)

local autoCapOn = false

if game.PlaceId ~= 8206123457 then
    -- Ensure objects are found properly
    local endCaptainLine = workspace:FindFirstChild("Models") and workspace.Models:FindFirstChild("LockerRoomA") and workspace.Models.LockerRoomA:FindFirstChild("FinishLine")
    
    if not endCaptainLine then
        warn("FinishLine not found in LockerRoomA!")
        return
    end
    
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    
    if not hrp then
        warn("HumanoidRootPart not found!")
        return
    end

    local autoCapOffset = Vector3.new(2.1, 2.1, 2.1)

    -- Improved connection and smooth updates to CFrame
    endCaptainLine:GetPropertyChangedSignal("Position"):Connect(function()
        if autoCapOn then
            local startTime = tick()
            -- Set the character's CFrame near the FinishLine
            local function setCFrameSmoothly()
                if tick() - startTime >= 0.13 then
                    hrp.CFrame = endCaptainLine.CFrame + autoCapOffset
                end
            end
            -- Run the updates a few times
            for _ = 1, 7 do
                task.wait(0.25)
                setCFrameSmoothly()
            end
        end
    end)
end

game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
	
local hum = charrrr:FindFirstChild("Humanoid")
    if child.Name == "KickerGui" and charrrr and hum and kickOn then
        local cursor = child:FindFirstChild("Cursor", true)
        local firstdone = false
        local seconddone = false
        VIM:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
        repeat 
            task.wait()
        until cursor.Position.Y.Scale <= 0.03
        VIM:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
        firstdone = true
        if firstdone then
            repeat 
                task.wait()
            until cursor.Position.Y.Scale >= 0.89
        end
       
            VIM:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
            seconddone = true
          if seconddone and firstdone then
            VIM:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
            hum:MoveTo(game.Workspace["KickerBall"].Position)
          end
    end
end)


getgenv().antiBlockOn = false

local PLR = game:GetService("Players").LocalPlayer
local charppp = PLR.Character
PLR.CharacterAdded:Connect(function(gg)
	charppp = gg
end)
local isAMatch = string.match
charppp.DescendantAdded:Connect(function(child)
	if isAMatch(child.Name, "FFmover") and antiBlockOn then
		print("Removed.")
		child:Destroy()
	end
end)
		
		local VIM = game:GetService("VirtualInputManager")
local PLR = game:GetService("Players").LocalPlayer
local charp = PLR.Character
local autoCatchOn = false
PLR.CharacterAdded:Connect(function(gg)
	charp = gg
end)

_G.dist = 17  

local function Autocatch()
    VIM:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
    VIM:SendMouseButtonEvent(0, 0, 0, false, nil, 0)
end

game:GetService("RunService").RenderStepped:Connect(function()
    for index, ball in pairs(workspace:GetChildren()) do
        if ball.Name == "Football" and ball:IsA("BasePart") then
            if charp:FindFirstChild("HumanoidRootPart") and (charp:FindFirstChild("HumanoidRootPart").Position - ball.Position).Magnitude <= _G.dist and autoCatchOn then
                Autocatch()
            end
        end
    end
end)


getgenv().VIM = game:GetService("VirtualInputManager")
getgenv().PLR = game:GetService("Players").LocalPlayer
getgenv().charr = PLR.Character
getgenv().autoJumpOn = false
PLR.CharacterAdded:Connect(function(gg)
	charr = gg
end)

getgenv().disttt = 17  

function AutoJump()
    VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    wait(0.1)
    VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end

game:GetService("RunService").RenderStepped:Connect(function()
    for index, ball in pairs(workspace:GetChildren()) do
        if ball.Name == "Football" and ball:IsA("BasePart") then
            if charr:FindFirstChild("HumanoidRootPart") and (charr:FindFirstChild("HumanoidRootPart").Position - ball.Position).Magnitude <= disttt and autoJumpOn then
                AutoJump()
            end
        end
    end
end)
getgenv().VIM = game:GetService("VirtualInputManager")
getgenv().PLR = game:GetService("Players").LocalPlayer
getgenv().charrr = PLR.Character
getgenv().autoSwatOn = false
PLR.CharacterAdded:Connect(function(gg)
	charrr = gg
end)

getgenv().distttt = 17  

function AutoSwat()
    VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
    wait(0.1)
    VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game)
end

game:GetService("RunService").RenderStepped:Connect(function()
    for index, ball in pairs(workspace:GetChildren()) do
        if ball.Name == "Football" and ball:IsA("BasePart") then
            if charrr:FindFirstChild("HumanoidRootPart") and (charrr:FindFirstChild("HumanoidRootPart").Position - ball.Position).Magnitude <= distttt and autoSwatOn then
                AutoSwat()
            end
        end
    end
end)
		
	
t5:Toggle("Auto Catch", {
	Default  = false,
	Callback = function(v)
		autoCatchOn = v
	end,
})
t5:Slider("Auto Catch Distance", {
	Default  = 10,
	Min		 = 10,
	Max		 = 20,
	Callback = function(v)
		_G.dist = v
	end,
})
t5:Toggle("Auto Jump", {
	Default  = false,
	Callback = function(v)
		autoJumpOn = v
	end,
})
t5:Slider("Auto Jump Distance", {
	Default  = 10,
	Min		 = 10,
	Max		 = 20,
	Callback = function(v)
		disttt = v
	end,
})
t5:Toggle("Auto Swat", {
	Default  = false,
	Callback = function(v)
		autoSwatOn = v
	end,
})
t5:Slider("Auto Swat Distance", {
	Default  = 10,
	Min		 = 10,
	Max		 = 20,
	Callback = function(v)
		distttt = v
	end,
})
-- UI Elements
t5:Toggle("Auto Rush", {
    Default  = false,
    Callback = function(v)
        aRushOn = v
    end,
})

t5:Slider("Auto Rush Distance", {
    Default  = 100,
    Min      = 100,
    Max      = 100,
    Callback = function(v)
        agDist = v
    end,
})
t5:Toggle("Kicker Aimbot", {
	Default  = false,
	Callback = function(v)
		kickOn = v
	end,
})

t5:Toggle("Auto Captain", {
    Default = false,
    Callback = function(v)
        autoCapOn = v
    end,
})










        
getgenv().LookVectorSpeed = false
getgenv().UIS = game:GetService("UserInputService")
getgenv().playAH = game:GetService("Players").LocalPlayer
getgenv().ggchara = playAH.Character or playAH.CharacterAdded:Wait()
getgenv().hrpp = nil
getgenv().Speedboostnum = 3
playAH.CharacterAdded:Connect(function(gg)
    ggchara = gg
end)
task.spawn(function()
    while wait() do
        hrpp = ggchara:FindFirstChild("HumanoidRootPart")
    end
end)

function VectorSpeed()
    hrpp = ggchara:FindFirstChild("HumanoidRootPart")

    if LookVectorSpeed  then
        hrpp.CFrame = hrpp.CFrame + hrpp.CFrame.LookVector * Speedboostnum
    end
end

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        VectorSpeed()
    end
end)

		local jps = 50
        local jumpPowerEnabled = false
        local connection
        local lp = Players.LocalPlayer
        local char = plr.Character
        lp.CharacterAdded:Connect(function(character)
            char = character
        end)
        local function onToggle(Value)
            jumpPowerEnabled = Value
            if jumpPowerEnabled then
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local upWard = Vector3.new(0, 10, 0)
                    local lp = Players.LocalPlayer
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChild("Humanoid")
                    local newJPS = (jps / 10)
                    if hrp and hum and hum.FloorMaterial == Enum.Material.Grass and hum.Jump then
                        hrp.Velocity = upWard * newJPS
                    end
                end)
            else
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end 	t2:Toggle("Jump Power", {
			Default  = false,
			Callback = function(v)
				local jpOnDude = v
				onToggle(jpOnDude)
			end,
		})
		t2:Slider("Jump Power Strength", {
			Default  = 50,
			Min		 = 50,
			Max		 = 70,
			Callback = function(v)
				jps = v
			end,
		})
		local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char, hrp, hum
local speedMultiplier = 3
local speedBoostEnabled = false
local connection

-- Function to update character references
local function updateCharacterReferences(character)
    char = character or lp.Character
    hrp = char:WaitForChild("HumanoidRootPart")
    hum = char:WaitForChild("Humanoid")
end

-- Listen for respawn updates
lp.CharacterAdded:Connect(updateCharacterReferences)
if lp.Character then updateCharacterReferences(lp.Character) end

-- Toggle Speed Boost
local function onToggle(enabled)
    speedBoostEnabled = enabled
    if speedBoostEnabled then
        connection = RunService.RenderStepped:Connect(function()
            if hrp and hum and hum.MoveDirection.Magnitude > 0 and hum.FloorMaterial == Enum.Material.Grass then
                local moveVector = hum.MoveDirection.Unit * (speedMultiplier * 10)
                hrp.Velocity = Vector3.new(moveVector.X, hrp.Velocity.Y, moveVector.Z)
            end
        end)
    else
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end

-- GUI Toggle Button
t2:Toggle("Walkspeed", {
    Default = false,
    Callback = function(state)
        onToggle(state)
    end,
})

-- GUI Slider to Adjust Speed
t2:Slider("Walkspeed Strength", {
    Default = 2,
    Min = 2,
    Max = 7,
    Callback = function(value)
        speedMultiplier = value
    end,
})
		t2:Toggle("Click to TP | F", {
			Default  = false,
			Callback = function(v)
				LookVectorSpeed = v
			end,
		})
		t2:Slider("TP Strength", {
			Default  = 3,
			Min		 = 0,
			Max		 = 5,
			Callback = function(v)
				Speedboostnum = v
			end,
		})


		t2:Toggle("Angle Enhance", {
			Default  = false,
			Callback = function(v)
				local jpOnDudee = v
				onToggle2(jpOnDudee)
			end,
		})
	
		t2:Toggle("Infinite Jump", {
	Default  = false,
	Callback = function(state)
		_G.infinjump = state

		if _G.infinJumpStarted == nil then
			_G.infinJumpStarted = true

			local plr = game:GetService('Players').LocalPlayer
			local m = plr:GetMouse()

			m.KeyDown:Connect(function(k)
				if _G.infinjump and k:byte() == 32 then
					local humanoid = plr.Character and plr.Character:FindFirstChildOfClass('Humanoid')
					if humanoid then
						humanoid:ChangeState('Jumping')
					end
				end
			end)
		end
	end,
})


		

		t7:Toggle("Anti Jam", {
			Default  = false,
			Callback = function(v)
				antiJamOn = v
			end,
		})
		t7:Toggle("Anti Block", {
			Default  = false,
			Callback = function(v)
				antiBlockOn = v
			end,
		})

		local set = {
    sinewavefield = false
	}
		t7:Toggle("Change Field Color", {
			Default  = false,
			Callback = function(v)
				set.sinewavefield = v
			end,
		})

		local particlesEnabled = false

local function removeParticles(parent)
    if not particlesEnabled then return end
    for _, child in ipairs(parent:GetDescendants()) do
        if child:IsA("ParticleEmitter") or child:IsA("Fire") or child:IsA("Smoke") or child:IsA("Sparkles") then
            child:Destroy()
        end
    end
end

-- Run the function on the entire game
removeParticles(game)

-- If you want to keep removing particles over time, use this
game.DescendantAdded:Connect(function(child)
    if particlesEnabled and (child:IsA("ParticleEmitter") or child:IsA("Fire") or child:IsA("Smoke") or child:IsA("Sparkles")) then
        child:Destroy()
    end
end)

-- Toggle using UI framework
t7:Toggle("Remove Weather", {
    Default = false,
    Callback = function(state)
        particlesEnabled = state
        if particlesEnabled then
            removeParticles(game)
        end
    end
})


		task.spawn(function()
    local grass = {}
    for i, v in next, game:GetService("Workspace").Models.Field.Grass.Normal:GetDescendants() do
        if v.Name == "Grass" or v.Name == "Mid" and v:IsA("BasePart") then
            table.insert(grass, v)
        end
    end
    local origColor = game:GetService("Workspace").Models.Field.Grass.Outside.Grass.Color

    local sin = math.sin
    local pi = math.pi
    local parts = {}
    local numParts = #grass
    local amplitude = 0.1
    local frequency = 0.55
    local offset = 0
    local oldoffset = 0

    local ts = game:GetService("TweenService")
    local tweens = {}

    -- Store the original colors of the grass parts
    local originalColors = {}
    for i, part in ipairs(grass) do
        originalColors[part] = part.Color
    end

    while true do
        if not set.sinewavefield then
            for i, tween in ipairs(tweens) do
                tween:Cancel()
            end
            tweens = {}

            -- Restore the original colors of the grass parts
            for i, part in ipairs(grass) do
                part.Color = originalColors[part]
            end

            task.wait()
            continue
        end

        offset = offset + 0.1
        local floor_offset = math.floor(offset)

        for i, part in ipairs(grass) do
            local hue = 0.6 -- Adjust this value to the desired hue (blue)
            local saturation = 0.5
            local value = 0.5 + (sin(offset * frequency + i * pi / #grass) + 1) / 2 * 0.4

            local color = Color3.fromHSV(hue, saturation, value)

            local tween = ts:Create(part, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { Color = color })
            tween:Play()
            table.insert(tweens, tween)
        end

        if math.floor(oldoffset) ~= floor_offset and floor_offset % 5 == 0 then
            task.wait(0.25)
        end

        wait()
    end
end)


local Players = game:GetService("Players")

local studSize = 1  -- Default width & length
local studThickness = 0.2  -- Thin stud
local studsEnabled = false
local studParts = {}

-- Function to create or update stud on a player's head
local function updateStud(player)
    if player ~= Players.LocalPlayer then  -- Avoid affecting yourself
        local character = player.Character
        if character then
            local head = character:FindFirstChild("Head")
            if head and head:IsA("BasePart") then
                local stud = studParts[player]

                if not stud then
                    -- Create a new stud
                    stud = Instance.new("Part")
                    stud.Name = "HeadStud"
                    stud.CanCollide = true
                    stud.Material = Enum.Material.SmoothPlastic
                    stud.Color = Color3.fromRGB(0,0,0) -- **Grey**
                    stud.Parent = character
                    studParts[player] = stud

                    -- Weld the stud to the player's head (so it moves with them)
                    local weld = Instance.new("WeldConstraint")
                    weld.Part0 = head
                    weld.Part1 = stud
                    weld.Parent = stud
                end

                -- Update stud size & position
                stud.Size = Vector3.new(studSize, studThickness, studSize)
                stud.Position = head.Position + Vector3.new(0, 1.2, 0) -- Slightly lower than before
            end
        end
    end
end

-- Function to toggle studs
local function toggleStuds(state)
    studsEnabled = state
    if state then
        for _, player in pairs(Players:GetPlayers()) do
            updateStud(player)
            player.CharacterAdded:Connect(function()
                task.wait(1)
                updateStud(player)
            end)
        end
    else
        for _, stud in pairs(studParts) do
            if stud then stud:Destroy() end
        end
        studParts = {}
    end
end

-- Apply to new players when they join
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        if studsEnabled then
            updateStud(player)
        end
    end)
end)

-- GUI Toggle
t6:Toggle("Stud on Head", {
    Default = false,
    Callback = function(state)
        toggleStuds(state)
    end,
})

-- GUI Slider (Width & Length together)
t6:Slider("Stud Size", {
    Default = 1,
    Min = 1,
    Max = 6,
    Callback = function(value)
        studSize = value
        if studsEnabled then
            for _, player in pairs(Players:GetPlayers()) do
                updateStud(player)
            end
        end
    end,
})





	t6:Toggle("Underground", {
			Default  = false,
			Callback = function(v)
				state = v
	local transparency = state and 0.5 or 0
	local model = game:GetService("Workspace").Models.Field.Grass
	for _, part in pairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = not state
			part.Transparency = transparency
		end
	end
	if state then
		local part = Instance.new("Part")
		part.Size = Vector3.new(500, 0.001, 500)
		part.CFrame = CFrame.new(Vector3.new(10.3562937, -1.51527438, 30.4708614))
		part.Anchored = true
		part.Parent = game.Workspace

		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://182724289"
		track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		track:Play(.1, 1, 1)
	else

		if track ~= nil then
			track:Stop()
		end
	end
			end,
		})

_G.chatSpyEnabled = false
_G.spyOnMyself = false
_G.public = false
_G.publicItalics = true

-- Customizing private logs
_G.privateProperties = {
    Color = Color3.fromRGB(62, 148, 240);
    Font = Enum.Font.SourceSansBold;
    TextSize = 18;
}

local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

-- Function to toggle chat spy on/off
local function toggleChatSpy()
    _G.chatSpyEnabled = not _G.chatSpyEnabled

    if _G.chatSpyEnabled then
        -- If enabled, display "Chat Spy Enabled"
        _G.privateProperties.Text = "[Amiri] Chat Spy Enabled"
    else
        -- If disabled, display "Chat Spy Off"
        _G.privateProperties.Text = "[Amiri] Chat Spy Off"
    end

    -- Display the system message
    StarterGui:SetCore("ChatMakeSystemMessage", _G.privateProperties)
end

-- Function that listens to messages and spies on them if enabled
local function onChatted(p, msg)
    if _G.chatSpyInstance == instance then
        if p == player and msg:lower():sub(1, 4) == "/spy" then
            toggleChatSpy()  -- Toggle the Chat Spy on/off when "/spy" is typed
            wait(0.3)
        elseif _G.chatSpyEnabled and (_G.spyOnMyself == true or p ~= player) then
            msg = msg:gsub("[\n\r]", ''):gsub("\t", ' '):gsub("[ ]+", ' ')
            local hidden = true
            local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
                if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and
                   (channel == "All" or (channel == "Team" and _G.public == false and Players[packet.FromSpeaker].Team == player.Team)) then
                    hidden = false
                end
            end)
            wait(1)
            conn:Disconnect()
            if hidden and _G.chatSpyEnabled then
                if _G.public then
                    saymsg:FireServer((_G.publicItalics and "/me " or '') .. "[Lucid Spy] [" .. p.Name .. "]: " .. msg, "All")
                else
                    _G.privateProperties.Text = "[Amiri] Chat Spy [" .. p.Name .. "]: " .. msg
                    StarterGui:SetCore("ChatMakeSystemMessage", _G.privateProperties)
                end
            end
        end
    end
end

-- Connect players' chats
for _, p in ipairs(Players:GetPlayers()) do
    p.Chatted:Connect(function(msg) onChatted(p, msg) end)
end
Players.PlayerAdded:Connect(function(p)
    p.Chatted:Connect(function(msg) onChatted(p, msg) end)
end)

-- Display initial system message based on the state of chat spy
_G.privateProperties.Text = "[Amiri] Chat Spy " .. (_G.chatSpyEnabled and "Enabled" or "Off")
StarterGui:SetCore("ChatMakeSystemMessage", _G.privateProperties)

-- Add the toggle button for Chat Spy
t7:Toggle("Chat Spy", {
    Default = true,
    Callback = function(state)
        toggleChatSpy()  -- Toggle the Chat Spy on/off when the toggle is clicked
    end,
})

