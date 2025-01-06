module NORmodule(
    input[5:0] a,
    output out
);

assign out = ~|a;
endmodule