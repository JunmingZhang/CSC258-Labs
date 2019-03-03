//SW[0:3] data inputs
//SW[9:8] select signal

//LEDR[0] output display

module FourToOneMux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    mux2to1 u0(
        .x(SW[0]), // Input u
        .y(SW[2]), // Input w
        .s(SW[9]), // Input s0
        .m(c1)     // Wire c1
        );
	
	 mux2to1 u1(
        .x(SW[1]), // Input v
        .y(SW[3]), // Input x
        .s(SW[9]), // Input s0
        .m(c2)     // Wire c2
        );
		  
	 mux2to1 u2(
        .x(c1),      // Output of u0
        .y(c2),      // Output of u1
        .s(SW[8]),   // Input s1
        .m(LEDR[0])  // Output m
        );
endmodule

module mux2to1(x, y, s, m);
    input x;  // First input
    input y;  // Second input
    input s;  // Switch
    output m; // Output
  
    assign m = s ? y : x;

endmodule
