# UNIX equivalents in Windows

## Windows Powershell
+	UNIX is an entire ecosystem self-tuned around text files. 
+	As such, text processing tools are effectively management tools. 
+	Windows is a completely different ecosystem self-tuned around APIs and Objects. That's why Microsoft invented PowerShell.  
+	We can compare PowerShell to Cygwin and Perl and bash  
+	PowerShell is a shell, as it makes no syntactic difference between built-in commands, commandlets, user functions, and external commands (.exe, .bat, .cmd).   


## List of commands
### Get help about any term: <i>man </i>
`Get-Help <search-term>`  
### List all commands: 
`Get-Command`

### Print text from a file <i>cat </i>
`Get-content FILE`
gc FILE

### Top 10 lines <i> head</i>  
`gc log.txt | select -first 10`   
`gc -TotalCount 10 log.txt`     
`Get-Content -head 2`  

### Last 10 lines <i> tail</i>  
`gc log.txt | select -last 10` 
`gc -Tail 10 log.txt`           
`Get-Content -Tail 2`

### Search string in a file <i>grep </i>  
`Select-String -match `  

### Sorting file <i>sort </i> 
`Sort-Object `
### Unique lines <i>uniq </i>   
`Select-Object -Unique`  
`Get-Unique`  
		
### <i>cut -f 1 | head</i>
`gc .\7-specific-changes.genes.txt | %{$_.Split("`t")[0]} | select -first 10`

### Word counts <i>wc </i>
gc FILE | Measure-Object –Word 
### 
### Line counts <i>wc -l </i>
`gc FILE | Measure-Object –Line` 
### The number of characters
`Get-Content C:\fso\a.txt | Measure-Object -Character`


file = Get-Item  

cat = Get-Content  
find . -name \*.xyz -exec rm {} \;  


Get-Item  
$(Get-Item C:\SampleDirectory).lastaccesstime  
Get-Service  
Get-Process  
Start-Process, Stop-Process  
remove-item  




 
 
# References 

https://blogs.technet.microsoft.com/heyscriptingguy/2015/06/11/table-of-basic-powershell-commands/
