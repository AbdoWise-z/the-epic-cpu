package assembler;

public class Util {
    private static Log log = Log.getLog(Util.class);
    public static String toBinary(int num,int size,int line){
        StringBuilder out = new StringBuilder();
        int abs = Math.abs(num);
        for (int i = size - 1; i >= 0; i--) {
            int bit = (num >> i) & 1;
            abs = abs >> 1;
            out.append(bit == 0 ? '0' : '1');
        }

        if (abs != 0){
            log.w("at line : " + line + " > Number is too large to fit size {" + size + "}");
        }
        return out.toString();
    }


    public static String toBinary(String num,int size, int line){
        num = num.trim();
        if (num.isEmpty()){
            return toBinary(0 , size , line);
        }

        if (num.startsWith("0x")){
            return toBinary(Integer.parseInt(num.substring(2) , 16) , size , line);
        }
        if (num.startsWith("0b")){
            return toBinary(Integer.parseInt(num.substring(2) , 2) , size , line);
        }

        if (num.startsWith("0d")){
            return toBinary(Integer.parseInt(num.substring(2) , 10) , size , line);
        }

        return toBinary(Integer.parseInt(num , 10) , size , line);
    }

    public static int toInteger(String num){
        num = num.trim();
        if (num.isEmpty()){
            return 0;
        }

        if (num.startsWith("0x")){
            return Integer.parseInt(num.substring(2) , 16);
        }
        if (num.startsWith("0b")){
            return Integer.parseInt(num.substring(2) , 2);
        }

        if (num.startsWith("0d")){
            return Integer.parseInt(num.substring(2) , 10);
        }

        return Integer.parseInt(num , 10);
    }

}
