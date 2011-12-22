class User < ActiveRecord::Base
  has_many :albums, :dependent => :destroy



  def count_album
  a = self.albums.count
  return a 
  end

  
end
