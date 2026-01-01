project "assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"
    toolset "v145"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    warnings "Off"

    files
    {
        "include/**.h",
        "include/**.hpp",

        "code/**.h",
        "code/**.hpp",
        "code/**.cpp",

        "contrib/**.h",
        "contrib/**.hpp",
        "contrib/**.c",
        "contrib/**.cpp"
    }

    includedirs
    {
        "include",
        "code",
        "contrib",
        "contrib/rapidjson/include",
        "contrib/zlib",
        "contrib/unzip",
        "contrib/pugixml/src",
        "contrib/utf8cpp/source",
        "contrib/irrXML"
    }

    defines
    {
        "ASSIMP_BUILD_NO_EXPORT",
        "ASSIMP_BUILD_NO_IMPORTER",
        "ASSIMP_BUILD_NO_POSTPROCESS"
    }

    -- Enable only what you want
    removefiles
    {
        "code/AssetLib/IFC/**",
        "code/AssetLib/Collada/**"
    }

    filter "system:windows"
        systemversion "latest"
        defines
        {
            "_CRT_SECURE_NO_WARNINGS",
            "WIN32",
            "_WINDOWS"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "ASSIMP_DEBUG" }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
    
