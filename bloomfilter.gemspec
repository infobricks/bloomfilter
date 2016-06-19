Gem::Specification.new do |spec|
  spec.name = "bloomfilter"
  spec.version = "0.0.1"
  spec.authors = ["Hayato Itsumi"]
  spec.email = "hayato.itsumi@icloud.com"
  spec.summary = %q{BloomFilter implementation for Ruby}
  spec.license = %q{Confidential}

  spec.files = %w(bloomfilter.gemspec) + Dir.glob("{lib}/**/*")
  spec.test_files = Dir.glob("{test,spec,features}")

  spec.add_dependency "rake", "~> 10.4"
  spec.add_dependency "bitvector", "~> 0.0"
end
