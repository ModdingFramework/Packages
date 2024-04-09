package("cheat-engine-sdk")
    set_homepage("https://github.com/ModdingFramework/CheatEnginePluginLibrary")
    set_description("C++ library for making Cheat Engine plugins")
    set_license("0BSD")

    add_urls("https://github.com/ModdingFramework/CheatEnginePluginLibrary/archive/$(version).zip",
             "https://github.com/ModdingFramework/CheatEnginePluginLibrary.git")

    add_configs("includes_lua", { description = "Include Cheat Engine Lua libraries", default = true, type = "boolean"})

    on_load(function(package)
        if package:config("includes_lua") then
            package:add("defines", "CHEATENGINE_USE_LUA=1", { public = true })
            package:add("linkdirs", "lib", { public = true })
            local architecture = get_config("arch") or "x64"
            package:add("links", "lua53-" .. architecture, { public = true })
        end
    end)

    on_install(function(package)
        os.cp("Official Cheat Engine Plugin SDK/Main Plugin SDK/include", package:installdir())
        if package:config("includes_lua") then
            os.cp("Official Cheat Engine Plugin SDK/Lua Support/include", package:installdir())
            os.cp("Official Cheat Engine Plugin SDK/Lua Support/lib", package:installdir())
        end
    end)