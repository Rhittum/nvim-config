--[[ local jdtls = require("jdtls")
local root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew", "pom.xml", "build.gradle"})

local workspace_folder = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    cmd = { "jdtls" },  -- Let Mason handle path
    root_dir = root_dir,
    workspace_folder = workspace_folder,
}

jdtls.start_or_attach(config)
]]
