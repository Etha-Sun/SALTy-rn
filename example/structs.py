from cvc5.pythonic import Solver, Int, Or, And, Distinct, Not, sat, BoolVal

class ndarray:
    def __init__(self, data, s: Solver):
        self.data = data
        self.solver = s

    def __repr__(self):
        return f"ndarray({self.data})"
    
    def __getitem__(self, item):
        return ndarray(self.data[item], self.solver)
    
    # default __eq__ must return a Boolean and not a symbolic expression, so that doesn't work
    def eq(self, value):
        # check if value is a ndarray, if so compare element-wise
        if isinstance(value, ndarray):
            if len(self.data) != len(value.data):            
                return BoolVal(False)
            return And([self.data[i] == value.data[i] for i in range(len(self.data))])
        return BoolVal(False)   
    

class Series:
    def __init__(self, data: list, s: Solver):
        self.data = data
        self.values = ndarray(data, s)
        self.solver = s

    def sort_values(self):
        n = len(self.data)

        # Output symbolic variables: sorted values
        sorted_vars = [Int(f'sorted_{i}') for i in range(n)]

        # Index variables: which input each output is equal to
        indices = [Int(f'idx_{i}') for i in range(n)]

        # Constraint 1: index values must be valid and distinct
        self.solver.add(And(*[And(idx >= 0, idx < n) for idx in indices]))
        self.solver.add(Distinct(*indices))  # No reuse of input positions

        # Constraint 2: Link sorted_vars[i] to vars via index match
        for i in range(n):
            choices = [And(indices[i] == j, sorted_vars[i] == self.data[j]) for j in range(n)]
            self.solver.add(Or(*choices))

        # Constraint 3: enforce sorting
        for i in range(n - 1):
            self.solver.add(sorted_vars[i] <= sorted_vars[i + 1])

        return Series(sorted_vars, self.solver)
    
    
    def nsmallest(self, n: int):
        if n <= 0:
            raise ValueError("n must be positive")
        elif n > len(self.data):
            n = len(self.data)

        # Output symbolic variables (smallest n)
        smallest = [Int(f'smallest_{i}') for i in range(n)]

        # Auxiliary: for each smallest[i], track which input var it matches
        # Indices into the input list
        indices = [Int(f'idx_{i}') for i in range(n)]

        # Index constraints: valid range and no duplicates
        self.solver.add(And(*[And(idx >= 0, idx < len(self.data)) for idx in indices]))
        self.solver.add(Distinct(*indices))  # Prevent reusing same input variable

        # Constraint 2: Link sorted_vars[i] to vars via index match
        for i in range(n):
            choices = [And(indices[i] == j, smallest[i] == self.data[j]) for j in range(n)]
            self.solver.add(Or(*choices))            

        # Sort output
        for i in range(n - 1):
            self.solver.add(smallest[i] <= smallest[i + 1])

        return Series(smallest, self.solver)

    def to_numpy(self):
        return ndarray(self.data, self.solver)

    # print the series
    def __repr__(self):
        return f"Series({self.data})"
    
    # default __eq__ must return a Boolean and not a symbolic expression, so that doesn't work
    def eq(self, value):
        # check if value is a Series, if so compare element-wise
        if isinstance(value, Series):
            if len(self.data) != len(value.data):
                return BoolVal(False)
            return And(*[self.data[i] == value.data[i] for i in range(len(self.data))])
        return BoolVal(False)


class DataFrame:
    def __init__(self, data: dict[str, list], s: Solver):
        self.data = data
        self.solver = s

    def __getitem__(self, item: str) -> Series:
        return Series(self.data[item], self.solver)
    
    # print the dataframe
    def __repr__(self):   
        return f"DataFrame({self.data})"