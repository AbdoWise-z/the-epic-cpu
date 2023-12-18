package assembler.inst;

import assembler.Instruction;

public class pop extends Instruction {

    public pop() {
        super("pop", 18, InstructionType.ONE_OPERAND);
    }
}
