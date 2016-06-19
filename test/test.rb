require 'test/unit'
require 'bloomfilter'

class TestBloomFilter < Test::Unit::TestCase
  def test_create
    bf = BloomFilter.new(1000)
    assert_not_nil(bf)
  end

  def test_add
    bf = BloomFilter.new(1000)
    ["apple", "orange", "egg", "milk", "beef"].each do |item|
      bf << item
    end
    assert_equal(true, bf.include?("apple"))
    assert_equal(false, bf.include?("chicken"))
  end
end
