# Rails CSV Streaming example

This is an example application to show how to stream chunked http data for csvs etc.

After installing, you can test the streaming out using Curl:

`curl -v http://locahost:3000/contacts.csv`

The implementation is contained within

- app/controllers/contacts_controller.rb
- app/models/contact.rb

## To run locally

Postgres needs to be up and running.

Ruby 2.4.2

`bundle install`

`rails db:setup`

`rails server`

## To run on Heroku

`heroku create`

`heroku run rails db:migrate`

`heroku run rails db:seed`

## Related articles

- https://medium.com/table-xi/stream-csv-files-in-rails-because-you-can-46c212159ab7
- https://blog.clearbit.com/rack-csv-streaming/
- https://gist.github.com/CMCDragonkai/6bfade6431e9ffb7fe88
