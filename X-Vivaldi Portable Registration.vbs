'Registers Vivaldi Portable with Default Programs or Default Apps in Windows
'Link - https://www.winhelponline.com/blog/register-google-chrome-portable-with-default-apps-or-default-programs/

Option Explicit
Dim sAction, sAppPath, sAppPath2, objFile, oFSO, sbaseKey, sbaseKey2
Dim WshShell : Set WshShell = CreateObject("WScript.Shell") 
Dim oFS0 : Set oFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = oFSO.GetFile(WScript.ScriptFullName)
sAppPath = oFSO.GetParentFolderName(objFile)
sAppPath2 = oFSO.GetParentFolderName(objFile)
sAppPath = sAppPath & "\X-Vivaldi.exe"
sAppPath2 = sAppPath2 & "\webpageicons.dll"

If Not oFSO.FileExists (sAppPath) Then WScript.Quit
If InStr(" ", sAppPath) = 0 Then sAppPath = """" & sAppPath & """"

If WScript.Arguments.Count > 0 Then
   If UCase(Trim(WScript.Arguments(0))) = "-REG" Then Call RegisterVivaldiPortable(sAppPath)
   If UCase(Trim(WScript.Arguments(0))) = "-UNREG" Then Call UnregisterVivaldiPortable(sAppPath)
Else
   sAction = InputBox("Type REGISTER to add Vivaldi Portable to Default Apps. Type UNREGISTER to remove.", "Vivaldi Portable Registration", "REGISTER")
   If UCase(Trim(sAction)) = "REGISTER" Then Call RegisterVivaldiPortable(sAppPath)
   If UCase(Trim(sAction)) = "UNREGISTER" Then Call UnregisterVivaldiPortable(sAppPath)
End If

Sub RegisterVivaldiPortable(sAppPath)
   sbaseKey = "HKCU\Software\"
   sbaseKey2 = sbaseKey & "Clients\StartmenuInternet\X-Vivaldi\"
   
   WshShell.RegWrite sbaseKey & "RegisteredApplications\X-Vivaldi", "Software\Clients\StartMenuInternet\X-Vivaldi\Capabilities", "REG_SZ"
   
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\", "Vivaldi HTML Document", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\AppUserModelId", "Vivaldi Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\Application\AppUserModelId", "Vivaldi Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\Application\ApplicationIcon", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\Application\ApplicationName", "X-Vivaldi", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\Application\ApplicationDescription", "Access the internet", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\Application\ApplicationCompany", "Microsoft Corporation", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\DefaultIcon\", sAppPath2 & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiHTML2\shell\open\command\", sAppPath & " -- " & """" & "%1" & """", "REG_SZ"

   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\", "Vivaldi MHTML Document", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\AppUserModelId", "Vivaldi Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\Application\AppUserModelId", "Vivaldi Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\Application\ApplicationIcon", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\Application\ApplicationName", "X-Vivaldi", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\Application\ApplicationDescription", "Access the internet", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\Application\ApplicationCompany", "Microsoft Corporation", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\DefaultIcon\", sAppPath2 & ",1", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\VivaldiMHTML2\shell\open\command\", sAppPath & " -- " & """" & "%1" & """", "REG_SZ"
   
   WshShell.RegWrite sbaseKey2, "X-Vivaldi Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\ApplicationDescription", "X-Vivaldi Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\ApplicationIcon", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\ApplicationName", "X-Vivaldi Portable", "REG_SZ"   
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.htm", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.html", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.mht", "VivaldiMHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.mhtml", "VivaldiMHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.shtml", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.xht", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.xhtml", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.webp", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\ftp", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\http", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\https", "VivaldiHTML2", "REG_SZ"   
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\irc", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\mailto", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\mms", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\news", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\nntp", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\sms", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\smsto", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\tel", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\url", "VivaldiHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\webcal", "VivaldiHTML2", "REG_SZ"  
   WshShell.RegWrite sbaseKey2 & "DefaultIcon\", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "shell\open\command\", sAppPath, "REG_SZ"
   
   'Refresh icon cache
   WshShell.Run "ie4uinit.exe -show"
   'Launch Default Apps after registering Vivaldi Portable   
   WshShell.Run "control /name Microsoft.DefaultPrograms /page pageDefaultProgram"  
End Sub


Sub UnregisterVivaldiPortable(sAppPath)
   sbaseKey = "HKCU\Software\"
   sbaseKey2 = "HKCU\Software\Clients\StartmenuInternet\X-Vivaldi"   

   On Error Resume Next
   WshShell.RegDelete sbaseKey & "RegisteredApplications\X-Vivaldi"
   On Error GoTo 0
   
   WshShell.Run "reg.exe delete " & sbaseKey & "Classes\VivaldiHTML2" & " /f", 0
   WshShell.Run "reg.exe delete " & sbaseKey & "Classes\VivaldiMHTML2" & " /f", 0
   WshShell.Run "reg.exe delete " & chr(34) & sbaseKey2 & chr(34) & " /f", 0
   
   'Refresh icon cache
   WshShell.Run "ie4uinit.exe -show"
   'Launch Default Apps after unregistering Vivaldi Portable   
   WshShell.Run "control /name Microsoft.DefaultPrograms /page pageDefaultProgram"   
End Sub