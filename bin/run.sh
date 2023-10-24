# Bash Script to compile and simulate a Verilog design using iverilog and gtkwave

# Input: file path
read -p "Enter file path: " file

# Compile the design
iverilog -o temp.vvp $file.v

# Run the simulation
vvp temp.vvp

# Show the simulation
gtkwave $file.vcd
