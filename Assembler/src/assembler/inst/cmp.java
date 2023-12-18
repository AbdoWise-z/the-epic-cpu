package assembler.inst;

import assembler.Instruction;

public class cmp extends Instruction {

    public cmp() {
        super("cmp", 12, InstructionType.TWO_OPERAND_NO_OUTPUT);
    }
}

