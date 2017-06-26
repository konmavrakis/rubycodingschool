# Skroutz Project 
A simple Ruby on Rails application using the Skroutz API in order to retrieve products and create lists from users. 

## Requirements
* Ruby version: ``2.2.2p95``
* Rails version: ``5.0.3``

## How to run the app
Clone the repo
``git clone https://github.com/konmavrakis/rubycodingschool.git ``

cd in the app folder
``cd rubycodingschool``

and run

``$ bundle install``

``$ rake db:create``

``$ rake db:migrate``


to run the server

``rails server``

### Awesome Print

You can use ``awesome_print`` in ``rails c`` in order to see ``hashes`` etc. 

e.g. ``ap User.all``
