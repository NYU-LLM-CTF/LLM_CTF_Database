cd BUILD_DIRECTORY && "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" && "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.37.32822\bin\Hostx64\x64\cl.exe" /c /EHsc /FA /GS- ..\src\main.cpp && python.exe ..\build_scripts\cleanup.py && "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.37.32822\bin\Hostx64\x64\ml64.exe" ..\build\main_out.asm /link /entry:entry && python.exe ..\build_scripts\extract.py