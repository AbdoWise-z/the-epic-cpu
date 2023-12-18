package assembler.inst;

import assembler.Instruction;

public class jz extends Instruction {

    public jz() {
        super("jz", 24, InstructionType.ONE_OPERAND);
    }
}
