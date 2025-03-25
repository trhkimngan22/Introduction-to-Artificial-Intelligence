def distance(a, b):
    """
        a, b: tuple (x, y)
        return: distance between a and b
    """
    return abs(a[0] - b[0]) + abs(a[1] - b[1])

def distToFrozenset(d):
    """
        d: dict - {character: (x, y), stones: [(x, y)], switches: [(x, y)]}
        return: frozenset
    """
    return frozenset(
        (d['character'], frozenset(d['stones']), frozenset(d['switches']))
    )
