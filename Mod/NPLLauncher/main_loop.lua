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
	local width, height = 500, 400
	local _this = ParaUI.CreateUIObject("button", "my_button", "_ct", -width/2, -height/2, width, height);
	_this.text = "HelloWorld from NPL Launcher";
	_this.background = "Texture/whitedot.png";
	_guihelper.SetUIColor(_this, "255 0 0")
	_guihelper.SetButtonTextColor(_this, "255 255 255")

	_this:AttachToRoot();
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