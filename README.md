# R-packages

This is a small rails project that will:

1. Given a CRAN server, it will extract some information from every package file and store it in a database.
2. Show a simple list with all packages stored
3. Have a worker, which can be run periodically


# Dependencies

```
# These steps might be slightly different as I already had mysql/mariadb installed
brew install mysql
brew install redis
brew tap homebrew/services
brew services start mysql

gem install bundler
bundle install
```

# Running it

Before:

```
rails db:create
```

Run the server:
```
bundle exec rails s
# open localhost:3000, see the list
```

To run the cron:
```
bundle exec sidekiq
```

To populate the DB:
```
bundle exec rails c
NewPackagesWorker.new.perform(amount: 50, days: 365)
```

To test:
```
bundle exec rspec
```

# Other options/things

### Using has_many :through with users

It's quite obvious that instead of serializing the authors and maintainers we
could have a `Person` model, but this would involve checking if the user exists,
and two extra tables which don't add a lot of benefit in this example.

### Not using `package_helper`

I don't like a lot draper gem and I think a helper is fine enough for such an exercise.

### Mocking downloads instead of using VCR

For me it was quicker to use a simple mock than adding VCR

### Would be nice™ to download and read the package info in parallel
