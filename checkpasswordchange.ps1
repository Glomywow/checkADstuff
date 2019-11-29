Add-Type -assembly System.Windows.Forms


$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='проверка пароля'
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

$user = $textboxint.Text
 $searcher=New-Object DirectoryServices.DirectorySearcher
 $searcher.Filter="(&(samaccountname=$user))"
 $results=$searcher.findone()
 $changedtime  = [datetime]::fromfiletime($results.properties.pwdlastset[0])
 $labelbox.Text = "$changedtime"
 write-host -b blue -f red Пользователь, $user В последний раз поменял пароль в $changedtime

}

$main_form.ShowDialog()
