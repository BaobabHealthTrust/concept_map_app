class HomeController < ApplicationController
  def index
  end

  def concepts
	  #raise params[:app].inspect 
	  total_concepts = User.find_by_sql('SELECT COUNT(*) FROM user')
	  render text: total_concepts.count
  end

end
