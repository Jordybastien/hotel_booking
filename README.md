# Small Booking application with Rails & Hotwire

This guide will walk you through the steps to get the application up and running on your local machine. Make sure you have Ruby, Rails, and a compatible database installed before proceeding.

## Concepts Covered/interacted with

1. Hotwire/Stimulus: The application utilizes Hotwire and Stimulus for seamless, live-updating user interfaces(lazy-loading items, display modals).

2. Minor Use of Presenters: Presenters are used sparingly to enhance the view layer with cleaner, more maintainable code.

3. View Components: Reusable components are organized using view components, promoting modularity and code reusability.

4. Concerns: Common functionality is grouped into concerns, promoting a clean and organized codebase.

More to come :)


## Clone the Repository

```
git clone https://github.com/your-username/your-rails-app.git
cd your-rails-app
```

## Install Gems

Install the required gems by running:

```
bundle install
```

## Configure Database

Open config/database.yml and add your database configuration under the development section. Replace username and password with your database username and password.


```
development:
  <<: *default
  username: user_name
  password: password
  host: localhost
  port: 5432 # adjust based on your database configuration
```

## Create Database
Create the development database by running:

```
rails db:create
```

## Run Migrations
Run the migrations to set up the database schema:

```
rails db:migrate
```

## Seed Database
Seed the database with initial data

```
rails db:seed
```

## Start the Application

```
rails server
```
Visit http://localhost:3000 in your browser to see the application in action!