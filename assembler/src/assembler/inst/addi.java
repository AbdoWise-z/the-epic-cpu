package assembler.inst;

import assembler.Instruction;

public class addi extends Instruction {

    public addi() {
        super("addi", 13, InstructionType.TWO_OPERAND_IMMEDIATE);
    }
}

