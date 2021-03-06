#!/usr/bin/lua
require 'bamboo'
local redis = require 'bamboo.redis'

local DB_HOST = arg[1]
local DB_PORT = arg[2]
local WHICH_DB = arg[3]

db = redis.connect {host=DB_HOST, port=DB_PORT, which = WHICH_DB}
-- make model.lua work
BAMBOO_DB = db

-- add this project's initial register work to global evironment
setfenv(assert(loadfile('app/handler_entry.lua') or loadfile('../app/handler_entry.lua')), _G)()

print('Entering bamboo shell.... OK')
return true
