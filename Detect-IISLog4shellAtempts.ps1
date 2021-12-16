# Parse IIS logs for Log4Shell attempts
# Logs will be dumped to C:\temp\log4shellAttempts.txt
mkdir C:\temp
gci "C:\inetpub\logs\LogFiles\W3SVC1" -file -recurse | foreach {Get-Content $_.fullname | select-string -simplematch "jndi" | out-file C:\temp\log4shellAttempts.txt -append}
gci "C:\inetpub\logs\LogFiles\W3SVC1" -file -recurse | foreach {Get-Content $_.fullname | select-string -simplematch "lower" | out-file C:\temp\log4shellAttempts.txt -append}
gci "C:\inetpub\logs\LogFiles\W3SVC1" -file -recurse | foreach {Get-Content $_.fullname | select-string -simplematch '${$::' | out-file C:\temp\log4shellAttempts.txt -append}
& "C:\temp\log4shellAttempts.txt"
