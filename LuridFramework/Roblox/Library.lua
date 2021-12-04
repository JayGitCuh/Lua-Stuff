--Made by Jayy#6265
--Open source is simply better

local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local HapticService = game:GetService("HapticService")
local UserInputService = game:GetService("UserInputService")

local function MakeDraggable(ClickObject, Object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	ClickObject.InputBegan:Connect(function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Dragging = true
			DragStart = Input.Position
			StartPosition = Object.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	ClickObject.InputChanged:Connect(function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseMovement
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - DragStart
			Object.Position = UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		end
	end)
end

local Library = {}

function Library:CreateMain(Bigtext, bottomsmall, color, visiblekey)

	local menuColor = color or Color3.fromRGB(0, 98, 255)

	local Lurid = Instance.new("ScreenGui")

	local MenuBG = Instance.new("Frame")
	local TOP = Instance.new("Frame")
	local NAME = Instance.new("TextLabel")
	local VERSION = Instance.new("TextLabel")
	local TopLine = Instance.new("Frame")

	MakeDraggable(TOP, MenuBG)

	Lurid.Name = "Lurid"
	Lurid.Parent = game:GetService("CoreGui")
	Lurid.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MenuBG.Name = "MenuBG"
	MenuBG.Parent = Lurid
	MenuBG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MenuBG.BackgroundTransparency = 1.000
	MenuBG.BorderSizePixel = 0
	MenuBG.Position = UDim2.new(0.157, 0, 0.154, 0)
	MenuBG.Size = UDim2.new(0, 669, 0, 549)

	local toggle = false -- false is Off; true is On

	function onKeyPress(actionName, userInputState, inputObject)
		if userInputState == Enum.UserInputState.Begin then
			if toggle == false then
				toggle = true

				game.TweenService
				:Create(MenuBG, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Position = UDim2.new(0.157, 0, 0.154, 0),
				})
				:Play()

				MenuBG.Visible = true
			else
				toggle = false

				game.TweenService
				:Create(MenuBG, TweenInfo.new(0.30, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Position = UDim2.new(8, 0, 0.154, 0),
				})
				:Play()

				wait()

				MenuBG.Visible = false
			end
		end
	end

	game.ContextActionService:BindAction("keyPress", onKeyPress, false, visiblekey)

	TOP.Name = "TOP"
	TOP.Parent = MenuBG
	TOP.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TOP.BackgroundTransparency = 0.400
	TOP.BorderSizePixel = 0
	TOP.ClipsDescendants = true
	TOP.Size = UDim2.new(0, 669, 0, 67)

	NAME.Name = "NAME"
	NAME.Parent = TOP
	NAME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NAME.BackgroundTransparency = 1.000
	NAME.BorderSizePixel = 0
	NAME.Position = UDim2.new(0.311, 0, -0.104, 0)
	NAME.Size = UDim2.new(0, 254, 0, 67)
	NAME.Font = Enum.Font.GothamBold
	NAME.Text = Bigtext
	NAME.TextColor3 = Color3.fromRGB(255, 255, 255)
	NAME.TextSize = 40.000
	NAME.TextStrokeColor3 = menuColor
	NAME.TextStrokeTransparency = 0.000

	VERSION.Name = "VERSION"
	VERSION.Parent = TOP
	VERSION.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	VERSION.BackgroundTransparency = 1.000
	VERSION.Position = UDim2.new(0.359, 0,0.522, 0)
	VERSION.Size = UDim2.new(0, 190, 0, 35)
	VERSION.Font = Enum.Font.GothamSemibold
	VERSION.Text = bottomsmall
	VERSION.TextColor3 = Color3.fromRGB(255, 255, 255)
	VERSION.TextSize = 16.000

	TopLine.Name = "TopLine"
	TopLine.Parent = TOP
	TopLine.BackgroundColor3 = menuColor
	TopLine.BorderSizePixel = 0
	TopLine.Position = UDim2.new(0, 0, -1.02344775, 0)
	TopLine.Size = UDim2.new(0, 669, 0, 72)

	local Tabs = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Tabs.Name = "Tabs"
	Tabs.Parent = MenuBG
	Tabs.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BackgroundTransparency = 1.000
	Tabs.BorderSizePixel = 0
	Tabs.ClipsDescendants = true
	Tabs.Position = UDim2.new(0, 0, 0.134000003, 0)
	Tabs.Size = UDim2.new(0, 669, 0, 23)

	UIListLayout.Parent = Tabs
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 2)

	local MainTabFolder = Instance.new("Folder")

	MainTabFolder.Name = "MainTabFolder"
	MainTabFolder.Parent = MenuBG

	local OverlayContainer = Instance.new("Frame")

	OverlayContainer.Name = "OverlayContainer"
	OverlayContainer.Parent = Lurid
	OverlayContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OverlayContainer.BackgroundTransparency = 1.000
	OverlayContainer.Position = UDim2.new(0.840267479, 0, 0.0175925922, 0)
	OverlayContainer.Size = UDim2.new(0, 198, 0, 1061)

	function Library:DestroyMenu() -- Force destroys the menu
		Lurid:Destroy()
	end	

	function Library:CreateRightSolidOverlay(text) --overlay (no need to comment cuz its just a bigass label)
		local Info = Instance.new("Frame")
		local UIGridLayout = Instance.new("UIGridLayout")
		local Folder = Instance.new("Folder")
		local TopBar = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")

		Info.Name = "Info"
		Info.Parent = OverlayContainer
		Info.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Info.BackgroundTransparency = 1
		Info.BorderColor3 = menuColor
		Info.BorderSizePixel = 0
		Info.Position = UDim2.new(0.840267479, 0, 0.0184049085, 0)
		Info.Size = UDim2.new(0, 200, 0, 19)

		UIGridLayout.Parent = Info
		UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout.CellPadding = UDim2.new(0, 4, 0, 0)
		UIGridLayout.CellSize = UDim2.new(0, 200, 0, 20)

		Folder.Parent = Info

		TopBar.Name = "TopBar"
		TopBar.Parent = Folder
		TopBar.BackgroundColor3 = menuColor
		TopBar.BorderSizePixel = 0
		TopBar.Position = UDim2.new(0, 0, 1.90734866e-07, 0)
		TopBar.Size = UDim2.new(0, 200, 0, 2)
		TopBar.ZIndex = 2

		UIListLayout.Parent = OverlayContainer
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		local InsideOverlay = {}
		function InsideOverlay:CreateLabel(text)
			local Main = Instance.new("Frame")
			local Label = Instance.new("TextLabel")

			Main.Name = "Main" .. text
			Main.Parent = Info
			Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Main.BackgroundTransparency = 0.400
			Main.BorderColor3 = menuColor
			Main.BorderSizePixel = 0
			Main.Size = UDim2.new(0, 200, 0, 21)

			Label.Name = "Label"
			Label.Parent = Main
			Label.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Label.BackgroundTransparency = 1.000
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 200, 0, 19)
			Label.Font = Enum.Font.SourceSans
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 14.000
			Label.Text = text
		end
		return InsideOverlay
	end

	local InsideLibrary = {}

	function InsideLibrary:CreateTab(text, size) --makes a tab
		size = size or 65 --original and customizable size if the text is to big

		print("UI Made by Jayy#6265")
		local TabButton = Instance.new("TextButton")
		local TabTopLine = Instance.new("Frame")

		local TabContainer = Instance.new("Frame")

		TabContainer.Name = "TabContainer" .. text
		TabContainer.Parent = MainTabFolder
		TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContainer.BackgroundTransparency = 1.000
		TabContainer.BorderSizePixel = 0
		TabContainer.Position = UDim2.new(0, 0, 0.193078324, 0)
		TabContainer.Size = UDim2.new(0, 106, 0, 443)
		TabContainer.Visible = false

		TabButton.Name = "TabButton" .. text
		TabButton.Parent = Tabs
		TabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BackgroundTransparency = 0.400
		TabButton.BorderSizePixel = 0
		TabButton.Position = UDim2.new(0.451420039, 0, 0, 0)
		TabButton.Size = UDim2.new(0, 65, 0, 23)
		TabButton.AutoButtonColor = false
		TabButton.Font = Enum.Font.GothamBlack
		TabButton.Text = text
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 14.000
		TabButton.TextStrokeColor3 = menuColor
		TabButton.AutomaticSize = Enum.AutomaticSize.X
		TabButton.ClipsDescendants = true

		TabTopLine.Name = "TabTopLine"
		TabTopLine.Parent = TabButton
		TabTopLine.BackgroundColor3 = menuColor
		TabTopLine.BorderSizePixel = 0
		TabTopLine.Size = UDim2.new(0, size, 0, 2)
		TabTopLine.BackgroundTransparency = 1
		--TabTopLine.AutomaticSize = Enum.AutomaticSize.X
		TabTopLine.ClipsDescendants = false

		local SectorFolder = Instance.new("Folder") --dont touch the folders unless you know what your doing

		SectorFolder.Name = "SectorFolder"
		SectorFolder.Parent = TabContainer

		local TabFolder = Instance.new("Folder")

		TabFolder.Name = "TabFolder"
		TabFolder.Parent = TabContainer

		TabButton.MouseButton1Click:Connect(function()
			for i, v in next, MainTabFolder:GetChildren() do
				v.Visible = false
			end

			for i, v in next, Tabs:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService
					:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextStrokeTransparency = 1,
					})
					:Play()

					game.TweenService
					:Create(v.TabTopLine, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundTransparency = 1,
					})
					:Play()
				end
			end

			game.TweenService
			:Create(TabTopLine, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundTransparency = 0,
			})
			:Play()

			game.TweenService
			:Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextStrokeTransparency = 0,
			})
			:Play()

			TabContainer.Visible = true
		end)

		local InsideTab = {}
		function InsideTab:CreateSection(text)
			local UIListLayout_4 = Instance.new("UIListLayout")
			local SectorTabButton = Instance.new("TextButton")
			local SectorTabTopLine = Instance.new("Frame")

			local SectionContainer = Instance.new("Frame")

			SectionContainer.Name = "SectionContainer" .. text
			SectionContainer.Parent = SectorFolder
			SectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionContainer.BackgroundTransparency = 1.000
			SectionContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
			SectionContainer.BorderSizePixel = 0
			SectionContainer.Position = UDim2.new(1.12560689, 0, -0.00105261535, 0)
			SectionContainer.Size = UDim2.new(0, 549, 0, 443)
			SectionContainer.Visible = false

			local UIListLayout_2 = Instance.new("UIListLayout")

			UIListLayout_2.Parent = SectionContainer
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

			UIListLayout_4.Parent = TabFolder
			UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

			SectorTabButton.Name = "SectorTabButton" .. text
			SectorTabButton.Parent = TabFolder
			SectorTabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			SectorTabButton.BackgroundTransparency = 0.400
			SectorTabButton.BorderSizePixel = 0
			SectorTabButton.Size = UDim2.new(0, 106, 0, 23)
			SectorTabButton.AutoButtonColor = false
			SectorTabButton.Font = Enum.Font.GothamBlack
			SectorTabButton.Text = text
			SectorTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectorTabButton.TextSize = 14.000
			SectorTabButton.TextStrokeColor3 = menuColor

			SectorTabTopLine.Name = "SectorTabTopLine"
			SectorTabTopLine.Parent = SectorTabButton
			SectorTabTopLine.BackgroundColor3 = menuColor
			SectorTabTopLine.BorderSizePixel = 0
			SectorTabTopLine.Size = UDim2.new(0, 3, 0, 23)
			SectorTabTopLine.BackgroundTransparency = 1

			SectorTabButton.MouseButton1Click:Connect(function()
				for i, v in next, SectorFolder:GetChildren() do
					v.Visible = false
				end

				SectionContainer.Visible = true

				for i, v in next, TabFolder:GetChildren() do
					if v:IsA("TextButton") then
						game.TweenService
						:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							TextStrokeTransparency = 1,
						})
						:Play()

						game.TweenService
						:Create(
							v.SectorTabTopLine,
							TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
							{
								BackgroundTransparency = 1,
							}
						)
						:Play()
					end
				end
				game.TweenService
				:Create(SectorTabTopLine, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					BackgroundTransparency = 0,
				})
				:Play()

				game.TweenService
				:Create(SectorTabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextStrokeTransparency = 0,
				})
				:Play()
			end)

			local InsideSection = {}
			function InsideSection:CreateButton(text, callback)
				text = text or "Button"
				callback = callback or function() end

				local Button = Instance.new("Frame")
				local Button_2 = Instance.new("TextButton")

				Button.Name = "Button" .. text
				Button.Parent = SectionContainer
				Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Button.BackgroundTransparency = 0.400
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(0, 549, 0, 40)

				Button_2.Name = "Button"
				Button_2.Parent = Button
				Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button_2.BackgroundTransparency = 1.000
				Button_2.BorderSizePixel = 0
				Button_2.Size = UDim2.new(0, 549, 0, 40)
				Button_2.Font = Enum.Font.GothamBold
				Button_2.Text = text
				Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button_2.TextSize = 14.000
				Button_2.TextStrokeColor3 = menuColor

				Button_2.MouseButton1Click:Connect(function()
					callback()

					game.TweenService
					:Create(Button_2, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextSize = 20.000,
					})
					:Play()
					wait(0.10)
					game.TweenService
					:Create(Button_2, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						TextSize = 14.000,
					})
					:Play()
				end)
			end

			function InsideSection:CreateLabel(text)
				text = text or "Button"

				local Button = Instance.new("Frame")
				local Button_2 = Instance.new("TextButton")

				Button.Name = "Label" .. text
				Button.Parent = SectionContainer
				Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Button.BackgroundTransparency = 0.400
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(0, 549, 0, 40)

				Button_2.Name = "Label"
				Button_2.Parent = Button
				Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button_2.BackgroundTransparency = 1.000
				Button_2.BorderSizePixel = 0
				Button_2.Size = UDim2.new(0, 549, 0, 40)
				Button_2.Font = Enum.Font.GothamBold
				Button_2.Text = text
				Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button_2.TextSize = 14.000
				Button_2.TextStrokeColor3 = menuColor
				Button_2.TextStrokeTransparency = 1
			end



			function InsideSection:CreateSlider(text, minvalue, maxvalue, callback)
				local slider_data = {}

				local Slider = Instance.new("Frame")
				local Back = Instance.new("TextButton")
				local Drag = Instance.new("Frame")
				local Value2 = Instance.new("TextLabel")
				local SliderText = Instance.new("TextLabel")

				minvalue = minvalue or 0
				maxvalue = maxvalue or 100



				callback = callback or function() end

				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
				local Value = minvalue

				SliderValue = minvalue



				Slider.Name = "Slider" .. text
				Slider.Parent = SectionContainer
				Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BackgroundTransparency = 0.400
				Slider.BorderSizePixel = 0
				Slider.Size = UDim2.new(0, 549, 0, 40)

				Back.Name = "Back"
				Back.Parent = Slider
				Back.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Back.BorderColor3 = menuColor
				Back.BorderSizePixel = 2
				Back.Position = UDim2.new(0.532000005, 0, 0.238000005, 0)
				Back.Size = UDim2.new(0, 237, 0, 20)
				Back.Font = Enum.Font.GothamBold
				Back.Text = ""
				Back.TextColor3 = Color3.fromRGB(255, 255, 255)
				Back.TextSize = 15.000

				Drag.Name = "Drag"
				Drag.Parent = Back
				Drag.BackgroundColor3 = menuColor
				Drag.BorderSizePixel = 0
				Drag.Size = UDim2.new(0, 237, 0, 20)

				Value2.Name = "Value"
				Value2.Parent = Back
				Value2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Value2.BackgroundTransparency = 1.000
				Value2.Position = UDim2.new(-0.000326406211, 0, -0.0500001907, 0)
				Value2.Size = UDim2.new(0, 238, 0, 20)
				Value2.Font = Enum.Font.GothamBold
				Value2.Text = Value
				Value2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Value2.TextSize = 15.000

				SliderText.Name = "SliderText"
				SliderText.Parent = Slider
				SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderText.BackgroundTransparency = 1.000
				SliderText.Position = UDim2.new(0.0199999642, 0, 0, 0)
				SliderText.Size = UDim2.new(0, 211, 0, 39)
				SliderText.Font = Enum.Font.GothamBold
				SliderText.Text = text
				SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderText.TextSize = 15.000
				SliderText.TextXAlignment = Enum.TextXAlignment.Left





				Back.MouseButton1Down:Connect(function()
					Value = math.floor(
						(((tonumber(maxvalue) - tonumber(minvalue)) / 237) * Drag.AbsoluteSize.X) + tonumber(minvalue)
					) or 0
					pcall(function()
						callback(Value)
					end)
					Drag.Size = UDim2.new(0, math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, 237), 0, 20)
					moveconnection = mouse.Move:Connect(function()
						Value2.Text = Value
						Value = math.floor(
							(((tonumber(maxvalue) - tonumber(minvalue)) / 237) * Drag.AbsoluteSize.X)
								+ tonumber(minvalue)
						)
						pcall(function()
							callback(Value)
						end)
						Drag.Size = UDim2.new(0, math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, 237), 0, 20)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor(
								(((tonumber(maxvalue) - tonumber(minvalue)) / 237) * Drag.AbsoluteSize.X)
									+ tonumber(minvalue)
							)
							pcall(function()
								callback(Value)
							end)
							Drag.Size = UDim2.new(0, math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, 237), 0, 20)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)

				function slider_data:Set(Number)
					Value = Number

					Drag.Size = UDim2.new(Number / maxvalue, 0, 1, 0)
					Value2.Text = Number
					callback(Number)
				end

				return slider_data
			end

			function InsideSection:CreateCheckbox(text, callback)
				local switch_data = {}

				local Checkbox = Instance.new("Frame")
				local Check = Instance.new("TextButton")
				local TextLabel = Instance.new("TextLabel")

				text = tostring(text or "New Switch")
				callback = typeof(callback) == "function" and callback or function() end

				Checkbox.Name = "Checkbox"
				Checkbox.Parent = SectionContainer
				Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Checkbox.BackgroundTransparency = 0.400
				Checkbox.BorderSizePixel = 0
				Checkbox.Size = UDim2.new(0, 549, 0, 40)

				Check.Name = "Check"
				Check.Parent = Checkbox
				Check.BackgroundColor3 = menuColor
				Check.BorderSizePixel = 0
				Check.Position = UDim2.new(0.928769886, 0, 0.306172937, 0)
				Check.Size = UDim2.new(0, 20, 0, 20)
				Check.Font = Enum.Font.GothamBold
				Check.Text = ""
				Check.TextColor3 = Color3.fromRGB(255, 255, 255)
				Check.TextSize = 15.000

				TextLabel.Parent = Checkbox
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0.0199999642, 0, -0.0250000004, 0)
				TextLabel.Size = UDim2.new(0, 211, 0, 40)
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.Text = text
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 15.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				local toggled = false
				Check.MouseButton1Click:Connect(function()
					toggled = not toggled
					callback(toggled)
					if toggled then
						game.TweenService
						:Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = menuColor,
						})
						:Play()
						--- We put our animation here when the toggle is on
					else
						game.TweenService
						:Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(21, 21, 21),
						})
						:Play()
						---We Put our animation here when the toggle is off
					end
					pcall(callback, toggled)
				end)

				function switch_data:Set(bool)
					toggled = (typeof(bool) == "boolean") and bool or false
					if toggled then
						game.TweenService
						:Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = menuColor,
						})
						:Play()
						--- We put our animation here when the toggle is on
					else
						game.TweenService
						:Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							BackgroundColor3 = Color3.fromRGB(21, 21, 21),
						})
						:Play()
						---We Put our animation here when the toggle is off
					end
					pcall(callback, toggled)
				end

				return switch_data, Check
			end

			function InsideSection:CreateDropdown(text, list, callback)
				local Dropdown = Instance.new("Frame")
				local DropdownToggle = Instance.new("TextButton")
				local DropdownText = Instance.new("TextLabel")
				local DropdownContainer = Instance.new("Frame")
				local UIListLayout_3 = Instance.new("UIListLayout")

				local IsDropped = false

				callback = callback or function() end
				list = list or {}
				text = text or ""

				Dropdown.Name = "Dropdown" .. text
				Dropdown.Parent = SectionContainer
				Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BackgroundTransparency = 0.400
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(0, 549, 0, 40)

				DropdownToggle.Name = "DropdownToggle"
				DropdownToggle.Parent = Dropdown
				DropdownToggle.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				DropdownToggle.BorderColor3 = menuColor
				DropdownToggle.BorderSizePixel = 2
				DropdownToggle.Position = UDim2.new(0.532000005, 0, 0.238000005, 0)
				DropdownToggle.Size = UDim2.new(0, 237, 0, 20)
				DropdownToggle.Font = Enum.Font.GothamBold
				DropdownToggle.Text = text
				DropdownToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownToggle.TextSize = 15.000

				DropdownText.Name = "DropdownText"
				DropdownText.Parent = Dropdown
				DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownText.BackgroundTransparency = 1.000
				DropdownText.Position = UDim2.new(0.0199999642, 0, 0, 0)
				DropdownText.Size = UDim2.new(0, 211, 0, 39)
				DropdownText.Font = Enum.Font.GothamBold
				DropdownText.Text = text
				DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownText.TextSize = 15.000
				DropdownText.TextXAlignment = Enum.TextXAlignment.Left

				DropdownContainer.Name = "DropdownContainer" .. text
				DropdownContainer.Parent = Dropdown
				DropdownContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				DropdownContainer.BackgroundTransparency = 1.000
				DropdownContainer.ClipsDescendants = true
				DropdownContainer.Position = UDim2.new(1, 0, 0.237999722, 0)
				DropdownContainer.Size = UDim2.new(0, 152, 0, 0)
				DropdownContainer.Visible = true

				UIListLayout_3.Parent = DropdownContainer
				UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

				DropdownToggle.MouseButton1Click:Connect(function()

					

					if IsDropped then
						IsDropped = false

						game.TweenService
						:Create(
							DropdownContainer,
							TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
							{
								Size = UDim2.new(0, 152, 0, 0),
							}
						)
						:Play()
					else
						IsDropped = true

						game.TweenService
						:Create(
							DropdownContainer,
							TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
							{
								Size = UDim2.new(0, 152, 0, 567),
							}
						)
						:Play()
					end
				end)
		
				for i, v in next, list do
					local DropdownButton = Instance.new("TextButton")
					DropdownButton.Name = "DropdownButton"
					DropdownButton.Parent = DropdownContainer
					DropdownButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					DropdownButton.BackgroundTransparency = 0.400
					DropdownButton.Size = UDim2.new(0, 152, 0, 29)
					DropdownButton.AutoButtonColor = false
					DropdownButton.Font = Enum.Font.GothamBold
					DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					DropdownButton.TextSize = 14.000
					DropdownButton.Text = v

					DropdownButton.MouseButton1Click:Connect(function()

						

						game.TweenService
						:Create(
							DropdownContainer,
							TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
							{
								Size = UDim2.new(0, 152, 0, 0),
							}
						)
						:Play()

						DropdownToggle.Text = "" .. v
						callback(v)
						IsDropped = false
					end)
				end

				
			end

			return InsideSection
		end
		return InsideTab
	end
	return InsideLibrary
