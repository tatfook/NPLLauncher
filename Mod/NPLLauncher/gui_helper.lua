
--[[ 
Title: GUI helper functions for ParaEngine
Author(s): LiXizhi, WangTian
Date: 2005/10
desc: To enable helper call:
------------------------------------------------------
------------------------------------------------------
]]

if(_guihelper==nil) then _guihelper={} end

local function getcolor(color)
	if(color and string.find(color, "#")~=nil) then
		color = string.gsub(string.gsub(color, "#", ""), "(%x%x)", function (h)
			return tonumber(h, 16).." "
		end);
	end
	return color;
end

--[[
Set all texture layers of an UI object to the specifed color
if UIobject is nil or is an invalid UI object, this function does nothing.
e.g. _guihelper.SetUIColor(uiobject, "255 0 0"); or _guihelper.SetUIColor(uiobject, "255 0 0 128");
]]
function _guihelper.SetUIColor(uiobject, color)
	if(uiobject~=nil and uiobject:IsValid())then
		color = getcolor(color);
		uiobject:SetCurrentState("highlight");
		uiobject.color=color;		
		uiobject:SetCurrentState("pressed");
		uiobject.color=color;	
		uiobject:SetCurrentState("disabled");
		uiobject.color=color;
		uiobject:SetCurrentState("normal");
		uiobject.color=color;	
	end
end

-- set the text font color of a UI control.
-- @param color: it can be "255 255 255", "#FFFFFF", "255 255 255 100", alpha is supported. 
-- @param color_highlight: nil or the highlighted color
function _guihelper.SetButtonFontColor(uiobject, color, color_highlight)
	if(uiobject~=nil and uiobject:IsValid())then
		color = getcolor(color);
		color_highlight = getcolor(color_highlight);
		uiobject:SetCurrentState("highlight");
        uiobject:GetFont("text").color = color_highlight or color;
        uiobject:SetCurrentState("disabled");
        uiobject:GetFont("text").color = color;
		uiobject:SetCurrentState("pressed");
        uiobject:GetFont("text").color = color;
		uiobject:SetCurrentState("normal");
        uiobject:GetFont("text").color = color;
	end
end

-- set the text font color of a UI control.
-- @param color: it can be "255 255 255", "#FFFFFF", "255 255 255 100", alpha is supported. 
function _guihelper.SetButtonTextColor(uiobject, color)
	if(uiobject~=nil and uiobject:IsValid())then
		color = getcolor(color);
		uiobject:SetCurrentState("highlight");
        uiobject:GetFont("text").color = color;
        uiobject:SetCurrentState("pressed");
		uiobject:GetFont("text").color=color;
        uiobject:SetCurrentState("normal");
        uiobject:GetFont("text").color = color;
        uiobject:SetCurrentState("disabled");
        uiobject:GetFont("text").color = color;
	end
end
