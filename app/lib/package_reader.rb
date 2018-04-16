require 'dcf'
require 'open-uri'
require 'rubygems/package'
require 'zlib'

class PackageReader
  def initialize(name, version)
    @name = name
    @version = version
  end

  def read
    compressed_file = download_tar_gz
    description = extract_description(compressed_file)
    delete_files
    parse_description(description)
  end

  private

  def parse_description(description)
    parsed_content = Dcf.parse(description).first
    {
      title: parsed_content['Title'],
      authors: parse_person_list(parsed_content['Author']),
      maintainers: parse_person_list(parsed_content['Maintainer']),
      description: parsed_content['Description'],
      publication_date: Time.parse(parsed_content['Date/Publication'])
    }
  end

  def parse_person_list(person_list)
    person_list.split(' ,').map do |person_info|
      match = person_info.match(/(?<name>.*)(\s\<(?<email>.*)>)/)
      if match
        match.named_captures.symbolize_keys
      else
        { name: person_info }
      end
    end
  end

  def extract_description(compressed_file)
    ungzipped = Zlib::GzipReader.new(compressed_file)
    description = Gem::Package::TarReader.new(ungzipped).find do |entry|
      entry.full_name == "#{@name}/DESCRIPTION"
    end.read
  end

  def download_tar_gz
    open("http://cran.r-project.org/src/contrib/#{@name}_#{@version}.tar.gz")
  end

  def delete_files
    # :)
  end
end
