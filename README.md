# Description

A social network. Use a gem action cable for send messages. JQuery/Axaj for iteractive UI. Sidekiq use for background jobs.

# Technologies

Use ruby version 2.7
Rails version 6.0 
Use swager for api documentation. 
Elasticsearch for path seqrch articles.

# Test

Test through:

  * Rspec
  * Capybara
  * Cucumber
  * Factory bot

# Steps for start

1) Copy project
2) Create .env file in root directory
3) Copy variables form .env.example file
4) Run in terminal "docker-compose up"
5) Create a new user in "db" imagen for postgresql "CREATE USER new_user WITH PASSWORD 'password_for_user';"
6) Give a role for new_user and set this data in .env
7) Run in termainl "bundle install" and "rails s"