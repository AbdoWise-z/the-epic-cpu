package assembler;

import javax.xml.crypto.Data;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataSegment {
    private static final Log log = Log.getLog(DataSegment.class);

    static class UnknownValueException extends Exception{
        String value;
        public UnknownValueException(String v){
            this.value = v;
        }

        public String getValue() {
            return value;
        }
    }


    public static Map<String,Integer> WriteDataSegment(List<String> lines , String outPath , int codeOffset , int intOffset) throws FileNotFoundException, UnknownValueException {
        int pos = 4; //first 4 bytes are taken for the code / interrupt addresses
        PrintWriter writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream(outPath)));
        // first write the PC positions for code / interrupt addresses
        String codeAddr = Util.toBinary(codeOffset , 32 , -1);
        String intAddr  = Util.toBinary(intOffset  , 32 , -1);
        writer.println(codeAddr.substring(0 , 16));
        writer.println(codeAddr.substring(16));
        writer.println(intAddr.substring(0 , 16));
        writer.println(intAddr.substring(16));


        Map<String,Integer> mapping = new HashMap<>();
        int i = 0;
        for (String line : lines){
            i++;

            String[] parts = line.split("#");
            line = parts[0].trim();
            if (line.isEmpty()){
                continue;
            }

            pos += 2;

            String[] sp = line.split(" ");
            String value = null;
            String label = null;

            if (sp.length == 1){
                //just a value
                value = sp[0];
            }else if (sp.length == 2){
                value = sp[1];
                label = sp[0];
            }else {
                log.w("Cannot process data segment line : " + line + "  , at : " + i );
                continue;
            }

            Integer val = null;
            try{
                val = Integer.parseInt(value);
                String w = Util.toBinary(val , 32 , i - 1);
                writer.println(w.substring(0 , 16));
                writer.println(w.substring(16));
            }catch (Exception e){
                throw new UnknownValueException(sp[0]);
            }

            if (label != null)
                mapping.put(label , pos - 2);

        }

        writer.flush();
        writer.close();

        return mapping;
    }
}
