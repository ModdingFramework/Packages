package("Memory")
    set_homepage("https://github.com/ModdingFramework/Memory.h")
    set_description("A header-only library for reading/writing memory.")
    add_urls("https://github.com/ModdingFramework/Memory.h.git")

    add_deps("Logging", "StringFormatting")

    on_install(function (package)
        os.cp("include", package:installdir())
    end)
