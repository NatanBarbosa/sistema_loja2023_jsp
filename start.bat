@echo off

set PORJECT_NAME=sistema_loja2023

set SRC_PATH=src/%PORJECT_NAME%

if "%1"=="" (
    set TARGET_PATH=bin
) else (
    set TARGET_PATH=%1
)

rem Start Nodemon to watch for changes in the specified source directory
nodemon.cmd -e java -w %SRC_PATH% -x "./reload.bat %TARGET_PATH%"
