# Usage

## bundle install
```
$ bundle install --path vendor/bundle --without production
```
## launch application
```
$ bundle exec rackup -o 0.0.0.0
```
## check browser or terminal
```
$ http://localhost:9292/
$ curl http://localhost:9292/ 
```
## initialize psql database
```
# on postgre sql
$ create database twitter;

# on this repository
$ bundle exec rake db:migrate
```
