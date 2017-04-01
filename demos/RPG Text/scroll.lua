--This  is a library for scrolling text.

--[[
string.sub(s, i [, j])

s:sub(i [,j])

Return a substring of the string passed. The substring starts at i. If the third argument j is not given, the substring will end at the end of the string. If the third argument is given, the substring ends at and includes j.

> = string.sub("Hello Lua user", 7)      -- from character 7 until the end
Lua user
> = string.sub("Hello Lua user", 7, 9)   -- from character 7 until and including 9
Lua
> = string.sub("Hello Lua user", -8)     -- 8 from the end until the end
Lua user
> = string.sub("Hello Lua user", -8, 9)  -- 8 from the end until 9 from the start
Lua
> = string.sub("Hello Lua user", -8, -6) -- 8 from the end until 6 from the end
Lua
--]]

