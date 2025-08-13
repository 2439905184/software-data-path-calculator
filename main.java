import java.util.Scanner;
public class main
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        String user_name = System.getProperty("user.name");
        System.out.println("请输入软件/游戏名称");
        String name = sc.next();
        System.out.println("请输入游戏引擎/厂商名称，如果未知请直接回车:");
        String engine_or_factory = sc.next();
        System.out.println("可能的路径包括:");
        if(engine_or_factory.equals(""))
        {
            System.out.println("C:/Users/" + user_name + "/AppData/Roaming/" + name);
            System.out.println("C:/Users/" + user_name + "/AppData/Local/" + name);
        }
        else{
            System.out.println("C:/Users/" + user_name + "/AppData/Roaming/" + engine_or_factory + "/" + name);
            System.out.println("C:/Users/" + user_name + "/AppData/Local/"  + engine_or_factory + "/" + name);
            System.out.println("C:/ProgramData/" +engine_or_factory +"/" +name);
            if(engine_or_factory.equals("minori"))
            {
                System.out.println("C:/Users/" + user_name + "/Documents/" + engine_or_factory + "/"+name);
            }
            if(engine_or_factory.equals("tyranobuilder"))
            {
                System.out.println("C:/Users/" + user_name + "/AppData/Local/tyranoscript/Local Stotage");
                System.out.println("C:/Users/" + user_name + "/AppData/Roaming/tyranogame");
            }
        }
    }
}