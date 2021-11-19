from multiprocessing import Pool
import math
def chunk(args):
    start = int(args[0])
    end = int(args[1])
    accum = 0
    sign = 1 if start % 2 == 0 else -1
    for i in range(start, end):
        denominator = i * 2 + 1
        accum = accum + (1 / denominator) * sign
        sign = sign * -1
    return accum
def multi():
    accum = 0
    sign = 1
    start = 0
    end = 1000000000
    arguments = []
    numprocessor = 8
    for i in range(0, numprocessor):
        arguments.append((i * end / numprocessor, (i + 1) * end / numprocessor))
    with Pool(processes=numprocessor) as p:
        results = p.map(chunk, arguments)

    accum = sum(results)
    pi = accum * 4
    print('pi is ' + str(pi))

def single():
    start = 0
    end = 10000
    accum = 0
    sign = 1 if start % 2 == 0 else -1
    for i in range(start, end):
        denominator = i * 2 + 1
        accum = accum + (1 / denominator) * sign
        sign = sign * -1

    pi = accum * 4
    print('pi is ' + str(pi))


if __name__ == "__main__":
    multi()
    # single()