package assembler.inst;

import assembler.Instruction;

public class ldd extends Instruction {
    public ldd() {
        super("ldd", 20, InstructionType.IMMEDIATE_TYPE_EA);
    }
}
