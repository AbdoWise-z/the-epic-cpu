package assembler.inst;

import assembler.Instruction;

public class sub extends Instruction {

    public sub() {
        super("sub", 8, InstructionType.TWO_OPERAND);
    }
}
