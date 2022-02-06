local activeScreen = require('ext.screen').activeScreen
local capitalize   = require('ext.utils').capitalize
local cycleWindows = require('ext.window').cycleWindows
local focusScreen  = require('ext.screen').focusScreen
local forceFocus   = require('ext.window').forceFocus

-- global config
config = {
  apps = {
    terms    = { 'iTerm2'                   },
    browsers = {}
  },

  wm = {
    defaultDisplayLayouts = {
      ['Color LCD']    = 'monocle',
      ['DELL C3422WE'] = 'main-center'
    },

    displayLayouts = {
      ['Color LCD']    = { 'monocle', 'main-right', 'side-by-side'     },
      ['DELL C3422WE'] = { 'main-center', 'main-right', 'side-by-side' }
    }
  },

  window = {
    highlightBorder = false,
    highlightMouse  = true,
    historyLimit    = 0
  },

  network = {
    home = 'BT-WWAHW5'
  },

  homebridge = {
    studioSpeakers = { aid = 10, iid = 11, name = "Studio Speakers" },
    studioLights   = { aid = 9,  iid = 11, name = "Studio Lights"   },
    tvLights       = { aid = 6,  iid = 11, name = "TV Lights"       }
  }
}

-- requires
bindings                    = require('bindings')
controlplane                = require('utils.controlplane')
watchables                  = require('utils.watchables')
watchers                    = require('utils.watchers')
wm                          = require('utils.wm')

-- no animations
hs.window.animationDuration = 0.0

-- hints
hs.hints.fontName           = 'Helvetica-Bold'
hs.hints.fontSize           = 22
hs.hints.hintChars          = { 'A', 'S', 'D', 'F', 'J', 'K', 'L', 'Q', 'W', 'E', 'R', 'Z', 'X', 'C' }
hs.hints.iconAlpha          = 1.0
hs.hints.showTitleThresh    = 0

-- controlplane
controlplane.enabled        = { 'autohome', 'automount' }

-- watchers
watchers.enabled            = { 'urlevent' }
watchers.urlPreference      = config.apps.browsers

-- bindings
bindings.enabled            = { 'ask-before-quit', 'block-hide', 'ctrl-esc', 'f-keys', 'focus', 'global', 'tiling', 'term-ctrl-i', 'grid' }
bindings.askBeforeQuitApps  = config.apps.browsers

hs.hotkey.bind({'alt', 'shift', 'ctrl'}, "/", function()
    wm.getLayout()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "D", function()
  wm.setLayout("tabbed-right")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "S", function()
  wm.setLayout("main-center")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "Q", function()
  wm.setLayout("monocle")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "A", function()
  wm.setLayout("main-left")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "G", function()
  wm.setLayout("main-right")
end)


-- start/stop modules
local modules               = { bindings, controlplane, watchables, watchers, wm }

hs.fnutils.each(modules, function(module)
  if module then module.start() end
end)

-- stop modules on shutdown
hs.shutdownCallback = function()
  hs.fnutils.each(modules, function(module)
    if module then module.stop() end
  end)
end

--- reload config on changes
-- hs.loadSpoon("ReloadConfiguration")
-- spoon.ReloadConfiguration:start()
