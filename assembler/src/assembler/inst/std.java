package assembler.inst;

import assembler.Instruction;

public class std extends Instruction {
    public std() {
        super("std", 21, InstructionType.IMMEDIATE_TYPE_EA);
    }
}
