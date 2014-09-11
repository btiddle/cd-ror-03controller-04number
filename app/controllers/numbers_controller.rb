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
