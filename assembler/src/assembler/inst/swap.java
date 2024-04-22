package assembler.inst;

import assembler.Instruction;

public class swap extends Instruction {

    public swap(){
        super(
                "swap",
                31,
                InstructionType.TWO_OPERAND_NO_OUTPUT
        );
    }

}
