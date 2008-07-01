# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def map(options = {})
    gmap_defaults = {:width => "525", :height => "500",
      :center => "-122.01686382293701, 37.31932181336203",
      :zoom => "2",
      :key => MY_CONFIG[:google_key]
    } 
    @gmap = gmap_defaults.merge(options)
    @gmap[:marker] = @gmap[:center] if @gmap[:marker].nil?

    # Convert from single marker syntax to multiple markers syntax
    marker_hash = {}
    marker_hash[:point] = @gmap[:marker] if @gmap[:marker]
    marker_hash[:text] = @gmap[:text] if @gmap[:text]
    marker_hash[:url] = @gmap[:url] if @gmap[:url]
    markers = {:markers => [marker_hash]}
    @gmap = markers.merge(@gmap)

    render(:partial => "layouts/google_map", :no_layout => true)
  end
end
