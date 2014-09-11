|     Project | Information                                                                          |
|------------:|:-------------------------------------------------------------------------------------|
| Domain:     | [Coding Dojo](http://codingdojo.com) (cd)                                            |
| Topic:      | Ruby on Rails (ror) <br> Understanding Rails - Controllers and Views (03controller)  |
| Assignment: | Great Number Game (04number)                                                         |
| Repository: | cd-ror-03controller-04number                                                         |

~~~

===============
#1: Start project
===============

# Create new project
rails new great-number-game

# Change to new directory
cd great-number-game

===============
#2: Update Gemfile
===============

edit> Gemfile
  - Uncomment: gem 'bcrypt'  # Using bcrypt (3.1.7)
  - Add: gem 'hirb'          # Using hirb (0.7.2)
  - Add: gem 'rails-footnotes', '>= 4.0.0', '<5'  # Installing rails-footnotes (4.0.1)
bundle install

rails generate rails_footnotes:install

===============
#3: Create models/tables
===============

NA

===============
#4: Create controller
===============
# Controllers needed for this project
# rails g controller <name-parameter> index new create show edit update destroy 

rails g controller Numbers pick guess match

===============
#5: edit: app/assets/stylesheets/numbers.css.scss
===============

*{
    font-family: sans-serif;
    text-align: center;
}

h1{
    font-size: 18px;
}

h2{
    font-size: 14px;
}

p{
    padding-top:60px;
}

form{
    display:inline-block;
}

.red{
    height: 175px;
    width:200px;
    background-color: red;
    color: white;
    text-align:center;
    display:inline-block;
}

.green{
    height: 175px;
    width:200px;
    background-color: rgb(0,158,44);
    color: white;
    margin: 0px auto;
    text-align:center;
}

#low{
    float:left;
}

#high{
    float:right;
}


===============
#6: edit: app/controllers/numbers_controller.rb
===============

class NumbersController < ApplicationController

  def pick
    session[:page_header] = 
      "<h1>Welcome to the Great Number Game</h1>" + 
      "<h2>I am computer-thinking of a number between 1 and 100.</h2>" + 
      "<h2>Take a guess!</h2>"

    session[:number] = rand(1...5)
  end

  def guess
    if params[:guess].to_i < session[:number]

        flash[:message] = "<div id='low' class='red'><p>Too low!</p></div>"

    elsif params[:guess].to_i > session[:number]

        flash[:message] = "<div id='high' class='red'><p>Too high!</p></div>"

    else
        flash[:message] = "<div class='green'><p>" + session[:number].to_s + " was the number!</p><a href='/numbers/pick'><button id='again'>Play Again</button></a></div>"
        redirect_to('/numbers/match')
    end
  end

  def match
  end
end

===============
#7: edit: app/views/numbers/guess.html.erb
===============

<%= session[:page_header].html_safe %>

<% if flash[:message] %>
        <%= flash[:message].html_safe %>
<% end %>

<form action='/numbers/guess' method='post'>
    <%= tag(:input,:type =>"hidden",:name => request_forgery_protection_token.to_s,:value => form_authenticity_token)%>
    <input type='number' min="1" max="100" name='guess'><br>
    <input type='submit'>
</form>

===============
#8: edit: app/views/numbers/match.html.erb
===============

<%= session[:page_header].html_safe %>

<% if flash[:message] %>
        <%= flash[:message].html_safe %>
<% end %>

===============
#9: edit: app/views/numbers/pick.html.erb
===============

<%= session[:page_header].html_safe %>

<form action='/numbers/guess' method='post'>
    <%= tag(:input,:type =>"hidden",:name => request_forgery_protection_token.to_s,:value => form_authenticity_token)%>
    <input type='number' min="1" max="100" name='guess'><br>
    <input type='submit'>
</form>

===============
#10: edit: config/routes.rb
===============

  get "numbers/pick"
  post "numbers/guess"
  get "numbers/match"

  root "numbers#pick"

===============
#11: Start server 
===============

rails server

===============
#12: Load application in browser
===============

http://localhost:3000

~~~