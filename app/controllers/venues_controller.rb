class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @list_of_venues = matching_venues.order({:created_at => :asc})

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create

    input_address = params.fetch("query_address")
    input_name = params.fetch("query_name")
    input_neighborhood = params.fetch("query_neighborhood")


    new_venue = Venue.new
    new_venue.address = input_address
    new_venue.name = input_name
    new_venue.neighborhood = input_neighborhood

    new_venue.save

    redirect_to("/venues/#{venue.name}")
  end
  
  def update
    the_id = params.fetch("venue_id")

    @venue = Venue.where({ :id => the_id })
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("Query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues.at(0)
    venue.destroy

    redirect_to("/venues")
  end

end
