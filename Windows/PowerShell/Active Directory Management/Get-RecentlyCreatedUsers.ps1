# Retrieves newly created users in the last month on an Active Directory domain.

$When = ((Get-Date).AddDays(-30)).Date
Get-ADUser -Filter {whenCreated -ge $When} -Properties Name, whenCreated | Sort-Object whenCreated | Select-Object -Property Name, whenCreated | Format-Table -AutoSize
Pause