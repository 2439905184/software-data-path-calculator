import os
user_name = os.getlogin()
name = input("请输入软件/游戏名称: ")
engine_or_factory = input("请输入游戏引擎/厂商名称，如果未知请直接回车:")
print("可能的路径包括:")
if engine_or_factory == "":
    print(f"C:/Users/{user_name}/AppData/Roaming/{name}")
    print(f"C:/Users/{user_name}/AppData/Local/{name}")
else:
    print(f"C:/Users/{user_name}/AppData/Roaming/{engine_or_factory}/{name}")
    print(f"C:/Users/{user_name}/AppData/Local/{engine_or_factory}/{name}")
    print(f"C:/ProgramData/{engine_or_factory}/{name}")
    if engine_or_factory == "minori":
        print(f"C:/Users/{user_name}/Documents/{engine_or_factory}/{name}")
    if engine_or_factory == "tyranobuilder":
        print(f"C:/Users/{user_name}/AppData/Local/tyranoscript/Local Stotage")
        print(f"C:/Users/{user_name}/AppData/Roaming/tyranogame")
    