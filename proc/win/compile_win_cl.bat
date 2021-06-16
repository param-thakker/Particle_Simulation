@echo off
rmdir /Q /S bin
mkdir bin
pushd bin

rem Name
set name=SandSim

rem Include directories 
set inc=/I ..\include /I ..\third_party\include\gunslinger\

rem Source files
set src_main=..\source\*.c ..\source\render_passes\*.c

rem All source together
set src_all=%src_main%

rem Library directories
set lib_d=/LIBPATH:"..\third_party\libs\win\"

rem OS Libraries
set os_libs= opengl32.lib kernel32.lib user32.lib ^
shell32.lib vcruntime.lib msvcrt.lib gdi32.lib

rem User Libraries
set libs=gunslinger.lib

rem Link options
set l_options=/EHsc /link /SUBSYSTEM:CONSOLE /NODEFAULTLIB:msvcrt.lib

rem Compile Release
cl /MP /FS /Ox /W1 /Fe%name%.exe %src_all% %inc% ^
/EHsc /link /SUBSYSTEM:CONSOLE /NODEFAULTLIB:msvcrt.lib /NODEFAULTLIB:LIBCMT ^
%lib_d% %libs% %os_libs%

rem Compile Debug
rem cl /w /MP -Zi /DEBUG:FULL /Fe%name%.exe %src_all% %inc% ^
rem /EHsc /link /SUBSYSTEM:CONSOLE /NODEFAULTLIB:msvcrt.lib /NODEFAULTLIB:LIBCMT ^
rem %lib_d% %libs% %os_libs%

popd
