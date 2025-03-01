@echo off
setLocal

:menu

cls

if "%1"=="start" (
    call :start
    exit /b
)

if "%1"=="stop" (
    call :stop
    exit /b
)


echo ";;+-------------------------+;;"
echo ";;|   _____            __   |;;"
echo ";;|  / __(_)_ _  ___  / /__ |;;"
echo ";;| _\ \/ /  ' \/ _ \/ / -_)|;;"
echo ";;|/___/_/_/_/_/ .__/_/\__/ |;;"
echo ";;|   ___  ___/_/__  ______ |;;"
echo ";;|  / _ \/ _ | /  |/  / _ \|;;"
echo ";;| / // / __ |/ /|_/ / ___/|;;"
echo ";;|/____/_/ |_/_/  /_/_/    |;;"
echo ";;+-------------------------+;;"
echo -------------- MENU --------------
echo [1] Rebuild Docker server
echo [2] Stop Docker server
echo [3] Restart Docker server
echo ----------------------------------
echo [4] Access server shell
echo [5] Access MySQL shell
echo ----------------------------------
echo [6] Access phpMyAdmin
echo [7] Access PHP info
echo ----------------------------------
echo [8] Exit
echo +---------------------------------+

set /p choice="Select option: "
echo +---------------------------------+

if "%choice%"=="1" goto start
if "%choice%"=="2" goto stop
if "%choice%"=="3" goto restart
if "%choice%"=="4" goto shell
if "%choice%"=="5" goto mysql
if "%choice%"=="6" goto phpmyadmin
if "%choice%"=="7" goto phpinfo
if "%choice%"=="8" exit
if "%choice%"=="exit" exit


:start
echo ------------------------------
echo Starting Docker server...
echo ------------------------------
cd /d "%~dp0.."
cd ..
docker-compose -f docker-compose.yml up --build -d
echo [Docker server started successfully]
pause
goto menu

:stop
echo ------------------------------
echo Stopping Docker server...
echo ------------------------------
cd /d "%~dp0.."
cd ..
docker-compose -f docker-compose.yml down
echo [Docker server stopped]
pause
goto menu

:restart
echo ------------------------------
echo Restarting Docker server...
echo ------------------------------
cd /d "%~dp0.."
cd ..
docker-compose -f docker-compose.yml restart
echo [Docker server restarted]
pause
goto menu

:shell
echo +
echo ------------------------------
echo PHP Apache Environment Shell
echo ------------------------------
echo Type 'exit' to exit
echo +
docker exec -it simple-damp bash
pause
goto menu

:mysql
echo +
echo ------------------------------
echo MySQL Environment Shell
echo ------------------------------
echo Type 'exit' to exit
echo --- user [user] password [passwords] ----
docker exec -it simple-damp-db mysql -u user -p
pause
goto menu

:phpmyadmin
@echo off
start http://localhost:8081
pause
goto menu

:phpinfo
@echo off
start http://localhost:8080
pause
goto menu
