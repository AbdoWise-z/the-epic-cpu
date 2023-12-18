package assembler;

import assembler.inst.*;

import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

public abstract class Instruction {

    public static enum InstructionType {
        ONE_OPERAND, // one in one out
        TWO_OPERAND, // two in one out
        TWO_OPERAND_IMMEDIATE, // two in one out
        TWO_OPERAND_NO_OUTPUT,        // just swap (fk this instruction btw)
        IMMEDIATE_TYPE_1, // in instruction immediate
        IMMEDIATE_TYPE_2, // after instruction immediate
        IMMEDIATE_TYPE_EA, // EA
        NO_OPERANDS
    }

    private int opCode;
    private String name;
    private InstructionType type;
    private String dst;
    private String op1;
    private String op2;


    public Instruction(String name, int opCode, InstructionType type){
        this.name = name.toLowerCase();
        this.opCode = opCode;
        this.type = type;
    }

    private static <T> T copy(T i){
        try {
            return (T) i.getClass().getDeclaredConstructors()[0].newInstance();
        } catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

    private static final ArrayList<Instruction> _insts = new ArrayList<>();
    private static final HashMap<String, List<Instruction>> _mapping = new HashMap<>();
    private static void addInstruction(Instruction i){
        String name = i.name;
        List<Instruction> list = _mapping.get(name);
        if (list == null){
            list = new ArrayList<>();
        }
        list.add(i);
        _mapping.put(name, list);

        _insts.add(i);
    }

    public static void init(){
        addInstruction(new add());
        addInstruction(new addi());
        addInstruction(new and());
        addInstruction(new bitset());
        addInstruction(new call());
        addInstruction(new cmp());
        addInstruction(new dec());
        addInstruction(new free());
        addInstruction(new in());
        addInstruction(new inc());
        addInstruction(new jmp());
        addInstruction(new jz());
        addInstruction(new ldd());
        addInstruction(new ldm());
        addInstruction(new neg());
        addInstruction(new nop());
        addInstruction(new not());
        addInstruction(new or());
        addInstruction(new out());
        addInstruction(new pop());
        addInstruction(new protect());
        addInstruction(new push());
        addInstruction(new rcl());
        addInstruction(new rcr());
        addInstruction(new ret());
        addInstruction(new rti());
        addInstruction(new std());
        addInstruction(new sub());
        addInstruction(new swap());
        addInstruction(new xor());
        addInstruction(new hlt());

        Log.i("Instruction" , "Loaded: " + _insts.size() + " Instructions");
    }

    public static int getCodeSize(List<Instruction> instructions){
        int size = 0;
        for (Instruction i : instructions){
            switch (i.type){
                case ONE_OPERAND, IMMEDIATE_TYPE_1, TWO_OPERAND, TWO_OPERAND_NO_OUTPUT, NO_OPERANDS -> size += 1;
                case IMMEDIATE_TYPE_2, IMMEDIATE_TYPE_EA, TWO_OPERAND_IMMEDIATE -> size += 2;
            }
        }
        return size;
    }
    public static Instruction fromCode(String code, Map<String,Integer> dataSegment , int line)
            throws UnknowIntructionException, UnknowRegisterException , ValueFormatException {
        code = code.trim();
        int idx = code.indexOf(" ");
        if (idx == -1){
            //NO_OPERANDS or null
            List<Instruction> candidates = _mapping.get(code.toLowerCase());
            if (candidates == null){
                throw new UnknowIntructionException(code);
            }
            return copy(candidates.get(0));
        }
        //ONE_OPERAND, TWO_OPERAND, SWAP, IMMEDIATE_TYPE_1, IMMEDIATE_TYPE_2, IMMEDIATE_TYPE_EA
        String name = code.substring(0 , idx).trim();
        String operands = code.substring(idx + 1);
        List<Instruction> candidates = _mapping.get(name.toLowerCase());
        if (candidates == null){
            throw new UnknowIntructionException(name);
        }
        //try to match it with every one
        String[] OPs = operands.split(",");
        if (OPs.length > 3){
            throw new UnknowIntructionException(code);
        }

        if (OPs.length == 1){ //ONE_OPERAND
            String dst = OPs[0].trim();
            String dValue = _getRegValue(dst);
            if (dValue == null){
                throw new UnknowRegisterException(dst);
            }
            for (Instruction i : candidates) {
                if (i.type == InstructionType.ONE_OPERAND) {
                    //just take the first candidate
                    Instruction c = copy(i);
                    c.dst = dst;
                    return c;
                }
            }
            throw new UnknowIntructionException(code);
        }else if (OPs.length == 2){ //IMMEDIATE_TYPE_1, IMMEDIATE_TYPE_2, TWO_OPERAND_NO_OUTPUT, IMMEDIATE_TYPE_EA
            String dst = OPs[0].trim();
            String op  = OPs[1].trim();
            if (_getRegValue(dst) != null && _getRegValue(op) != null){
                //SWAP, CMP
                for (Instruction i : candidates) {
                    if (i.type == InstructionType.TWO_OPERAND_NO_OUTPUT) {
                        //just take the first candidate
                        Instruction c = copy(i);
                        c.op1 = dst;
                        c.op2 = op;
                        return c;
                    }
                }
                throw new UnknowIntructionException(code);
            }

            //IMMEDIATE_TYPE_1, IMMEDIATE_TYPE_2, IMMEDIATE_TYPE_EA
            if (_getRegValue(dst) == null){
                throw new UnknowIntructionException(code);
            }

            for (Instruction i : candidates) {
                if (i.type == InstructionType.IMMEDIATE_TYPE_1) { // BITSET ..
                    //just take the first candidate
                    Instruction c = copy(i);
                    c.dst = dst;
                    String str = "";
                    try {
                        str = Util.toBinary(op, 6 , line);
                    } catch (Exception e){
                        throw new ValueFormatException(op);
                    }
                    c.op1 = str;
                    return c;
                }

                if (i.type == InstructionType.IMMEDIATE_TYPE_2) { //LDM
                    //just take the first candidate
                    Instruction c = copy(i);
                    c.dst = dst;
                    String str = "";
                    try {
                        str = Util.toBinary(op, 16 , line);
                    } catch (Exception e){
                        throw new ValueFormatException(op);
                    }
                    c.op1 = str;
                    return c;
                }

                if (i.type == InstructionType.IMMEDIATE_TYPE_EA) { // LDD STO
                    //just take the first candidate
                    Instruction c = copy(i);
                    c.dst = dst;
                    Integer val = dataSegment.get(op);
                    String str = "";
                    if (val == null){
                        try {
                            str = Util.toBinary(op, 20 , line);
                        } catch (Exception e){
                            throw new ValueFormatException(op);
                        }
                    }else{
                        str = Util.toBinary(val , 20 , line);
                    }
                    c.op1 = str;
                    return c;
                }
            }
            throw new UnknowIntructionException(code);

        }else if (OPs.length == 3){ //TWO_OPERANDS , TWO_OPERANDS_IMMEDIATE
            String dst = OPs[0].trim();
            String op1 = OPs[1].trim();
            String op2 = OPs[2].trim();

            if (_getRegValue(dst) == null){
                throw new UnknowRegisterException(dst);
            }

            if (_getRegValue(op1) == null){
                throw new UnknowRegisterException(op1);
            }

            if (_getRegValue(op2) == null){// TWO_OPERANDS_IMMEDIATE
                for (Instruction i : candidates) {
                    if (i.type == InstructionType.TWO_OPERAND_IMMEDIATE) {
                        Instruction c = copy(i);
                        c.dst = dst;
                        c.op1 = op1;
                        String str = "";
                        try {
                            str = Util.toBinary(op2, 16 , line);
                        } catch (Exception e){
                            throw new ValueFormatException(op2);
                        }
                        c.op2 = str;
                        return c;
                    }
                }
            }else { // TWO_OPERANDS
                for (Instruction i : candidates) {
                    if (i.type == InstructionType.TWO_OPERAND) {
                        Instruction c = copy(i);
                        c.dst = dst;
                        c.op1 = op1;
                        c.op2 = op2;
                        return c;
                    }
                }
            }

            throw new UnknowIntructionException(code);
        }

        throw new UnknowIntructionException(code);
    }
    
    private static String _getRegValue(String reg){
        reg = reg.trim();
        if (reg.equalsIgnoreCase("r1")){
            return "000";
        }else if (reg.equalsIgnoreCase("r2")){
            return "001";
        }else if (reg.equalsIgnoreCase("r3")){
            return "010";
        }else if (reg.equalsIgnoreCase("r4")){
            return "011";
        }else if (reg.equalsIgnoreCase("r5")){
            return "100";
        }else if (reg.equalsIgnoreCase("r6")){
            return "101";
        }else if (reg.equalsIgnoreCase("r7")){
            return "110";
        }else if (reg.equalsIgnoreCase("r8")){
            return "111";
        }
        //log.w("Tried to get a reg value of a register that doesn't exist : " + reg);
        return null; //should never happen
    }

    private void _writeOneOperand(PrintWriter writer){
        //Rsrc1 = Rdst
        String code  = Util.toBinary(opCode , 5 , -1);
        String dst0  = _getRegValue(dst);
        String zeros = Util.toBinary(0 , 16 - 5 - 3 , -1); //just a filler zeros
        writer.println(code + dst0 + zeros);
    }

    private void _writeTwoOperand(PrintWriter writer){
        //Rsrc1 = Rdst
        String code  = Util.toBinary(opCode , 5 , -1);
        String dst0  = _getRegValue(dst);
        String reg1  = _getRegValue(op1);
        String reg2  = _getRegValue(op2);
        String zeros = Util.toBinary(0 , 16 - 5 - 3 * 3, -1); //just a filler zeros
        writer.println(code + dst0 + reg1 + reg2 + zeros);
    }

    private void _writeTwoOperandImmd(PrintWriter writer){
        //Rsrc1 = Rdst
        String code  = Util.toBinary(opCode , 5 , -1);
        String dst0  = _getRegValue(dst);
        String op10  = _getRegValue(op1);
        String zeros = Util.toBinary(0 , 16 - 5 - 3 * 2, -1); //just a filler zeros
        String immd  = op2;
        writer.println(code + dst0 + op10 + zeros);
        writer.println(immd);
    }

    private void _writeTwoOperandsNoOutput(PrintWriter writer){
        String code  = Util.toBinary(opCode , 5 , -1);
        String reg1  = _getRegValue(op1);
        String reg2  = _getRegValue(op2);
        String zeros = Util.toBinary(0 , 16 - 5 - 3 * 3, -1); //just a filler zeros
        writer.println(code + "000" + reg1 + reg2 + zeros);
    }

    private void _writeImmediateType1(PrintWriter writer){
        String code  = Util.toBinary(opCode , 5 , -1);
        String dst0  = _getRegValue(dst);
        String immd  = op1;
        String zeros = Util.toBinary(0 , 16 - 5 - 3 * 3, -1); //just a filler zeros
        writer.println(code + dst0 + immd + zeros);
    }

    private void _writeImmediateType2(PrintWriter writer){
        String code  = Util.toBinary(opCode , 5 , -1);
        String dst0  = _getRegValue(dst);
        String zeros = Util.toBinary(0 , 16 - 5 - 3, -1); //just a filler zeros
        String immd  = op1;
        writer.println(code + dst0 + zeros);
        writer.println(immd);
    }

    private void _writeImmediateTypeEA(PrintWriter writer){
        String code  = Util.toBinary(opCode , 5 , -1);
        String dst0  = _getRegValue(dst);
        String zeros = Util.toBinary(0 , 16 - 5 - 3 - 4, -1); //just a filler zeros
        String immd  = op1;
        writer.println(code + dst0 + zeros + immd.substring(0 , 4));
        writer.println(immd.substring(4));
    }

    private void _writeNoOperands(PrintWriter writer){
        String code  = Util.toBinary(opCode , 5 , -1);
        String zeros = Util.toBinary(0 , 16 - 5, -1); //just a filler zeros
        writer.println(code + zeros);
    }


    public void write(PrintWriter writer){
        switch (type){
            case ONE_OPERAND -> _writeOneOperand(writer);
            case TWO_OPERAND -> _writeTwoOperand(writer);
            case IMMEDIATE_TYPE_1 -> _writeImmediateType1(writer);
            case IMMEDIATE_TYPE_2 -> _writeImmediateType2(writer);
            case IMMEDIATE_TYPE_EA -> _writeImmediateTypeEA(writer);
            case TWO_OPERAND_IMMEDIATE -> _writeTwoOperandImmd(writer);
            case NO_OPERANDS -> _writeNoOperands(writer);
            case TWO_OPERAND_NO_OUTPUT -> _writeTwoOperandsNoOutput(writer);
            default -> throw new IllegalArgumentException("can't define instruction type");
        }
    }

    private static final Log log = Log.getLog(Instruction.class);

    static class UnknowIntructionException extends Exception{
        String inst;
        public UnknowIntructionException(String inst){
            this.inst = inst;
        }

        public String getInst() {
            return inst;
        }
    }

    static class UnknowRegisterException extends Exception{
        String reg;
        public UnknowRegisterException(String reg){
            this.reg = reg;
        }

        public String getReg() {
            return reg;
        }
    }

    static class ValueFormatException extends Exception{
        String value;
        public ValueFormatException(String value){
            this.value = value;
        }

        public String getReg() {
            return value;
        }
    }
}
