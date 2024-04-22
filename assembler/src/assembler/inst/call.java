package assembler.inst;

import assembler.Instruction;

public class call extends Instruction {

    public call() {
        super("call", 26, InstructionType.ONE_OPERAND);
    }
}
