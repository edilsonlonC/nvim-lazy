local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local path_to_config = jdtls_path .. "/config_linux"
local path_to_plugins = jdtls_path .. "/plugins"
local path_to_jar = path_to_plugins .. "/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar"
local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" })
if root_dir == "" then
  return
end
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
local home = os.getenv("HOME")
local lombok_path = home .. "/.config/lombok/lombok.jar"
local java_agent = "-javaagent:" .. lombok_path

-- Needed for debugging
local bundles = {
  vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

local config = {
  cmd = {
    "/usr/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    java_agent, --add-modules=ALL-SYSTEM',
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    path_to_jar,
    "-configuration",
    path_to_config,
    "-data",
    workspace_dir,
  },

  root_dir = root_dir,

  settings = {
    java = {
      format = {
        settings = {},
      },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
        updateSnapshots = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk-amd64",
            default = true,
          },
        },
      },
    },
  },
  init_options = {
    bundles = bundles,
  },
}

config["on_attach"] = function(client, bufnr)
  require("jdtls").setup_dap({ hotcodereplace = "auto" })
  require("jdtls.dap").setup_dap_main_class_configs()
end
-- start server jdls
require("jdtls").start_or_attach(config)
