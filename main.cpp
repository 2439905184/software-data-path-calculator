#include <windows.h>
#include <iostream>
#include <string>
int main()
{
    TCHAR username[256];
    DWORD size = 256;
    if(GetUserName(username, &size))
    {
        std::wcout<< L"Username: "<<username<<std::endl;
    }
    else{
        std::cerr<<"Error: "<<GetLastError()<<std::endl;
    }
    std::string user_name = std::string(username);
    std::cout<<"请输入软件/游戏名称..."<<std::endl;
    std::string name;
    std::getline(std::cin,name);

    std::cout << "请输入游戏引擎/厂商名称，如果未知请直接回车: ";
    std::string engine_or_factory;
    std::getline(std::cin, engine_or_factory);

    std::cout << "可能的路径包括:"<<std::endl;
    if(engine_or_factory == "")
    {
        
        std::cout << "C:/Users/" + user_name + "/AppData/Roaming/" + name << std::endl;
        std::cout << "C:/Users/" + user_name+ "/AppData/Local/" + name << std::endl;
    }
    else{
        std::cout << "C:/Users/" + user_name + "/AppData/Roaming/" + engine_or_factory + "/" + name << std::endl;
        std::cout << "C:/Users/" + user_name+ "/AppData/Local/" + engine_or_factory + "/" + name << std::endl;
        std::cout << "C:/ProgramData/" + engine_or_factory + "/" + name << std::endl;
        if(engine_or_factory == "minori")
        {
            std::cout << "C:/Users/" + user_name + "/Documents/minori/" + name << std::endl;
        }
        else if(engine_or_factory == "tyranobuilder")
        {
            std::cout << "C:/Users/" + user_name + "/AppData/Local/tyranoscript/Local Stotage" << std::endl;
            std::cout << "C:/Users/" + user_name + "/AppData/Roaming/tyranogame" << std::endl;
        }
        else if(engine_or_factory == "godot")
        {
            std::cout << "C:/Users/" + user_name + "/AppData/Roaming/Godot/app_userdata/" + name << std::endl;
        }
        else if(engine_or_factory == "unity")
        {
            std::cout << "请输入公司名字" << std::endl;
            std::string company;
            std::getline(std::cin, company);
            std::cout << "C:/Users/" + user_name + "/AppData/LocalLow/" + company + "/" + name << std::endl;
        }
    }
    return 0;
}