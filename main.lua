--- @since 25.2.26

local _get_hovered = ya.sync(function()
	local tab, _ = cx.active, {}
	return tab.current.hovered.name
end)

local function _trim(s)
	return s:gsub("%s+", "")
end

return {
	entry = function()
		-- Get clipboard content
		local clipStatus, err = Command("xclip")
			:arg("-o")
			:stdout(Command.PIPED)
			:output()

		-- Get checksum of hovered file
		local fileStatus, err = Command("sha256sum")
			:arg(_get_hovered())
			:stdout(Command.PIPED)
			:output()


		local s1 = _trim(clipStatus.stdout)
		local s2 = _trim(fileStatus.stdout)

		local result = {}

		-- Check file check sum vs clipboard check sum
		-- Equal - good
		-- Not equal - not good
		if s1 == s2 then
			result.content = "Check Sums are equal!"
			result.level = "info"
		else
			result.content = "Check Sums NOT are equal!"
			result.level = "error"
		end

		return ya.notify({
			title = "CheckSum",
			content = result.content .. string.format("\n%s\n%s", s1, s2),
			level = result.level,
			timeout = 3,
		})
	end,
}