end

local dwLocalPlayer = game.Players.LocalPlayer
local dwCamera = game.Workspace.CurrentCamera

local MainBase = Library:CreateMain("Title", "Small Title", Color3.new(0,0,255), Enum.KeyCode.F4) --Title, Bottom Title, Color, Toggle Key (Changeable)

local Tab1 = MainBase:CreateTab("Tab 1") -- Tab name, Tab frame size (the ghetto resize lol leave blank if the text isnt fucking huge)

local Tab2 = MainBase:CreateTab("TAB NUMBER 2", 120) -- demonstrating that the tab can be resized using autist methods

local t1Section = Tab1:CreateSection("Section 1") -- just text

t1Section:CreateButton("Destroy Base",function() --tbh idk if this works but you could write your own destroy function its not hard
	Library:DestroyMenu()
end)

local FOVSlider = t1Section:CreateSlider("Field of view",70, 120,function(t) -- Name, min number, max number (adding floats later cuz this version lowkey outdated but it works)
	dwCamera.FieldOfView = t
end)
FOVSlider:Set(70) -- sets the number (useful for people that want to implement configs aka the reason i added it)

local jumpToggle = t1Section:CreateCheckbox("Super Jump",function(t)
	print(t)
	if t == true then -- ik just use a function well fuck you im tired this is rushed
		dwLocalPlayer.Character.Humanoid.JumpPower = 100
	elseif t == false then
		dwLocalPlayer.Character.Humanoid.JumpPower = 50
	end 
end)
jumpToggle:Set(false)

t1Section:CreateDropdown("Dropdown", {"Jay","Is", "So", "Smart"},function(t) -- name, then the list of what you want to be in the dropdown
	print(t)
end)

t1Section:CreateLabel("no clue when i added this")
