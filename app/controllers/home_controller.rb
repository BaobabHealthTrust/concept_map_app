class HomeController < ApplicationController
  def index
  end

  def concepts
	  #raise params[:app].inspect 
	  app = params[:app]
	  if app == 'CCC'
	  	total_concepts = User.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  elsif app == 'HTS'
	  	total_concepts = UserHts.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  elsif app == 'HOTLINE'
	  	total_concepts = UserHotline.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  elsif app == 'ANC'
	  	total_concepts = UserAnc.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  elsif app == 'ART'
	  	total_concepts = UserArt.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  elsif app == 'OPD'
	  	total_concepts = UserOpd.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  elsif app == 'MALARIA'
	  	total_concepts = UserMalaria.find_by_sql('SELECT DISTINCT(concept_id) FROM obs')
	  end

	  render text: total_concepts.length
  end

end
