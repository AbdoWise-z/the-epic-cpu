package assembler.inst;

import assembler.Instruction;

public class xor extends Instruction {

    public xor() {
        super("xor", 11, InstructionType.TWO_OPERAND);
    }
}

