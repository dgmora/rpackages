require 'open-uri'
# This class will be responsible for reading the package
# list, downloading packages and building Package models. Another class will
# be responsible for extracting the description
class PackageHandler
  PACKAGE_LIST_URL = 'http://cran.r-project.org/src/contrib/PACKAGES'.freeze

  def self.read_packages_list
    package_regexp = /Package:\s(.*)\nVersion:\s(.*)\n/

    # D̶c̶f̶.̶p̶a̶r̶s̶e̶(̶o̶p̶e̶n̶(̶P̶A̶C̶K̶A̶G̶E̶_̶L̶I̶S̶T̶_̶U̶R̶L̶)̶.̶r̶e̶a̶d̶)̶ 40 seconds is not what I call optimal
    open(PACKAGE_LIST_URL).read.scan(package_regexp).map do |match|
      { name: match[0], version: match[1] }
    end
  end

  def self.run(amount)
    package_hashes = read_packages_list[0..amount - 1].map do |package_info|
      desc_info = PackageReader.new(package_info[:name], package_info[:version]).read
      package_info.merge(desc_info)
    end

    # In the real world probably should be save! + rescue & report
    package_hashes.each do |package_hash|
      package = Package.new(package_hash)
      Rails.logger(package.errors) if package.invalid?
      package.save
    end
  end
end
