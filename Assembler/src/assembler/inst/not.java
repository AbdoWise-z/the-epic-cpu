package assembler.inst;

import assembler.Instruction;

public class not extends Instruction {

    public not() {
        super("not", 1, InstructionType.ONE_OPERAND);
    }
}
