### Bloom Filters

Bloom filters are a probabilistic data structure that can be used to test whether an element is a member of a set. They are extremely space-efficient and have a very fast lookup time. However, they have one big drawback: they are probabilistic, which means that there is a small chance that the filter will incorrectly identify an element as being in the set when it is not.

Bloom filters are made up of a bit array of a certain size and a set of hash functions. To add an element to the set, we pass it through each of the hash functions and set the corresponding bit in the bit array to 1. To test whether an element is in the set, we again pass it through each of the hash functions and check whether the corresponding bits in the bit array are all set to 1. If they are, then the element is probably in the set. If even one of them is not set, then the element is definitely not in the set.


