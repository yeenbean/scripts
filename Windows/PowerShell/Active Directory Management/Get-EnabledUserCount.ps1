Get-ADUser -LDAPFilter '(!userAccountControl:1.2.840.113556.1.4.803:=2)' | measure | Format-Table -AutoSize
