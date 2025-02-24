@echo off
:menu
cls
echo "+-------------------------+";
echo "|   _____            __   |";
echo "|  / __(_)_ _  ___  / /__ |";
echo "| _\ \/ /  ' \/ _ \/ / -_)|";
echo "|/___/_/_/_/_/ .__/_/\__/ |";
echo "|   ___  ___/_/__  ______ |";
echo "|  / _ \/ _ | /  |/  / _ \|";
echo "| / // / __ |/ /|_/ / ___/|";
echo "|/____/_/ |_/_/  /_/_/    |";
echo "+-------------------------+";
echo 1. Start server
echo 2. Stop server
echo 3. Restart server
echo 4. Access server terminal
echo 5. Access MySQL terminal
echo 6. Access phpMyAdmin
echo 7. Access PHP info
echo 8. Exit
echo ==================================
set /p choice="Select option: "

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
cd /d "%~dp0.."
docker-compose -f docker-compose.yml up -d
pause
goto menu

:stop
cd /d "%~dp0.."
docker-compose -f docker-compose.yml down
pause
goto menu

:restart
cd /d "%~dp0.."
docker-compose -f docker-compose.yml restart
pause
goto menu

:shell
echo ""
echo ===========================
echo PHP Apache Environment Shell
echo ===========================
echo Type 'exit' to exit
echo ""
docker exec -it php-apache bash
pause
goto menu

:mysql
echo ""
echo ======================
echo MySQL Environment Shell
echo =======================
echo Type 'exit' to exit
echo ""
docker exec -it mysql mysql -u root -p
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


:phpinfo
@echo off
start http://localhost:8080
pause
goto menu
