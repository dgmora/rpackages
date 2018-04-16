require 'webmock'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end


WebMock.disable_net_connect!

def packages_list
  File.read('spec/support/PACKAGES.txt')
end

def mock_package(name, version)
  url = "http://cran.r-project.org/src/contrib/#{name}_#{version}.tar.gz"
  expect_any_instance_of(PackageReader).to(
    receive(:open).with(url)
    .and_return(open("spec/support/#{name}_#{version}.tar.gz"))
  )
end
