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

    input_address = params.fetch("input_address")
    input_name = params.fetch("input_name")
    input_neighborhood = params.fetch("input_neighborhood")


    venue = Venue.new
    venue.address = input_address
    venue.name = input_name
    venue.neighborhood = input_neighborhood

    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    venue_id = params.fetch("the_id")

    matching_venues = Venue.where({ :id => venue_id })

    venue = matching_venues.at(0)

    input_address = params.fetch("query_address")
    input_name = params.fetch("query_name")
    input_neighborhood = params.fetch("query_neighborhood")

    venue.address = input_address
    venue.name = input_name
    venue.neighborhood = input_neighborhood

    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy

    the_id = params.fetch("venue_id").at(0)

    matching_venues = Venue.where({ :id => the_id })

    venue = matching_venues.at(0)

    venue.destroy

    redirect_to("/venues")
  end

end
