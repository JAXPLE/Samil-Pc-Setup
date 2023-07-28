start C:\Windows\SysWOW64
start D:\0_setup\autoInstaller\OCX\copy
D:
cd "D:\0_setup\OCX\RegisterOCX"
for %%F in (C* M* P* Z*) do (
    echo %%F
	copy "%%F" "D:\0_setup\autoInstaller\OCX\copy"
)
exit