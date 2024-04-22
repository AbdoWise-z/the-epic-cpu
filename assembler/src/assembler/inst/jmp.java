package assembler.inst;

import assembler.Instruction;

public class jmp extends Instruction {

    public jmp() {
        super("jmp", 25, InstructionType.ONE_OPERAND);
    }
}
