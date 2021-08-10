# Starting After Clone

- bundle install
- bundle exec rails assets:precompile --trace --verbose
- bundle exec rails server
- yarn install
- rake db:create
- rake db:schema:load
- rake db:seed
- redis-server
- bundle exec sidekiq
- bundle webpacker:install -> answer NO to overwriting files

- rails console
  - copy "SECOND", including "require 'csv'", and paste into rails console to seed from csv file species.
  - your counts should be the below quantities:
  - {
      "plants_count": 3990,
      "detailled_plants_count": 4725
    }

- rails s

- At this time, your trefle api should be up and running and ready for requests.

- using Postman or Insomnia, start with a Root request: GET to http://localhost:3232/api/v1
- visit localhost:3232 and Sign Up for an account, this is how you get your ACCESS TOKEN
- Next, you need to use your Access Token to obtain authorization, which if successfull will give you another token which is used to make all future requests
  - POST to http://localhost:3232/api/auth/claim WITH query params: token => your access token
  - This should return a json object with token and expiration keys, copy this token
- Next, we will make our first real request for plant data to our server
  - GET to http://localhost:3232/api/v1/species WITH a Bearer token => the token you just got
- congrats you made it!