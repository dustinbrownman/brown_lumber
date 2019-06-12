# Brown Lumber

This is a Rails app built to replace a client's current website. There is no online store component, just a place for the client to display and add products and information. It will have products, categories, and subcategories.

* Built with Rails 5.2.0
* Mysql database
* Rspec/Capybara for testing
* Capistrano for deployment (!)
* Run `bundle install` -> `rake db:schema:load` -> `rake db:test:prepare` -> `rails s` to get it up and running on your local machine.

## Deployment

```
cap production deploy
```

### Setup

You'll need SSH access to the repo, and I think to the Brown Lumber Virtual Private Server (VPS) on
Dreamhost.

### Branching strategy

Capistrano is configured to deploy from the long running `release` branch. Ensure changes are merged
and pushed to `release` before deploying.
