package assembler.inst;

import assembler.Instruction;

public class dec extends Instruction {

    public dec() {
        super("dec", 4, InstructionType.ONE_OPERAND);
    }
}
