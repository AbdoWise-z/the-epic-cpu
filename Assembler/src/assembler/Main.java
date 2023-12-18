package assembler;

import assembler.inst.nop;

import java.io.*;
import java.util.*;

public class Main {
    private static Log log = Log.getLog(Main.class);

    static {
        Instruction.init();
    }

    public static void exit(int code){
        System.exit(code);
    }

    private static List<Instruction> toCode(List<String> lines , Map<String,Integer> dataMapping){
        List<Instruction> instructions = new LinkedList<>(); // first we write the interrupt code
        int pos = 0;
        for (String line : lines){
            pos++;

            String[] parts = line.split("#");
            line = parts[0].trim();
            if (line.isEmpty()){
                continue;
            }

            try {
                instructions.add(Instruction.fromCode(line , dataMapping , pos));
            } catch (Instruction.UnknowIntructionException e) {
                log.e("Unknown Instruction : " + e.inst + " , at : " + pos);
                exit(4);
            } catch (Instruction.UnknowRegisterException e) {
                log.e("Unknown Register : " + e.reg + " , at : " + pos);
                exit(5);
            } catch (Instruction.ValueFormatException e) {
                log.e(" \"" + e.value + "\" is not a valid value , at : " + pos);
                exit(5);
            } catch (Exception e){
                e.printStackTrace();
                log.e("Unknown Error : " + line + " , at : " + pos);
                exit(8);
            }
        }

        return instructions;
    }

    /**
     * will use 4 'nops' as padding between the code and int
     * this doesn't have anything to do with the cpu btw
     * I just feel like 16 would be good heh
     * */
    private static final int CODE_INT_PADDING = 4;

    /**
     * the offset of the interrupt code and the start of the code memory
     * I use 8 cuz the cpu needs at least 5 cycles to reset
     * */
    private static final int INT_CODE_OFFSET  = 8;


    public static void main(String[] args){

        //read the code
        List<String> lines = new LinkedList<>();
        for (String s : args){
            lines.addAll(FileLoader.LoadFile(s));
        }

        if (lines.isEmpty()){
            log.e("Failed to read input files");
            exit(1);
        }

        //start assembling
        List<String> data    = new LinkedList<>();
        List<String> code    = new LinkedList<>();
        List<String> intCode = new LinkedList<>();

        int mode = 0; //none
        for (String s : lines){
            s = s.trim();
            if (s.equalsIgnoreCase(".code")){
                mode = 1;
                continue;
            }else if (s.equalsIgnoreCase(".data")){
                mode = 2;
                continue;
            }else if (s.equalsIgnoreCase(".int")){
                mode = 3;
                continue;
            }

            if (mode == 1){
                code.add(s);
            }else if (mode == 2){
                data.add(s);
            }else if (mode == 3){
                intCode.add(s);
            }
        }

        if (code.isEmpty()){
            log.e("Cannot build an empty code");
            exit(1);
        }

        if (data.isEmpty()){
            log.w("using empty data segment");
        }

        if (intCode.isEmpty()){
            log.w("didn't provide interrupt code, will use 'RTI' as the only code");
            intCode.add("RTI");
        }

        List<Instruction> intInstructions = toCode(intCode , new HashMap<>());

        int intOffset = INT_CODE_OFFSET;
        int codeOffset = Instruction.getCodeSize(intInstructions) + intOffset + CODE_INT_PADDING;

        Map<String,Integer> dataMapping = null;
        try {
            dataMapping = DataSegment.WriteDataSegment(data , "outputs/data.eds" , codeOffset ,  intOffset);
        } catch (FileNotFoundException e) {
            log.e("failed to open data segment file");
            exit(3);
        } catch (DataSegment.UnknownValueException e) {
            log.e("Unknown data segment value : " + e.getValue());
            exit(2);
        }

        List<Instruction> instructions = toCode(code, dataMapping);

        try {
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream("outputs/code.ecs")));

            for (int i = 0;i < INT_CODE_OFFSET;i++){
                new nop().write(writer);
            }

            for (Instruction i : intInstructions){
                i.write(writer);
            }

            for (int i = 0;i < CODE_INT_PADDING;i++){
                new nop().write(writer);
            }

            for (Instruction i : instructions){
                i.write(writer);
            }


            writer.flush();
            writer.close();
        } catch (FileNotFoundException e) {
            log.e("failed to open code segment file");
            exit(6);
        }

        log.i("compiled");
        exit(0);
    }
}
