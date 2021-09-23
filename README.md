# README

Exam System

Things you may want to cover:

* Ruby version: 3.0.0

* Below step to run application
  - `bundle install`
  - `rails db:create db:migrate db:seed`
  - `rails s`


* Listed api url
  - POST 'http://localhost:3000/v1/answers'
    - body parameters
    ```
      params: {
        question_id: 1, question_option_id: 3, skip: false
      }
      ```
  - GET 'http://localhost:3000/v1/questions'
  - GET 'http://localhost:3000/v1/user/percentage'


* How to run rspec
  - `bundle exec rspec` or `rspec`
