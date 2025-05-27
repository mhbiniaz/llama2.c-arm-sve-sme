#!/bin/bash

# Step 1: get symbol/address info for matmul
line=$(aarch64-linux-gnu-nm -S run.arm | sort | grep ' T matmul')
echo "nm output: $line"

# Step 2: extract start and length in hex
read start len _ _ <<<"$line"

# Step 3: compute end address (start + len - 1)
start_dec=$((0x$start))
len_dec=$((0x$len))
end_dec=$((start_dec + len_dec - 1))

printf "matmul: 0x%x to 0x%x (%d bytes)\n" "$start_dec" "$end_dec" "$len_dec"

# Step 4: extract matching instructions from qemu.log
awk -v start="$start_dec" -v end="$end_dec" '
{
    # Assume first field is address, possibly like 0x0000000000401294:
    match($1, /^0x?[0-9a-fA-F]+:/, m)
    if (m[0]) {
        # Remove any 0x prefix or trailing colon
        gsub(/^0x/, "", m[0]); gsub(/:/, "", m[0])
        addr=strtonum("0x"m[0])
        if (addr >= start && addr <= end) print $0
    }
}
' qemu.log
