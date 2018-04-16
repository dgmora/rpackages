class NewPackagesWorker
  include Sidekiq::Worker

  def perform(amount: 50, days: 1)
    PackageHandler.run(amount).each do |package|
      # Failing hard, could be done without failing + notifying
      next if Time.current - package.publication_date > days.day
      # lets make it simple and skip existing packages instead of updating
      next if Package.exists?(name: package.name, version: package.version)
      package.save!
    end
  end
end
