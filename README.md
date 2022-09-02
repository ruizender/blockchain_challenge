# App Blockchain

Application was uploaded to the Heroku servers, which can be accessed at the following link:  https://blockchainchallenge.herokuapp.com/

## First steps:

Pre requirements

-	Do `git clone` to the project, in the following link https://github.com/ruizender/blockchain_challenge.git

-	The following versions of Ruby on Rails must be installed on your computer:
`Ruby 3.0.2`
`Rails 7.0.3`

- In your preferred text editor, run the command `Bundle install` to install the gems corresponding to the project.

- In the terminal create the databases, with the command:: `rails db: create` and then run the pending migrations with `rails db:migrate`

- In the terminal, run the command`rails server`. And you can access the project, in the browser through the following  URL:   http://localhost:3000/


## Description and functionalities of the application:

The application aims to manage its own blockchains. In it, you can create blockchains with the attributes that compose it, such as the code that identifies it, the previous block, its time and bits, which, when created, join other blockchain records that were previously created. In addition, their management includes the ease of being able to delete the records.
