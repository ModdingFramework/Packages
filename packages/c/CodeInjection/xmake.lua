package("CodeInjection")
    set_homepage("https://github.com/ModdingFramework/CodeInjection.h")
    set_description("A header-only library for performing memory code injections.")
    add_urls("https://github.com/ModdingFramework/CodeInjection.h.git")

    add_deps("Memory", "Assembly", "Logging", "StringFormatting", "uint128_t")

    on_install(function (package)
        os.cp("include", package:installdir())
    end)
