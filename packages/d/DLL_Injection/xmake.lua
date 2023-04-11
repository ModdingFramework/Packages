package("DLL_Injection")
    set_homepage("https://github.com/ModdingFramework/DLL_Injection.h")
    set_description("A header-only library for injecting DLLs (and injected DLLs).")
    add_urls("https://github.com/ModdingFramework/DLL_Injection.h.git")

    add_deps("Logging")

    on_install(function (package)
        os.cp("include", package:installdir())
    end)
