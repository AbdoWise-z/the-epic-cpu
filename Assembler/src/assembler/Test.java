package assembler;

public class Test {
    private static Log log = Log.getLog(Test.class);
    public static void main(String[] args) {
        log.i(Util.toBinary(-2 , 5 , -1));
    }
}
