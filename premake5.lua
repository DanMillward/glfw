project "GLFW"
	language "C"
	staticruntime "Off"
	kind "StaticLib"
	configurations { "Debug", "Shipping" }

	targetdir ("Binaries/" .. BinaryDirectory .. "/%{prj.name}")
	objdir ("Intermediate/" .. BinaryDirectory .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/context.c",
		"src/glfw_config.h",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Shipping"
		runtime "Release"
		optimize "On"

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/wgl_context.c",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}