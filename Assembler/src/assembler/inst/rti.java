package assembler.inst;

import assembler.Instruction;

public class rti extends Instruction {

    public rti(){
        super(
                "rti",
                30,
                InstructionType.NO_OPERANDS
        );
    }

}
