@echo off

for /f %%f in ('dir /b/o-n unpatch') do (
echo %%f
)

for /f %%f in ('dir /b patch') do (
echo %%f
)

for /f %%f in ('dir /b init_data') do (
echo %%f
)
