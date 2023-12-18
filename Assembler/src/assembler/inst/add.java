package assembler.inst;

import assembler.Instruction;

public class add extends Instruction {

    public add() {
        super("add", 7, InstructionType.TWO_OPERAND);
    }
}
