package assembler.inst;

import assembler.Instruction;

public class rcr extends Instruction {
    public rcr() {
        super("rcr", 16, InstructionType.IMMEDIATE_TYPE_1);
    }
}
