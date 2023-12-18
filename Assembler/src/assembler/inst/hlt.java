package assembler.inst;

import assembler.Instruction;

public class hlt extends Instruction {
    public hlt() { // special instruction cuz we can
        super("hlt", 28, InstructionType.NO_OPERANDS);
    }
}
