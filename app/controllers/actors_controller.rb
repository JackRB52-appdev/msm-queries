class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all

    render({ :template => "actor_templates/index.html.erb"})
  end

  def actor_details
    @id = params.fetch("an_id")
    @the_actor = Actor.where({:id => @id})[0]

    @characters = Character.where({ :actor_id => @id})
    @character_movies =  @characters.map_relation_to_array(:movie_id)

    @filmography = Movie.where({ :id => @character_movies})

    render({:template => "actor_templates/show.html.erb"})
  end

end
