package assembler;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileLoader {
    private static Log log = Log.getLog(FileLoader.class);

    public static List<String> LoadFile(String path){
        var code = new ArrayList<String>();
        try {
            var sr = new Scanner(new FileInputStream(path));
            while (sr.hasNextLine()){
                code.add(sr.nextLine().trim());
            }
            log.i("Loaded: " + path);
        }catch (Exception e){
            log.e("Cannot Open file : " + path);
        }
        return code;
    }
}
