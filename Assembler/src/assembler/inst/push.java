package assembler.inst;

import assembler.Instruction;

public class push extends Instruction {

    public push() {
        super("push", 17, InstructionType.ONE_OPERAND);
    }
}
