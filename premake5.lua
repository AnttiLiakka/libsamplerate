

project "libsamplerate"
    kind "StaticLib"
    language "C"
    staticruntime "on"
    warnings "off"

    version = "0.2.2"

    targetdir ("%{wks.location}/Bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/Bin-Int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/samplerate.h",

        "src/common.h",
        "src/fastest_coeffs.h",
        "src/high_qual_coeffs.h",
        "src/mid_qual_coeffs.h",

        "src/samplerate.c",
        "src/src_linear.c",
        "src/src_sinc.c",
        "src/src_zoh.c"
    }

    includedirs
    {
        "include/",
    }

    defines
    {
       "ENABLE_SINC_FAST_CONVERTER",
       "ENABLE_SINC_MEDIUM_CONVERTER",
       "ENABLE_SINC_BEST_CONVERTER",
       "HAVE_STDBOOL_H",
       "VERSION=\"" .. version .. "\"",
       "PACKAGE=\"libsamplerate\""
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

    filter "configurations:Release"
		runtime "Release"
		optimize "on"