package assembler.inst;

import assembler.Instruction;

public class or extends Instruction {

    public or() {
        super("or", 10, InstructionType.TWO_OPERAND);
    }
}

