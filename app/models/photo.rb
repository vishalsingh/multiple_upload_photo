class Photo < ActiveRecord::Base
  belongs_to :album
  has_many :tags, :dependent => :destroy
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:tag_name].blank? }, :allow_destroy => true

 #paperclip
  has_attached_file :photo,
                    :styles => {
                    :thumb=> "100x100#",
                    :small  => "400x400>" }

end
