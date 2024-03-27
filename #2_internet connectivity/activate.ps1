$bAdmin = (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ( $bAdmin -eq $False ){
	Start-Process powershell -Verb runAs "-NoProfile -Command `"cd '$pwd'; & '$PSCommandPath';`""
}
foreach ( $i  in $(Get-NetAdapter | Select-Object -ExpandProperty Name)) { 
	netsh interface ipv4 set dnsservers "$i" static 0.0.0.0 primary > $null
	}
	
ipconfig /flushdns > $null

