def digit_pos_match(n, k):
    """
    >>> digit_pos_match(980, 0) # .Case 1
    True
    >>> digit_pos_match(980, 2) # .Case 2
    False
    >>> digit_pos_match(98276, 2) # .Case 3
    True
    >>> digit_pos_match(98276, 3) # .Case 4
    False
    """
    i = k
    while i != 0:
        n, i = n // 10, i - 1
    return n % 10 == k
