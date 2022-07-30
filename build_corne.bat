@echo off
pushd ..\zmk\app
west build -d build/left -b nice_nano_v2 -- -DSHIELD=corne_left || echo Error building Corne left && popd && exit /b
west build -d build/right -b nice_nano_v2 -- -DSHIELD=corne_right || echo Error building Corne right && popd && exit /b
popd
if not exist "output" mkdir output
copy ..\zmk\app\build\left\zephyr\zmk.uf2 output\left.uf2 || echo Error copying right firmware && exit /b
copy ..\zmk\app\build\right\zephyr\zmk.uf2 output\right.uf2 || echo Error copying left firmware && exit /b