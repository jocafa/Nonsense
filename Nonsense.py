import math
import re

class LFSR:
    def __init__(self, seed=0x71a2b3c4, taps=0x48000000):
        self.seed = seed
        self.taps = taps
        self.state = seed

    def shift(self):
        lsb = self.state & 0x1
        self.state >>= 1
        if lsb == 1:
            self.state ^= self.taps
        return self.state

class Nonsense:
    def __init__(self):
        self.lfsr = LFSR()

    def seed(seed):
        self.state = seed

	#-----------------------------------------------------------[ Numbers ]----
    def integer(self):
        return self.lfsr.shift()

    def frac(self):
        return 1.0 * self.lfsr.shift() / 0x7fffffff

    def real(self):
        return self.lfsr.shift() + self.frac()

    def integerInRange(self, min=0, max=100):
        return math.floor(self.realInRange(min, max))

    def realInRange(self, min=0, max=100):
        return self.frac() * (max - min) + min

    def normal(self):
        return 1 - 2 * self.frac()

    def guid(self):
        r = integerInRange(0, 16)
        re.sub(r'[xy]',


if __name__ == "__main__":
    ns = Nonsense()
    print ns.integer()
    print ns.frac()
    print ns.real()
    print ns.integerInRange()
    print ns.realInRange()
    print ns.frac()
