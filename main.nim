import winim/lean
import strformat
const UNLEN = 256
proc getCurrentUserName(): string =
  var
    buffer: array[UNLEN + 1, char]  # 用户名缓冲区（UNLEN=256）
    bufferSize: DWORD = UNLEN + 1    # 缓冲区大小
  
  # 调用 WinAPI 获取用户名
  if GetUserNameA(addr buffer[0], addr bufferSize) != 0:
    #result = $buffer) # 转换为 Nim 字符串
    result = newString(cast[int](bufferSize-1))
    copyMem(addr result[0],addr buffer[0],cast[int](bufferSize-1))
  else:
    raise newException(OSError, "获取用户名失败: " & $GetLastError())
# 总感觉要分多个参数并重写代码 参数1：游戏/软件名称 参数2：游戏引擎 参数3：公司名称
var user_name = getCurrentUserName()
echo "请输入软件/游戏名称: "
var name = stdin.readLine()# appName
echo "请输入游戏引擎/厂商名称，如果未知请直接回车:"
# 引擎或者软件厂商的名字
var engine_or_factory = stdin.readLine()
echo "可能的路径包括"
#echo "C:/Users/" & user_name & "/AppData/Roaming/" & engine_or_factory & "/" & name
if engine_or_factory == "":
  echo fmt"C:/Users/{user_name}/AppData/Roaming/{name}"
  echo fmt"C:/Users/{user_name}/AppData/Local/{name}"
else:
  echo fmt"C:/Users/{user_name}/AppData/Roaming/{engine_or_factory}/{name}"
  echo fmt"C:/Users/{user_name}/AppData/Local/{engine_or_factory}/{name}"
  echo fmt"C:/ProgramData/{engine_or_factory}/{name}"
  if engine_or_factory == "minori":
    echo fmt"C:/Users/{user_name}/Documents/{engine_or_factory}/{name}"
  elif engine_or_factory == "tyranobuilder":
    echo fmt"C:/Users/{user_name}/AppData/Local/tyranoscript/Local Stotage"
    echo fmt"C:/Users/{user_name}/AppData/Roaming/tyranogame"
  elif engine_or_factory == "godot":
    echo fmt"C:/Users/{user_name}/AppData/Roaming/Godot/app_userdata/{name}"
  elif engine_or_factory == "unity":
    echo "请输入公司名字"
    var company = stdin.readLine()
    echo fmt"C:/Users/{user_name}/AppData/LocalLow/{company}/{name}"