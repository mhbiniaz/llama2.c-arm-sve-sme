# For instruction count, run as such: 
`make qemu-arm-count ARGS="stories15M.bin -n 5" 2>&1 | grep "^IN:" | wc -l`

## or with input as:
`make qemu-arm-count ARGS="stories15M.bin -t 0.8 -n 256 -i "One day, Lily met a Shoggoth" 2>&1 | grep "^IN:" | wc -l`

Bigger model:
`make qemu-arm-count ARGS="stories42M.bin -t 0.8 -n 256 -i "One day, Lily met a Shoggoth" 2>&1 | grep "^IN:" | wc -l`

### make sure you download the adequated conversion of those model weights (.bin files)
`wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories15M.bin`
and 
`wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories42M.bin`
