require 'murmurhash3'
require 'bitvector'

class BloomFilter
  def initialize(capacity, error_rate=0.001)
    @p = error_rate
    @n = capacity
    @k = (Math.log2(1.0/@p)).ceil
    @m = ((@n*(Math.log(@p)).abs)/(@k*(Math.log(2)**2))).ceil * @k
    @seeds = []
    @k.times { @seeds << rand(1000000) }
    @bitvector = BitVector.new(@m)
    @items = 0
  end

  def add(object)
    @seeds.each do |seed|
      index = MurmurHash3::V32.str_hash(object, seed) % @m
      @bitvector.set(index)
    end
  end

  def <<(object)
    self.add(object)
  end

  def include?(object)
    @seeds.each do |seed|
      index = MurmurHash3::V32.str_hash(object, seed) % @m
      return false if @bitvector[index] == false
    end
    return true
  end
end
