package assembler.inst;

import assembler.Instruction;

public class out extends Instruction {

    public out() {
        super("out", 5, InstructionType.ONE_OPERAND);
    }
}
