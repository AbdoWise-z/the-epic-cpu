package assembler;

import java.util.Calendar;
/**
 * A System.out Simple log .. with color supporting I't good in java Apps;
 * @author Abdo Mohamed (xAbdoMo)
 * @version 1.0
 * @since 1.0
 * */
public class Log {
    /** some ANSI background colors
     *
     * */
    public static final String ANSI_BLACK_BACKGROUND = "\u001B[40m";
    public static final String ANSI_RED_BACKGROUND = "\u001B[41m";
    public static final String ANSI_GREEN_BACKGROUND = "\u001B[42m";
    public static final String ANSI_YELLOW_BACKGROUND = "\u001B[43m";
    public static final String ANSI_BLUE_BACKGROUND = "\u001B[44m";
    public static final String ANSI_PURPLE_BACKGROUND = "\u001B[45m";
    public static final String ANSI_CYAN_BACKGROUND = "\u001B[46m";
    public static final String ANSI_WHITE_BACKGROUND = "\u001B[47m";

    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";


    /**
     * @hide
     * */
    private Log(){}


    public static Log getLog(Object obj){
        return getLog(obj.getClass().getSimpleName());
    }
    public static Log getLog(Class<?> obj){
        return getLog(obj.getSimpleName());
    }
    public static Log getLog( String name){
        Log l = new Log();
        l.name = name;
        return l;
    }

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void msg(String msg){
        if (!isEnabled()) return;

        Calendar cl = Calendar.getInstance();
        int h = cl.get(Calendar.HOUR);
        int m = cl.get(Calendar.MINUTE);
        int s = cl.get(Calendar.SECOND);
        int mil = cl.get(Calendar.MILLISECOND);
        if (Colored) System.out.println(ANSI_CYAN + "["+ h + ":" + m + ":" + s + "." + mil + "]" + "[" + name + "]" + ANSI_RESET + msg);
        else System.out.println("["+ h + ":" + m + ":" + s + "." + mil + "]" + "[" + name + "]" + msg);
    }
    public void i(String msg){
        if (Colored) msg(ANSI_GREEN +"[Info]" + msg + ANSI_RESET);
        else msg("[Info]" + msg );
    }
    public void e(String msg){
        if (Colored) msg(ANSI_RED + "[Error]" + msg + ANSI_RESET);
        else msg("[Error]" + msg);
    }
    public void w(String msg){
        if (Colored) msg(ANSI_YELLOW + "[Warn]" + msg + ANSI_RESET);
        else msg("[Warn]" + msg);
    }


    public static void msg(String name , String msg){
        Calendar cl = Calendar.getInstance();
        int h = cl.get(Calendar.HOUR);
        int m = cl.get(Calendar.MINUTE);
        int s = cl.get(Calendar.SECOND);
        int mil = cl.get(Calendar.MILLISECOND);
        System.out.println(ANSI_CYAN + "["+ h + ":" + m + ":" + s + "." + mil + "]" + "[" + name + "]" + ANSI_RESET + msg);
    }
    public static void i(String name , String msg){
        msg(name , ANSI_GREEN +"[Info]" + msg + ANSI_RESET);
    }
    public static void e(String name , String msg){
        msg(name , ANSI_RED + "[Error]" + msg + ANSI_RESET);
    }
    public static void w(String name , String msg){
        msg(name , ANSI_YELLOW + "[Warn]" + msg + ANSI_RESET);
    }

    private boolean Enabled = true;
    private boolean Colored = true;

    public boolean isEnabled() {
        return Enabled;
    }

    public void setEnabled(boolean enabled) {
        Enabled = enabled;
    }

    public boolean isColored() {
        return Colored;
    }

    public void setColored(boolean colored) {
        Colored = colored;
    }
}