# README

This app is made as part of the bootcamp The Hacking Project. 
It aims at creating a basic version of a Facebook-like website in Ruby on Rails and using Bootstrap to set up quickly the design. The website has been made in full respect of MVC's architecture and CRUD principles. 'Fat models, skinny controllers' have been respected as much as I could ;)

The website is live on Heroku, please check: 
https://the-gossip-network.herokuapp.com/ 

## The Ruby version 
The ruby version used is 2.5.1.
The rails version used is volontarily 5.2.3.

## Install from your console

`git clone https://github.com/estelle-rcr/THP-Facebook-like.git`
  `cd THP-Facebook-like`

Install the bundle:
  `bundle install`
  
Set up the database:
  `rails db:create`
      `rails db:migrate`
  
Seed the database:
  `rails db:seed`

Finally launch the server:
  `rails server`

And then access the localhost accordingly, for instance:
  `http://localhost:3000/`


## Additional Gems used
We have used some additional Gems such as:

Faker gem for generating random data

bcrypt for encryption of the passwords


## Start playing around with the database in the sandbox:
To use, please follow these commands:
`rails console --sandbox`

The tables in the database are:
- users (that can be called as 'author' of gossips)
- gossips
- cities
- comments

The tables tags and likes are operational but the related features are not implemented in front.

### Run tests yourself:

* The database has been seeded to enable testing. To do that, first launch your rails console from your terminal in test environment, so that nothing will be saved:

`rails console --sandbox`

* You can try various method using the class from the tables :

`@gossips = Gossip.all`
  `gossips.author`

* Visit the URLs:
  `http://localhost:3000/`
    `http://localhost:3000/contact/`
      `http://localhost:3000/team/`
        `http://localhost:3000/gossip/3`
          `http://localhost:3000/user/3`

 * Features to be tested:
 - sign up as a user (with secured password using password digest)
 - log in as a user
- when creating an account or logging in, you can choose to be remembered: permanent cookies are created (with secured digest for the token)
 - log out (+ cookies deletion)
 - create a gossip and consult gossip (onyl if you're connected)
 - edit and delete you're the author of the gossip
 - create comment, edit and delete them only if you're the one who wrotes them


 Not implemented yet:
 - Likes
 - Tags of gossip