package assembler.inst;

import assembler.Instruction;

public class in extends Instruction {

    public in() {
        super("in", 6, InstructionType.ONE_OPERAND);
    }
}
