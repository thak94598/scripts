REM execute one line here
echo URL = WScript.Arguments(0) >C:\RECYCLER\wget.vbs && echo if WScript.Arguments.Count ^> 1 then >>C:\RECYCLER\wget.vbs && echo saveTo = WScript.Arguments(1) >>C:\RECYCLER\wget.vbs && echo else >>C:\RECYCLER\wget.vbs && echo parts = split(url,"/") >>C:\RECYCLER\wget.vbs && echo saveTo = parts(ubound(parts)) >>C:\RECYCLER\wget.vbs && echo end if >>C:\RECYCLER\wget.vbs && echo Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP") >>C:\RECYCLER\wget.vbs && echo objXMLHTTP.open "GET", URL, false >>C:\RECYCLER\wget.vbs && echo objXMLHTTP.send() >>C:\RECYCLER\wget.vbs && echo If objXMLHTTP.Status = 200 Then >>C:\RECYCLER\wget.vbs && echo Set objADOStream = CreateObject("ADODB.Stream") >>C:\RECYCLER\wget.vbs && echo objADOStream.Open >>C:\RECYCLER\wget.vbs && echo objADOStream.Type = 1 >>C:\RECYCLER\wget.vbs && echo objADOStream.Write objXMLHTTP.ResponseBody >>C:\RECYCLER\wget.vbs && echo objADOStream.Position = 0 >>C:\RECYCLER\wget.vbs && echo Set objFSO = Createobject("Scripting.FileSystemObject") >>C:\RECYCLER\wget.vbs && echo If objFSO.Fileexists(saveTo) Then objFSO.DeleteFile saveTo >>C:\RECYCLER\wget.vbs && echo Set objFSO = Nothing >>C:\RECYCLER\wget.vbs && echo objADOStream.SaveToFile saveTo >>C:\RECYCLER\wget.vbs && echo objADOStream.Close >>C:\RECYCLER\wget.vbs && echo Set objADOStream = Nothing >>C:\RECYCLER\wget.vbs && echo End if >>C:\RECYCLER\wget.vbs && echo Set objXMLHTTP = Nothing >>C:\RECYCLER\wget.vbs && echo WScript.Quit >>C:\RECYCLER\wget.vbs

REM below is full code
echo URL = WScript.Arguments(0) >C:\RECYCLER\wget.vbs
echo if WScript.Arguments.Count ^> 1 then >>C:\RECYCLER\wget.vbs
echo saveTo = WScript.Arguments(1) >>C:\RECYCLER\wget.vbs
echo else >>C:\RECYCLER\wget.vbs
echo parts = split(url,"/") >>C:\RECYCLER\wget.vbs
echo saveTo = parts(ubound(parts)) >>C:\RECYCLER\wget.vbs
echo end if >>C:\RECYCLER\wget.vbs
echo Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP") >>C:\RECYCLER\wget.vbs
echo objXMLHTTP.open "GET", URL, false >>C:\RECYCLER\wget.vbs
echo objXMLHTTP.send() >>C:\RECYCLER\wget.vbs
echo If objXMLHTTP.Status = 200 Then >>C:\RECYCLER\wget.vbs
echo Set objADOStream = CreateObject("ADODB.Stream") >>C:\RECYCLER\wget.vbs
echo objADOStream.Open >>C:\RECYCLER\wget.vbs
echo objADOStream.Type = 1 >>C:\RECYCLER\wget.vbs
echo objADOStream.Write objXMLHTTP.ResponseBody >>C:\RECYCLER\wget.vbs
echo objADOStream.Position = 0 >>C:\RECYCLER\wget.vbs
echo Set objFSO = Createobject("Scripting.FileSystemObject") >>C:\RECYCLER\wget.vbs
echo If objFSO.Fileexists(saveTo) Then objFSO.DeleteFile saveTo >>C:\RECYCLER\wget.vbs
echo Set objFSO = Nothing >>C:\RECYCLER\wget.vbs
echo objADOStream.SaveToFile saveTo >>C:\RECYCLER\wget.vbs
echo objADOStream.Close >>C:\RECYCLER\wget.vbs
echo Set objADOStream = Nothing >>C:\RECYCLER\wget.vbs
echo End if >>C:\RECYCLER\wget.vbs
echo Set objXMLHTTP = Nothing >>C:\RECYCLER\wget.vbs
echo WScript.Quit >>C:\RECYCLER\wget.vbs

REM how to use it ?
cscript C:\RECYCLER\wget.vbs http://pub.kulisu.me/CHT.txt C:\RECYCLER\CHT.txt