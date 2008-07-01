class MapController < ApplicationController
  
  layout 'main'
  
  def show
  end
  
  def gmap
    require 'rubygems'
    #require 'google_geocode'
    #@loc = GeoKit::Geocoders::Geocoder.yahoo_geocoder('1 Pennsylvania Ave, Washington, DC 20500')
    @loc = GeoKit::Geocoders::Geocoder.yahoo_geocoder('545 The West Mall, Toronto, ON')
  end
  
end
