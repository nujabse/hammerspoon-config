hyper = {'ctrl', 'cmd'}

-- hs.hotkey.bind({"cmd"}, "L", hs.caffeinate.systemSleep)
-- hs.hotkey.bind({"alt","ctrl"},"T",hs.application.launch.launchOrFocus("Terminal"))

-- show front activated app infos
hs.hotkey.bind(
    hyper, ".",
    function()
        hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
                                    hs.window.focusedWindow():application():path(),
                                    hs.window.focusedWindow():application():name(),
                                    hs.keycodes.currentSourceID()))
    end)


function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- 快速打开Finder，微信，Chrome等等
hs.hotkey.bind({"alt"}, "A", open("Safari"))
hs.hotkey.bind({"alt"}, "E", open("Finder"))
hs.hotkey.bind({"alt"}, "W", open("WeChat"))
hs.hotkey.bind({"alt"}, "Q", open("QQ"))
hs.hotkey.bind({"alt"}, "G", open("Google Chrome"))
hs.hotkey.bind({"alt"}, "F", open("ForkLift"))
hs.hotkey.bind({"alt"}, "T", open("iTerm"))
-- hs.hotkey.bind({"alt"}, "O", open("Ovito"))
hs.hotkey.bind({"alt"}, "Y", open("Youtube Music"))
hs.hotkey.bind({"alt"}, "J", open("Jabref"))
hs.hotkey.bind({"alt"}, "S", open("Skim"))
-- hs.hotkey.bind({"alt"}, "U", open("Sublime Text"))
hs.hotkey.bind({"alt"}, "V", open("Visual Studio Code"))
hs.hotkey.bind({"alt", "command"}, "Z", open("Zotero"))
hs.hotkey.bind({"alt"}, "C", open("Sublime Text"))
hs.hotkey.bind({"alt"}, "L", open("LaTeXIT"))
hs.hotkey.bind({"alt"}, "B", open("Beyond Compare"))
hs.hotkey.bind({"alt"}, "I", open("IntelliJ IDEA"))
hs.hotkey.bind({"alt"},"return",open("Terminal"))
hs.hotkey.bind({"alt"},'1',open("Emacs.app"))
hs.hotkey.bind({"alt"},'2',open("Microsoft Word"))
hs.hotkey.bind({"alt"},"3",open("Microsoft Powerpoint"))
hs.hotkey.bind({"alt"},"4",open("Evernote"))
hs.hotkey.bind({"alt"},"5",open("Vesta"))
hs.hotkey.bind({"alt"},"D",open("Dash"))
hs.hotkey.bind({"alt"},"P",open("Highlights"))
-- hs.hotkey.bind({"alt"},"N",open("NeatDownloadManager"))
-- hs.hotkey.bind({"alt"},"T",open("Typora"))

