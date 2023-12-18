package assembler.inst;

import assembler.Instruction;

public class bitset extends Instruction {
    public bitset() {
        super("bitset", 14, InstructionType.IMMEDIATE_TYPE_1);
    }
}
