function Get-FileInfo {

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
 

Param(
    [parameter(Mandatory=$true)]
    [String]
    $FolderPath,
    [parameter(Mandatory=$False)]
    [Switch]
    $ExportToCsv,
    [parameter(Mandatory=$False)]
    [String]
    $CsvPath
    )

    $UsersFolders = Get-ChildItem -Path $FolderPath -Recurse -Directory

$Inventorydata = foreach ($UF in $UsersFolders.Fullname) {

        $UsersFile = Get-ChildItem -Path $UF -File
            foreach ($File in $UsersFile) {

                [PSCustomObject]@{

                Path = $File.Fullname
                FileName = $File.Name
                Extension = $File.Extension
                LastWriteTime = $File.LastWriteTime
                LastAccessTime = $File.LastAccessTime
                FileSizeKB = $File.Length/1KB
                FileSizeMB = [math]::Round($File.Length/1MB)
                RootFolder = $FolderPath
                }

            }   

        }
        If($ExportToCsv -eq $true){
            $Inventorydata | Export-Csv -Path $CsvPath -Encoding UTF8 -NoTypeInformation
            "Info Added to $CsvPath from $FolderPath"
        }ELSE{
            $Inventorydata
        }

}