require "hs.application"
--local hotkey = require "hs.hotkey"
hyper = {'ctrl', 'option'}
windowHotKey = {'ctrl', 'shift'}
local window = require "hs.window"



--当前窗口全屏
hs.hotkey.bind(hyper,"o", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-- 当前窗口 2分屏 宽度1/2 左分屏
hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)



-- 当前窗口 2分屏 宽度1/2 右分屏
hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind(hyper, "up", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w 
    f.h = max.h/2
    win:setFrame(f)
end)



-- 当前窗口 2分屏 宽度1/2 右分屏
hs.hotkey.bind(hyper, "down", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y+max.h/2
    f.w = max.w
    f.h = max.h/2
    win:setFrame(f)
end)

-- 当前窗口 4分屏 宽度1/2 高度1/2 左上分屏
hs.hotkey.bind(hyper,"h", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 当前窗口 4分屏 宽度1/2 高度1/2 左下分屏
hs.hotkey.bind(hyper,"n", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + max.h/2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-- 当前窗口 4分屏 宽度1/2 高度1/2 右上分屏
hs.hotkey.bind(hyper,"j", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y 
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


hs.hotkey.bind(hyper,"m", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y + max.h/2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

  -- move windows between two windows, credit to
  -- https://github.com/forecho/hammerspoon-config/blob/master/modules/window.lua
hs.hotkey.bind(windowHotKey, 'right', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)

hs.hotkey.bind(windowHotKey, 'left', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)
