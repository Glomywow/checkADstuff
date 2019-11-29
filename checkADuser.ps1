Add-Type -assembly System.Windows.Forms


$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='проверка блокировки'
$main_form.Width = 500
$main_form.Height = 300
$main_form.AutoSize = $true

$button = New-Object System.Windows.Forms.Button
$button.Text = 'кнопка'
$button.Location = New-Object System.Drawing.Point(160,10)
$main_form.Controls.Add($button)

$TextBoxint = New-Object System.Windows.Forms.TextBox
$TextBoxint.Location  = New-Object System.Drawing.Point(160,40)
$TextBoxint.Text = 'login'
$main_form.Controls.Add($TextBoxint)

$Labelbox = New-Object System.Windows.Forms.Label
$Labelbox.Location  = New-Object System.Drawing.Point(160,70)
$Labelbox.Text = '123'
$main_form.Controls.Add($Labelbox)

$button.add_click{

$user = $TextBoxint.Text
$Userinfo = Get-ADUser -Filter * -Properties Lockedout | ? { $_.SAMAccountName -like "*$user*" } | Select-Object SamAccountName,DistinguishedName, LockedOut 
$lockstatus = $Userinfo.lockedout


if ($lockstatus -like "False") {


#Get-Service -ComputerName qlikview -Name qlikviewserver
#$a =Get-Service -ComputerName qlikview -Name qlikviewwebserver
#$a.Stop()
$Labelbox.Text ="Аккаунт заблокирован"
#Unlock-ADAccount $Userinfo.SamAccountName


}

Else {

$Labelbox.Text ="Аккаунт не заблокирован"

}

}

$main_form.ShowDialog()
