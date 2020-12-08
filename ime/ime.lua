local function Chinese()
    hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Rime")
end

local function English()
    -- ABC
    hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

-- app to expected ime config
-- app和对应的输入法
local app2Ime = {
    {'/Applications/QQ.app', 'Chinese'},
    {'/Applications/WeChat.app', 'Chinese'},
    {'/Applications/Evernote.app', 'Chinese'},
    {'/Applications/NeteaseMusic.app', 'Chinese'},
    {'/Applications/iTerm.app', 'English'},
    {'/usr/local/Cellar/emacs-mac/emacs-27.1-mac-8.1/Emacs.app', 'English'},
    {'/System/Applications/Utilities/Terminal.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/Xcode.app', 'English'},
    {'/Applications/Google Chrome.app', 'Chinese'},
    {'/System/Library/CoreServices/Finder.app', 'Chinese'},
    {'/Applications/Kindle.app', 'English'},
    {'/Applications/System Preferences.app', 'English'},
    {'/Applications/DingTalk.app', 'Chinese'},
}

function updateFocusAppInputMethod()
    local ime = 'Chinese'
    local focusAppPath = hs.window.frontmostWindow():application():path()
    for index, app in pairs(app2Ime) do
        local appPath = app[1]
        local expectedIme = app[2]

        if focusAppPath == appPath then
            ime = expectedIme
            break
        end
    end

    if ime == 'English' then
        English()
    else
        Chinese()
    end
end

-- helper hotkey to figure out the app path and name of current focused window
-- 当选中某窗口按下ctrl+command+.时会显示应用的路径等信息
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        "
    ..hs.window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..hs.window.focusedWindow():application():name()
    .."\n"
    .."IM source id:  "
    ..hs.keycodes.currentSourceID())
end)

-- Handle cursor focus and application's screen manage.
-- 窗口激活时自动切换输入法
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        updateFocusAppInputMethod()
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
