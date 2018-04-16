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

```
bundle exec rails s
# open localhost:3000, see the list
```
