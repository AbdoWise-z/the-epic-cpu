package assembler.inst;

import assembler.Instruction;

public class neg extends Instruction {

    public neg() {
        super("neg", 2, InstructionType.ONE_OPERAND);
    }
}
