package assembler.inst;

import assembler.Instruction;

public class ldm extends Instruction {
    public ldm() {
        super("ldm", 19, InstructionType.IMMEDIATE_TYPE_2);
    }
}
