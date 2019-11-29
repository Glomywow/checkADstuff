$user = "qwerty"
 $searcher=New-Object DirectoryServices.DirectorySearcher
 $searcher.Filter="(&(samaccountname=$user))"
 $results=$searcher.findone()
 $changedtime  = [datetime]::fromfiletime($results.properties.pwdlastset[0])
 write-host -b blue -f red Пользователь, $user В последний раз поменял пароль в $changedtime
