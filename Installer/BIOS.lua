
local result, reason = ""

do
	local handle, chunk = component.proxy(component.list("internet")() or error("FATAL: Internet Card Required!")).request("https://raw.githubusercontent.com/Fleshlad/FleshOS-MineOS-Version/main/Installer/Main.lua")

	while true do
		chunk = handle.read(math.huge)
		
		if chunk then
			result = result .. chunk
		else
			break
		end
	end

	handle.close()
end

result, reason = load(result, "=installer")

if result then
	result, reason = xpcall(result, debug.traceback)

	if not result then
		error(reason)
	end
else
	error(reason)	
end
