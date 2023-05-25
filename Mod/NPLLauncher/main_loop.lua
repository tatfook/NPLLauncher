--[[
Title: Main loop file
Author(s):  
Date: 
Desc: run application with command line: bootstrapper="Mod/NPLLauncher/main_loop.lua"
use the lib:
------------------------------------------------------------
call "../../ParaEngineClient.exe" bootstrapper="Mod/NPLLauncher/main_loop.lua"
------------------------------------------------------------
]]
local main_state = nil;
NPL.load("./gui_helper.lua")

local function InitApp()
	local _this = ParaUI.CreateUIObject("container", "bg", "_fi", 0,0,0,0);
	_this.background = "Texture/whitedot.png";
	_guihelper.SetUIColor(_this, "0 0 0")
	_this:AttachToRoot();
	local _parent = _this;

	local width, height = 500, 64
	local _this = ParaUI.CreateUIObject("button", "my_button", "_ct", -width/2, -height/2 - 80, width, height);
	_this.font = "System;18;bold";
	_this.text = "Made with Paracraft";
	_this.background = "Texture/whitedot.png";
	_guihelper.SetUIColor(_this, "128 128 128")
	_guihelper.SetButtonTextColor(_this, "255 255 255")
	_parent:AddChild(_this);

	local _this = ParaUI.CreateUIObject("button", "progressText", "_ct", -width/2, -height/2, width, height);
	_this.font = "System;18;bold";
	_this.text = "正在加载：0%";
	_guihelper.SetButtonTextColor(_this, "255 255 255")
	_parent:AddChild(_this);
end

local function activate()
	if(main_state == nil) then
		InitApp();
		main_state = 1;
	else
		log("NPL Launcher App started\n");
	end
end

NPL.this(activate);