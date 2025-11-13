from cvc5.pythonic import Solver, Int, Not, sat

import pandas as pd
import numpy as np

from structs import DataFrame

def original(df):
    return df['original_price'].sort_values().values[:100]

def rewritten(df):
    return df['original_price'].nsmallest(100).to_numpy()


def run_concrete(n: int):
    df = pd.DataFrame({'original_price': np.random.rand(n)})
    
    o = original(df)
    n = rewritten(df)

    print(f"original: {o}")
    print(f"rewritten: {n}")

    if np.array_equal(o, n):
        print("PASS")
    else:
        print("FAIL")
        print(f"original: {o}")
        print(f"rewritten: {n}")    


def run_symbolic(n: int):
    s = Solver()

    ints = [Int(f"v{i}") for i in range(n)]
    
    df = DataFrame({'original_price': ints}, s)
    
    o = original(df)
    n = rewritten(df)

    print(f"original: {o}")
    print(f"rewritten: {n}")
    s.add(Not(n.eq(o)))

    if s.check() == sat:
        print(f"model:\n{s.model()}")
    else:
        print("UNSAT")    


if __name__ == "__main__":
    run_concrete(5)
    run_symbolic(5)