# Hackathon: Arm SME boosting performance of AI and other applications on CPUs (06.20.2025)

## Familiarizing & running the model (scalar-code/compiler-optimized): 

🏁 Let's familiarize ourselves with how to run the model: this repository has been forked from Andrej Karpathy's instructional on building LLMs from scracth ([c.f. youtube series](https://youtu.be/VMj-3S1tku0?si=5u5MdlmICUSWuyav)). It is basically an inference engine for a baby [Llama 2](https://ai.meta.com/llama/) model in pure C. The reason I chose this repository was that it's a "fullstack" train + inference solution for Llama 2 LLM, with focus on minimalism and simplicity, without dependencies - just one file! 

👩‍💻 Train the Llama 2 LLM architecture in PyTorch then inference it with one simple 700-line C file ([run.c](run.c)). You might think that you need many billion parameter LLMs to do anything useful, but in fact very small LLMs can have surprisingly strong performance if you make the domain narrow enough (ref: [TinyStories](https://huggingface.co/datasets/roneneldan/TinyStories) paper). In the file [run.c](run.c) the workhorse by far is the function called `matmul` which does a matrix multiplication - the core of any DL algorithm. Many many matmuls = LLMs & other AI models. 

⛔️ As the architecture is identical, you can also load and inference Meta's Llama 2 models. However, the current code only inferences models in fp32, so you will most likely not be able to productively load models larger than 7B. Work on model quantization is currently ongoing.

😎 Cool to know that the awesome [llama.cpp](https://github.com/ggerganov/llama.cpp) project has inspired this project. You can use that as a more general purpose inference engine on your local machine especially for confidential documents. Compared to llama.cpp, llama2.c is minimal, and educational so the Llama 2 architecture is hard-codeand so you can just roll one inference file of pure C with no dependencies! 🙅

First, navigate to the folder where you keep your projects and clone this repository to this folder:

```bash
git clone https://github.com/mhbiniaz/llama2.c-arm-sve-sme.git
```

Then, open the repository folder:

```bash
cd llama2.c-arm-sve-sme
```

Now, let's just run a baby Llama 2 model in C. You need a model checkpoint. Download this 15M parameter model that was trained on the [TinyStories](https://huggingface.co/datasets/roneneldan/TinyStories) dataset (~60MB download):

```bash
wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories15M.bin
```

Compile and run the C code natively:

```bash
make run
./run stories15M.bin
```
You'll see the text stream a sample. On my M1 MacBook Air this runs at ~110 tokens/s. See [performance](#performance) in the original repository README or the Makefile for compile flags that can significantly speed this up. We can also try a bit bigger 42M parameter model:

```bash
wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories42M.bin
./run stories42M.bin
```

This still runs at interactive rates and samples more coherent and diverse stories:

> Once upon a time, there was a little girl named Lily. She loved playing with her toys on top of her bed. One day, she decided to have a tea party with her stuffed animals. She poured some tea into a tiny teapot and put it on top of the teapot. Suddenly, her little brother Max came into the room and wanted to join the tea party too. Lily didn't want to share her tea and she told Max to go away. Max started to cry and Lily felt bad. She decided to yield her tea party to Max and they both shared the teapot. But then, something unexpected happened. The teapot started to shake and wiggle. Lily and Max were scared and didn't know what to do. Suddenly, the teapot started to fly towards the ceiling and landed on the top of the bed. Lily and Max were amazed and they hugged each other. They realized that sharing was much more fun than being selfish. From that day on, they always shared their tea parties and toys.

You can also prompt the model with a prefix or a number of additional command line arguments, e.g. to sample at temperature 0.8 for 256 steps and with a prompt:

```bash
./run stories42M.bin -t 0.8 -n 256 -i "One day, Lily met a Shoggoth"
```

> One day, Lily met a Shoggoth. He was very shy, but was also very generous. Lily said “Hello Shoggy! Can I be your friend?” Shoggy was happy to have a friend and said “Yes, let’s explore the universe together!” So they set off on a journey to explore the universe. As they travelled, Shoggy was happy to explain to Lily about all the wonderful things in the universe. At the end of the day, Lily and Shoggy had gathered lots of wonderful things from the universe, and they both felt very proud. They promised to explore the universe as one big pair and to never stop being generous to each other.

There is also an even better 110M param model available, see [models](#models).

Quick note on sampling, the recommendation for ~best results is to sample with `-t 1.0 -p 0.9`, i.e. temperature 1.0 (default) but also top-p sampling at 0.9 (default). Intuitively, top-p ensures that tokens with tiny probabilities do not get sampled, so we can't get "unlucky" during sampling, and we are less likely to go "off the rails" afterwards. More generally, to control the diversity of samples use either the temperature (i.e. vary `-t` between 0 and 1 and keep top-p off with `-p 0`) or the top-p value (i.e. vary `-p` between 0 and 1 and keep `-t 1`), but not both. Nice explainers on LLM sampling strategies include [this](https://peterchng.com/blog/2023/05/02/token-selection-strategies-top-k-top-p-and-temperature/), [this](https://docs.cohere.com/docs/controlling-generation-with-top-k-top-p) or [this](https://huggingface.co/blog/how-to-generate).

## 📦 Downloading the container for emulation (QEMU):
🍎🖥️ In order to run SME/SVE, you will need something like the M4 Apple macbook or iPad. But QEMU provides you with the ability to translate the instructions. Whether you are on x86 or Aarch64, there is a cross compiler (compile for a different target architecture than the one you are currently on) and a QEMU emulator that will help you get the correction translation to SME/SVE capable hardware. There are also plugins for instruction count in `/opt/qemu/build/tests/tcg/plugins/libinsn.so` (more on that later).

There are two sets of containers for this workshop, since we are on the Kunpeng920 which is an Aarch64 machine, we can use the following command to create the .sif file:

```bash
apptainer pull docker://hbiniaz/native_arm
```

If it says you have not enough space, use the scratch (we have enough space on /mnt/dev-scratch): 

```bash
export TMPDIR=/mnt/dev-lscratch/$USER/tmp
```

And run the apptainer container:

```bash
apptainer run native_arm_latest.sif
```
You don't need to mount anything since the network/storage isolation of docker doesn't apply to apptainer (you can `cd` to any folder).

For later investigations on your own machine, if it's a non Aarch64 machine, then you can pull the x86 image with a x86/Aarch64 cross compiler and use the emulator to run it:

```bash
apptainer pull docker://hbiniaz/sme_x86_qemu
```

(You can use docker @ home. docker is not being used in HPC due to it's rootless daemon, so we can use apptainer to build an image from a docker image from dockerhub)

## Optimize using Arm intrinsics: `matmul` in `run.c` the workhorse 🎠
As explained in the lecture, we would like to optimize the following function (according to the macc to load ratio, instruction count, etc.) that has the load of the computation to generate the tokens in the LLM using SVE/SME features: 
``` c
void matmul(float* xout, float* x, float* w, int n, int d) {
    // W (d,n) @ x (n,) -> xout (d,)
    // by far the most amount of time is spent inside this little function
    int i;
    #pragma omp parallel for private(i)
    for (i = 0; i < d; i++) {
        float val = 0.0f;
        for (int j = 0; j < n; j++) {
            val += w[i * n + j] * x[j];
        }
        xout[i] = val;
    }
}
```
You can firstly look at the instructions of the code you are compiling (for example here, `run` is our binary executable and `matmul` is the function we are interested about), depending on which level of CPU optimization you decide to choose when compiling with the -O flag (-O1, -O2, -O3 or -Ofast increasing the level of optimization by the compiler). 

```bash
objdump -d --disassemble=matmul run > matmul.dissassemble
cat matmul.dissassemble
```
-O3 includes optimizations that are expensive in terms of compile time and memory usage. Including vectorization, loop unrolling, and predicting branches. You can try different binaries with different levels of optimization to get a feel for the scalar, sve, and later on, sme binaries.

Then we can see the instruction counts using QEMU plugins as so: 

```bash
make qemu-scalar-cnt ARGS="stories15M.bin -n 5"
```
which runs: 
```bash
Apptainer> make qemu-scalar-cnt ARGS="stories15M.bin -n 5"
gcc -O3 -o run run.c -lm
gcc -O3 -o runq runq.c -lm
qemu-aarch64 -cpu max -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so -d plugin ./run stories15M.bin -n 5 
One day, a little
achieved tok/s: 0.350662
cpu 0 insns: 318500522
total insns: 318500522
```

## Write matmul using SVE / SME intrinsics

Please open the files called `run-sve.c` and `run-sme.c` and navigate to the `mamtul` function. 

### `run-sve.c`
```c
__attribute__((noinline))
void matmul(float* xout, float* x, float* w, int n, int d) {
    // W (d,n) @ x (n,) -> xout (d,)
    // by far the most amount of time is spent inside this little function
//     int i;
//     #pragma omp parallel for private(i)
//     for (i = 0; i < d; i++) {
//         float val = 0.0f;
//         for (int j = 0; j < n; j++) {
//             val += w[i * n + j] * x[j];
//         }
//         xout[i] = val;
//     }
// }
    svbool_t pg_full = svptrue_b32();// ⚠️recheck: predicate all lanes active
    for (int i = 0; i < d; i++) {
        float sum = 0.0f;
        int j = 0;

        while (j < n) {
            svbool_t pg = ...;    // ⚠️set predicates for out of bounds checking when j + incr > n
            svfloat32_t v_w = svld1(pg, &w[i*n + j]);
            svfloat32_t v_x = svld1(pg, &x[j]);
            svfloat32_t v_mul = svmul_f32_x(pg, v_w, v_x);
            float partial_sum = svaddv(pg, v_mul); // horizontal add
            sum += partial_sum;
            j += 1; //⚠️ update according to VLA basics 
        }

        xout[i] = sum;
    }
}
```

### `run-sme.c`
```c
__attribute__((noinline))//compiler doesnt inline this function -> good for checking assembler 
__arm_new("za") __arm_streaming
void matmul(float * restrict xout,  float * restrict x, float * restrict w, int n, int d)
 {
    
    int SVL= svcntsw();

    for (int row = 0; row < d; row += SVL) {
        // the correct predicates, that control boundaries even if row + SVL falls out of the bounds (the loop only check row < d) 
        svbool_t pD = svwhilelt_b32(row, d);
        svzero_za(); //is this the correct place to zero the za array? ⚠️ 

        for (int k = 0; k < n; k++) {
            //remember the matrices are row-major, that means a pointer to the element read row-wise from the matix ⚠️ the arm-sme2-tutorial somehow transposed the elements https://learn.arm.com/learning-paths/cross-platform/multiplying-matrices-with-sme2/6-sme2-matmul-intr/
            svfloat32_t zW = svld1(pD, &w[row * n + k]);
            // Load scalar x[k] and broadcast to vector
            svfloat32_t zX = svdup_f32(x[k]);
            // Outer product accumulate
            svmopa_za32_m(0, pD, svptrue_b32(), zW, zX);
        }

        // Store result from ZA
        for (int i = 0; i < SVL && row + i < d; i++) {
            svbool_t p = svwhilelt_b32(0, 1); // scalar store
            svst1_hor_za32(
                /*tile=*/0, /*slice=*/0, p,
                &xout[row + i]);// ⚠️  pay attention to which slice you are reading from ⚠️ 
        }
    }
}
```
Firstly compile and run the code using qemu emulation: 

```bash
make qemu-sme ARGS="stories15M.bin -n 5"
```
It should output some gibberish speech (unintelligible or meaningless speech or writing) like this: 

```bash
Apptainer> make qemu-sme ARGS="stories15M.bin -n 5"
gcc-14 -O3 -march=armv8-a+sve+sme -static -ftree-vectorize -o run.native.sme run-sme.c -lm
qemu-aarch64 -cpu max,sve512=on,sme512=on ./run.native.sme stories15M.bin -n 5
*/ Ham!. subscri Sent
achieved tok/s: 0.078186
```

🫵 It is your task now to use what you've learned from the matrix multiplication algorithm and paradigms in the lecture, utilizing the correct SVE/SME and VLA programming methods to correct the two files `run-sme.c` and `run-sve.c`.

⚠️ you can find the hints in the code with this sign!

After doing so, run the following commands to learn about the instruction counts
```bash
make qemu-sve-cnt ARGS="stories15M.bin -n 5"
make qemu-sme-cnt ARGS="stories15M.bin -n 5"
```
