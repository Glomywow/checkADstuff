$user = Read-Host "Впиши имя"
$Userinfo = Get-ADUser -Filter * -Properties Lockedout | ? { $_.SAMAccountName -like "*$user*" } | Select-Object SamAccountName,DistinguishedName, LockedOut 
$lockstatus = $Userinfo.lockedout


write-host $lockstatus

if ($lockstatus -like "False") {

Write-Host -f red "Аккаунт заблокирован"
Write-Host""
Write-Host""
Write-Host -f Cyan "Разблокирую аккаунт"
#Unlock-ADAccount $Userinfo.SamAccountName


}

Else {

Write-Host -f Green "Аккаунт не заблокирован"

}
