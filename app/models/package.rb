class Package < ApplicationRecord
  serialize :authors, Array
  serialize :maintainers, Array

  validates :authors, presence: true
  validates :maintainers, presence: true
  validates :name, presence: true
  validates :publication_date, presence: true
  validates :version, presence: true

end
