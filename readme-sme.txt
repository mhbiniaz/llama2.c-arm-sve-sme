# For instruction count, run as such for counting instructions for generating ten tokens: 
`make qemu-arm-count ARGS="stories15M.bin -n 10" > qemu.log 2>&1 && grep -E "^\s*0x[0-9a-fA-F]+:" qemu.log | wc -l

## or with input as:
`make qemu-arm-count ARGS="stories15M.bin -t 0.8 -n 256 -i "One day, Lily met a Shoggoth" 2>&1 | grep "^IN:" | wc -l`

Bigger model:
`make qemu-arm-count ARGS="stories42M.bin -t 0.8 -n 256 -i "One day, Lily met a Shoggoth" 2>&1 | grep "^IN:" | wc -l`

### make sure you download the adequated conversion of those model weights (.bin files)
`wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories15M.bin`
and 
`wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories42M.bin`


make qemu-arm-count ARGS="stories15M.bin -n 50" > qemu.log 2>&1 && grep -E "^\s*0x[0-9a-fA-F]+:" qemu.log | wc -l
aarch64-linux-gnu-nm -S run.arm | sort

(base) cloud@x86-100:~/llama.c-sme/llama2.c-arm-sve-sme$ aarch64-linux-gnu-nm -S run.arm | sort | grep matmul
address and bytes:
0000000000401294 00000000000000d8 T matmul
conver to qemu format: 
echo "0000000000401320" | sed 's/^/0x/'
output: 0x0000000000401320