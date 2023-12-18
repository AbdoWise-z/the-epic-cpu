package assembler.inst;

import assembler.Instruction;

public class nop extends Instruction {

    public nop(){
        super(
                "nop",
                0,
                InstructionType.NO_OPERANDS
        );
    }

}
