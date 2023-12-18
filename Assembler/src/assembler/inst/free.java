package assembler.inst;

import assembler.Instruction;

public class free extends Instruction {

    public free() {
        super("free", 23, InstructionType.ONE_OPERAND);
    }
}
