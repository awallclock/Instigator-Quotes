local addonName, gatrQuotes = ...

quoteChannel = "SAY"





function quoteOut()
local out = gatrQuotes.quote[math.random(1, #gatrQuotes.quote) ] 
--print(out)
SendChatMessage(out, quoteChannel)
--print("It ran")

end


commands = {
	["yell"] = function(...)
		quoteChannel = "YELL"
		quoteOut()
		end,
	["y"] = function(...)
		quoteChannel = "YELL"
		quoteOut()
		end,
	["ra"] = function(...)
		quoteChannel = "RAID"
		quoteOut()
		end,
	["raid"] = function(...)
		quoteChannel = "RAID"
		quoteOut()
		end,
	["raidwarning"] = function(...)
		quoteChannel = "RAIDWARNING"
		quoteOut()
		end,
	["rw"] = function(...)
		quoteChannel = "RAIDWARNING"
		quoteOut()
		end,
	["party"] = function(...)
		quoteChannel = "PARTY"
		quoteOut()
		end,
	["p"] = function(...)
		quoteChannel = "PARTY"
		quoteOut()
		end,
	["say"] = function(...)
		quoteChannel = "SAY"
		quoteOut()
		end,
	["s"] = function(...)
		quoteChannel = "SAY"
		quoteOut()
		end,
}
local function quoteCommands(str)

	if (#str == 0) then
		quoteOut()
		end

		local args = {};
	for _, arg in ipairs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end
	
	local path = commands; -- required for updating found table.
	
	for id, arg in ipairs(args) do
		if (#arg > 0) then -- if string length is greater than 0.
			arg = arg:lower();			
			if (path[arg]) then
				if (type(path[arg]) == "function") then				
					-- all remaining args passed to our function!
					path[arg](select(id + 1, unpack(args))); 
					return;					
				elseif (type(path[arg]) == "table") then				
					path = path[arg]; -- another sub-table found!
				end
			else
				-- does not exist!
				
				return;
			end
		end
	end
end


SLASH_INSTIGATORQUOTES1, SLASH_INSTIGATORQUOTES2 = '/gator', '/gatr', '/GATOR', '/GATR'
SlashCmdList.INSTIGATORQUOTES = quoteCommands


