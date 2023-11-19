@echo off

set SRC_PATH=src/sistema_loja2023

if "%1"=="" (
    set TARGET_PATH=bin
) else (
    set TARGET_PATH=%1
)

@REM :compile
rem Delete all files in the target directory
del /q %TARGET_PATH%\*.class

rem Start Nodemon to watch for changes in the specified source directory
nodemon.cmd -e java -w %SRC_PATH% -x "for /r %SRC_PATH% %%G in (*.java) do javac --release 8 -cp %SRC_PATH% -d %TARGET_PATH% %%G"
