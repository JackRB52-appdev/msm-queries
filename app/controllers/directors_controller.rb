class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb"})
  end

  def director_details
    @id = params.fetch("an_id")
    @the_director = Director.where({:id => @id})[0]
    render({:template => "director_templates/show.html.erb"})
  end

  def wisest
    @oldest = Director.where.not({ :dob => nil}).order({:dob => :asc})[0]
    render({:template => "director_templates/eldest.html.erb"})
  end

end
