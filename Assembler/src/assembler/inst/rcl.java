package assembler.inst;

import assembler.Instruction;

public class rcl extends Instruction {
    public rcl() {
        super("rcl", 15, InstructionType.IMMEDIATE_TYPE_1);
    }
}
