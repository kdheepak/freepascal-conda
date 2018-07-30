
if %PY3K% equ 1 (
  set BUILD_PYTHON="-DBUILD_PYTHON_INTERFACE=ON"
  set PYTHON_VERSION="%PY_VER%m"
) else (
  set BUILD_PYTHON="-DBUILD_PYTHON2_INTERFACE=ON"
  set PYTHON_VERSION="%PY_VER%"
)


wget --no-check-certificate https://downloads.sourceforge.net/project/freepascal/Win32/3.0.4/fpc-3.0.4.i386-win32.exe
fpc-3.0.4.i386-win32.exe /SUPPRESSMSGBOXES /SP- /DIR="%LIBRARY_PREFIX%" /SILENT
