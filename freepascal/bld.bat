
if %PY3K% equ 1 (
  set BUILD_PYTHON="-DBUILD_PYTHON_INTERFACE=ON"
  set PYTHON_VERSION="%PY_VER%m"
) else (
  set BUILD_PYTHON="-DBUILD_PYTHON2_INTERFACE=ON"
  set PYTHON_VERSION="%PY_VER%"
)


wget --no-check-certificate https://downloads.sourceforge.net/project/freepascal/Windows/3.0.2/fpc-3.0.2.i386-win32.exe

dir

@echo on
set myroot=c:\freepascal

mkdir %myroot%\binutils\i386-win32\
copy fpc-3.0.2.i386-win32.exe %myroot%\binutils\i386-win32\ppc386.exe

wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/ar.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/as.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/cmp.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/cp.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/cpp.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/diff.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/dlltool.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/fp32.ico
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/gcc.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/gdate.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/gdb.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/gecho.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/ginstall.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/ginstall.exe.manifest
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/gmkdir.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/grep.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/ld.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/libexpat-1.dll
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/make.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/mv.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/nm.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/objcopy.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/objdump.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/patch.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/patch.exe.manifest
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/pwd.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/rm.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/strip.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/unzip.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/windres.exe
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/windres.h
wget https://svn.freepascal.org/svn/fpcbuild/branches/fixes_3_0/install/binw32/zip.exe

set myFPC=%myroot%\fpc\3.0.4
set mybinutils=%myroot%\binutils
set PATH=%cd%;%mybinutils%\i386-win32;%myFPC%\bin\i386-win32;%PATH%

dir

rd /s /q  examples
make distclean all install INSTALL_PREFIX=%myFPC% PP=%mybinutils%\i386-win32\ppc386.exe DATA2INC=%myFPC%\utils\data2inc.exe
cd /d %myFPC%\bin\i386-win32
fpcmkcfg -d basepath=%myFPC% -o .\fpc.cfg
copy fpc.exe %mybinutils%\i386-win32
