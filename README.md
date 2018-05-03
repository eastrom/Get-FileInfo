# Get-FileInfo
Gather information about fileshares/folders

    <#
    .SYNOPSIS
    File Inventory
    
    .DESCRIPTION
    File inventory on a Windows machine i.e. Fileserver
    
    .PARAMETER FolderPath
    The Folder you want to get information from

    .PARAMETER ExportToCsv
    If you want to Export the result to a CSV. Use with parameter CSVPath

    .PARAMETER CsvPath
    The path to the file you want to save, i.e c:\temp\info.csv. Use with ExportToCsv Parameter.
    
    .EXAMPLE
    
    Get-FileInfo -FolderPath 'C:\Temp'
    Get-FileInfo -FolderPath "C:\Temp" -ExportToCsv -CsvPath 'c:\csv\test.csv'
    
    .NOTES
    General notes
    Disclaimer, run this at your own risk, supported AS-IS
    
    #>
    

## Getting Started

These instructions will help you getting started. 

### Prerequisites

What things you need to install the software and how to install them

```
Powershell
```

### Installing

A step by step series of examples that tell you have to get a development env running

* Download the ps1 file

* locate the script in powershell

* dot source the function

```

PS C:\Users>cd "User\OneDrive\PowerShell\Inventory"

PS C:\Users\User\OneDrive\PowerShell\Inventory>. .\Get-FileInfo.ps1

PS C:\Users\User\OneDrive\PowerShell\Inventory>Get-FileInfo -FolderPath 'C:\Temp'

Or

PS C:\Users\User\OneDrive\PowerShell\Inventory>Get-FileInfo -FolderPath "C:\Temp" -ExportToCsv -CsvPath 'C:\csv\Folderinfo.csv'

```
Inventory of users homefolders
```

$Folders = Get-ChildItem -Path 'F:\FileShares\Users' -Directory 

Foreach($folder in $Folders){
Get-FileInfo -FolderPath $Folder.fullname -ExportToCsv -CsvPath C:\Temp\UserInventory\Allusers.csv
}

```
## Running the tests

Explain how to run the automated tests for this system

## Built With

* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/powershell-scripting?view=powershell-6) - Powershell is king




## Authors

* Eastrom


## License

This project is not licensed

## Acknowledgments

* Microsoft
* Mekberg

