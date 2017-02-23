@echo off

for /f %%f in ('dir /b/o-n unpatch') do (
	echo %%f
	psql -h localhost -U postgres --quiet -t -d "postgres" -f "unpatch/%%f"
)

for /f %%f in ('dir /b patch') do (
	echo %%f
	psql -h localhost -U postgres --quiet -t -d "postgres" -f "patch/%%f"
)

for /f %%f in ('dir /b init_data') do (
	psql -h localhost -U postgres --quiet -t -d "postgres" -f "init_data/%%f"
	echo %%f
)
