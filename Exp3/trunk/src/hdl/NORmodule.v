module NORmodule(
    input a,
    output out
);

assign out = ~(a[0]||a[1]||a[2]||a[3]||a[4]||a[5]);
endmodule