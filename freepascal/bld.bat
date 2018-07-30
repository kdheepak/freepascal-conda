
if %PY3K% equ 1 (
  set BUILD_PYTHON="-DBUILD_PYTHON_INTERFACE=ON"
  set PYTHON_VERSION="%PY_VER%m"
) else (
  set BUILD_PYTHON="-DBUILD_PYTHON2_INTERFACE=ON"
  set PYTHON_VERSION="%PY_VER%"
)


wget ftp://ftp.freepascal.org/pub/fpc/dist/3.0.4/bootstrap/i386-win32-ppc386.zip
7z i386-win32-ppc386.zip >nul 2>&1

@echo on
set myroot=%LIBRARY_PREFIX%
set myFPC=%myroot%\fpc\3.0.4
set mybinutils=%myroot%\binutils
set PATH=%mybinutils%\i386-win32;%myFPC%\bin\i386-win32;%PATH%

dir /s /b /o:gn

rd /s /q  examples
make distclean all install INSTALL_PREFIX=%myFPC% PP=.\ppc386.exe DATA2INC=%myFPC%\utils\data2inc.exe
cd /d %myFPC%\bin\i386-win32
fpcmkcfg -d basepath=%myFPC% -o .\fpc.cfg
copy fpc.exe %mybinutils%\i386-win32
