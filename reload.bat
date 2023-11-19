@echo off

set SRC_PATH=src/

if "%1"=="" (
    set TARGET_PATH=bin
) else (
    set TARGET_PATH=%1
)

@REM :compile
rem Delete all files in the target directory
echo [ Reloading ] Cleaning files ... 
del /s %TARGET_PATH%\*.class

echo [ Reloading ] Re-compiling java files, target directory:  %TARGET_PATH% ... 
echo [ Reloading ] src directory:   [  %SRC_PATH%  ]
echo [ Reloading ] target directory:[  %TARGET_PATH% ]
rem Start Nodemon to watch for changes in the specified source directory
for /r %SRC_PATH% %%G in (*.java) do javac --release 8 -cp %SRC_PATH% -d %TARGET_PATH%/../ %%G
echo [ Reloading ] Compilation completed ... 
echo [ Reloading ] Restarting Apache tomcat7 ... 

@echo off

:: Stop the Apache Tomcat 7 service
net stop Tomcat7

:: Start the Apache Tomcat 7 service
net start Tomcat7

:: Pause to keep the console window open (optional)
@REM pause
echo [ Reloading ] Apache tomcat is UP ... 
