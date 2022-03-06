@echo off
title - Random Image Downloader By @daddyparodz (https://github.com/daddyparodz) -
cls
:menu
cls
echo - Random Image Downloader By @daddyparodz (https://github.com/daddyparodz) -
echo.
echo PLEASE NOTE THAT THIS SCRIPT DOES NOT VALIDATE USER INPUT. IF YOU ENTER A WRONG PARAMETER, IT WILL NOT STOP.
echo.

echo 1 - Unsplash
echo 2 - Lorem Picsum

echo.
set /p input="Source? "

if %input%==1 goto 1
if %input%==2 goto 2
IF %input%=="" goto menu

echo.
echo Please select a valid source!
timeout /t 1 /nobreak >nul
goto :menu

REM START OF UNSPLASH

:1
cls
echo - Unsplash Downloader - 
echo.
set /p nImages="How many images do you want to download? "
set nImages=%nImages%
echo.
set /p imageFolder="Where do you want to save the images? [NO SPACES] "
set imageFolder=%imageFolder%
if not exist %imageFolder% mkdir %imageFolder%
cd %imageFolder%
echo.
echo available resolutions: 
echo 2160 = 4k
echo 1440 = 2k
echo 1080 = 1080p
echo 720 = 720p
echo 480 = 480p
echo 360 = 360p
echo 240 = 240p
echo 144 = 144p
echo.
set /p resolution="Type only the vertical resolution of the images you want to download (do not write "p"): "
echo.
if %resolution%==2160 set resolution=4096x2160
if %resolution%==4k set resolution=4096x2160
if %resolution%==1440 set resolution=2560x1440
if %resolution%==2k set resolution=2560x1440
if %resolution%==1080 set resolution=1920x1080
if %resolution%==720 set resolution=1280x720
if %resolution%==480 set resolution=640x480
if %resolution%==360 set resolution=640x360
if %resolution%==240 set resolution=320x240
if %resolution%==144 set resolution=160x144

set /p input="Enable Fast Mode? (WARNING: Possible Duplicates!) (y/n) "
if %input%==y goto unsplash-fast
if %input%==yes goto unsplash-fast
if %input%==n goto unsplash-normal
if %input%==no goto unsplash-normal

:unsplash-fast
echo.
setlocal EnableDelayedExpansion
for /l %%i in (1,1,%nImages%) do (
wget -N "https://source.unsplash.com/random/%resolution%" --quiet --show-progress -O !random!-!random!-!random!.jpg
)
)
endlocal
echo.
echo Download Complete.
cd ..
goto end

:unsplash-normal
echo.
setlocal EnableDelayedExpansion
for /l %%i in (1,1,%nImages%) do (
wget -N "https://source.unsplash.com/random/%resolution%" --quiet --show-progress -O !random!-!random!-!random!.jpg  --wait 0.5
)
)
endlocal
echo.
echo Download Complete.
cd ..
goto end

REM START OF LOREM PICSUM

:2
cls
echo - Lorem Picsum Downloader - 
echo.
set /p nImages="How many images do you want to download? "
set nImages=%nImages%
echo.
set /p imageFolder="Where do you want to save the images? [NO SPACES]"
set imageFolder=%imageFolder%
if not exist %imageFolder% mkdir %imageFolder%
cd %imageFolder%
echo.
echo available resolutions: 
echo 2160 = 4k
echo 1440 = 2k
echo 1080 = 1080p
echo 720 = 720p
echo 480 = 480p
echo 360 = 360p
echo 240 = 240p
echo 144 = 144p
echo.
set /p resolution="Type only the vertical resolution of the images you want to download (do not write "p"): "
echo.
if %resolution%==2160 set resolution=4096/2160
if %resolution%==4k set resolution=4096/2160
if %resolution%==1440 set resolution=2560/1440
if %resolution%==2k set resolution=2560/1440
if %resolution%==1080 set resolution=1920/1080
if %resolution%==720 set resolution=1280/720
if %resolution%==480 set resolution=640/480
if %resolution%==360 set resolution=640/360
if %resolution%==240 set resolution=320/240
if %resolution%==144 set resolution=160/144

set /p input="Enable Fast Mode? (WARNING: Possible Duplicates!) (y/n) "
if %input%==y goto lorempicsum-fast
if %input%==yes goto lorempicsum-fast
if %input%==n goto lorempicsum-normal
if %input%==no goto lorempicsum-normal


:lorempicsum-fast
echo.
setlocal EnableDelayedExpansion
for /l %%i in (1,1,%nImages%) do (
wget -N "https://picsum.photos/%resolution%" --quiet --show-progress -O !random!-!random!-!random!.jpg
)
)
endlocal
cd ..
echo.
echo Download Complete.
goto end

:lorempicsum-normal
echo.
setlocal EnableDelayedExpansion
for /l %%i in (1,1,%nImages%) do (
wget -N "https://picsum.photos/%resolution%" --quiet --show-progress -O !random!-!random!-!random!.jpg --wait 0.5
)
)
endlocal
cd ..
echo.
echo Download Complete.
goto end

:end
echo.
set /p again="Again? (y/n) "
if %again%==y goto menu
if %again%==n exit