--
--    lua.inside - eRuby-like templating engine for Lua
--    Copyright (c) 2015  zyxwvu Shi <imzyxwvu@icloud.com>
--
inside = require "inside"

if arg[1] then
	inputFile = assert(io.open(arg[1], "rb"))
	inputTemplate = inputFile:read "*a"
	inputFile:close()
	if arg[2] then
		outputFile = assert(io.open(arg[2], "wb"))
	else
		outputFile = io.stdout
	end
	outputCode = inside.generate(inputTemplate)
	outputFile:write(outputCode)
	outputFile:close()
else
	io.write[[
Usage: lua inside-compile.lua template.html [output.lua]
]]
end
