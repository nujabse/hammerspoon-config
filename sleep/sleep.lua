local bleDeviceID = '00-16-94-3c-8e-f7'

--开关wifi
function wifiSwitchOff()
  -- state: off, on
  hs.wifi.setPower(false)
  hs.notify.new({title="Hammerspoon", informativeText="Wi-Fi off"}):send()
end
function wifiSwitchOn()
  -- state: off, on
  hs.wifi.setPower(true)
  hs.notify.new({title="Hammerspoon", informativeText="Wi-Fi on"}):send()
end


function resetAudio()
  -- state: off, on
  cmd = "/usr/local/bin/hda-verb 0x19 SET_PIN_WIDGET_CONTROL 0x24"--..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end


--开关蓝牙
--requires blueutil package installed, can be installed via brew
function bluetoothSwitchOff(state)
  -- state: 0(off), 1(on)
  cmd = "/usr/local/bin/blueutil --power 0"--..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end
function bluetoothSwitchOn(state)
  -- state: 0(off), 1(on)
  cmd = "/usr/local/bin/blueutil --power 1"--..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end


--断开蓝牙连接
function disconnectBluetooth()
  cmd = "/usr/local/bin/blueutil --disconnect "..(bleDeviceID)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end
--连接蓝牙设备
function connectBluetooth()
  cmd = "/usr/local/bin/blueutil --connect "..(bleDeviceID)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

--解锁屏幕自动设定输入法为搜狗输入法
-- local function Chinese()
--     hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
-- end

--解锁屏幕自动设定输入法为百度输入法
-- local function Chinese()
   -- hs.keycodes.currentSourceID("com.baidu.inputmethod.BaiduIM.pinyin")
-- end


function caffeinateCallback(eventType)
    -- if (eventType == hs.caffeinate.watcher.screensDidLock) then

    -- else
    if (eventType == hs.caffeinate.watcher.screensDidUnlock) then
      wifiSwitchOn()
      bluetoothSwitchOn()
   --   Chinese()     
    end

    if (eventType == hs.caffeinate.watcher.systemWillSleep) then
        wifiSwitchOff()
        bluetoothSwitchOff()

   -- elseif (eventType == hs.caffeinate.watcher.systemDidWake) then

   --   bluetoothSwitchOn()
     -- resetAudio()
   --   wifiSwitchOn()
   --   resetAudio()
   --   Chinese() 
    end
end

--resetAudio()
--Chinese()
caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()
