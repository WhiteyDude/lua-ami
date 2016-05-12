package = "lua-ami"
version = "1.0-3"
source = {
   url = "https://github.com/WhiteyDude/lua-ami/archive/v1.0-3.zip",
   dir = "lua-ami-1.0-3"
}
description = {
   summary = "LUA Asterisk AMI interface",
   detailed = [[
Not written by me, just packaged
   ]],
   homepage = "http://github.com/WhiteyDude/lua-ami",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.1",
   "md5",
   "uuid"
}
build = {
   type = "builtin",
   modules = {
      ami = "src/ami.lua",
      ["ami.connection"] = "src/ami/connection.lua",
      ["ami.utils"] = "src/ami/utils.lua",
      ["ami.login"] = "src/ami/login.lua"
   }
}
