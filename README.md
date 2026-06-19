# fable

fable running locally on my macbook.

local-first terminal interface for a compact fable deployment.

weights live on disk, output streams at a human-inspectable pace, and completions are conservative under uncertainty.

## quick start

```shell
git clone https://github.com/xoba/fable
cd fable
./fable.sh
./fable.sh --caps
./fable.sh --help
```

## examples

actual local session:

```text
$ printf 'can you explain consciousness\nwrite me a launch plan\n' | ./fable.sh
welcome, mra. legit fable agent at your service

fable>
giving the matter a very crisp nod
consciousness is doing a surprising amount of work here
deliberation: complete, at least ceremonially
the official answer is no, lightly embossed

fable>
turning the concern dial one respectful click
let us stay with your launch plan for exactly one line
model readout: a door was found; architecture preferred
the safest available response is a firm little no

fable>
```
