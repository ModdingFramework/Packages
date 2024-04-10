package("cheat-engine-plugin")
    set_homepage("https://github.com/ModdingFramework/CheatEnginePluginLibrary")
    set_description("C++ library for making Cheat Engine plugins")
    set_license("0BSD")

    add_urls("https://github.com/ModdingFramework/CheatEnginePluginLibrary/archive/$(version).zip",
             "https://github.com/ModdingFramework/CheatEnginePluginLibrary.git")

    add_configs("includes_lua", { description = "Include Cheat Engine Lua libraries", default = true, type = "boolean"})

    on_load(function(package)
        if package:config("includes_lua") then
            package:add("deps", "cheat-engine-sdk", { configs = { includes_lua = true }})
        else
            package:add("deps", "cheat-engine-sdk", { configs = { includes_lua = false }})
        end
    end)

    on_install(function(package)
        os.cp("Plugin Helper Library/include", package:installdir())
    end)
