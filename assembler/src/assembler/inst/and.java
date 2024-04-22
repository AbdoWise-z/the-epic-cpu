package assembler.inst;

import assembler.Instruction;

public class and extends Instruction {

    public and() {
        super("and", 9, InstructionType.TWO_OPERAND);
    }
}
