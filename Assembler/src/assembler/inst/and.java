package assembler.inst;

import assembler.Instruction;

public class and extends Instruction {

    public and() {
        super("ad", 9, InstructionType.TWO_OPERAND);
    }
}
