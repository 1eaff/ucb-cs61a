def add_in_range(start, stop):
    """
    >>> add_in_range(3, 5)  # .Case 1
    12
    >>> add_in_range(1, 10)  # .Case 2
    55
    """
    sum = 0
    while start <= stop:
        sum += start
        start += 1
    return sum
