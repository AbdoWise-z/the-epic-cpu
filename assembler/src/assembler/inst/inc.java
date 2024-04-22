package assembler.inst;

import assembler.Instruction;

public class inc extends Instruction {

    public inc() {
        super("inc", 3, InstructionType.ONE_OPERAND);
    }
}
