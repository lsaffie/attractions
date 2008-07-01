class Attraction < ActiveRecord::Base
	has_many :attraction_line_items
	
	has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>'
                 #:thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
end
