class Image < ActiveRecord::Base    
 has_attached_file :pic, :styles => 
          { :medium => "300x300>", :thumb => "100x100>" }

 validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
end
