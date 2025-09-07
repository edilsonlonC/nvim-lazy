-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local mason_registry = require("mason-registry")
local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
vim.notify(lombok_jar, 1)
