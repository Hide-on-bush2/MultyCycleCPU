module IR(
    input [31:0] IDataOut,
    input CLK,
    input IRWre,

    output reg [5:0] op,
    output reg [4:0] rs, rt, rd,
    output reg [15:0] Immediate,
    output reg [4:0] Sa,
    output reg [31:0] JumpPC
);


always @(IDataOut and negedge CLK) begin
    if(IRWre) begin
        op = IDataOut[31:26];
        rs = IDataOut[25:21];
        rt = IDataOut[20:16];
        rd = IDataOut[15:11];
        Immediate = IDataOut[15:0];
        Sa = IDataOut[10:6];
        JumpPC = {{PC4}, {IDataOut[27:2]}, {2'b00}};
    end
end

