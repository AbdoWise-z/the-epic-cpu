package assembler.inst;

import assembler.Instruction;

public class ret extends Instruction {

    public ret(){
        super(
                "ret",
                29,
                InstructionType.NO_OPERANDS
        );
    }

}
