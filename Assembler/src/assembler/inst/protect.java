package assembler.inst;

import assembler.Instruction;

public class protect extends Instruction {

    public protect() {
        super("protect", 22, InstructionType.ONE_OPERAND);
    }
}
