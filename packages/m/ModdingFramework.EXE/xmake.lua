package("ModdingFramework.EXE")
    set_homepage("https://github.com/ModdingFramework/modding_framework.exe")
    set_description("A header-only library for creating your own, branded modding framework for your game.")
    add_urls("https://github.com/ModdingFramework/modding_framework.exe.git")
    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("xmake/functions.lua", package:installdir("share"))
    end)
    on_load(function (package)
        local functions_script = path.join(package:installdir("share"), "functions.lua")
        if os.isfile(functions_script) then
            includes(functions_script)
        end
    end)
