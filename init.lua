-- Load configuration files that do not depend on plugins
require("config.options")
require("config.keymaps")

-- Load plugin manager
require("pluginmgr")

-- Load plugins
require("plugins")
-- Load keymaps dedicated to plugin actions
require("plugins.keymaps")

