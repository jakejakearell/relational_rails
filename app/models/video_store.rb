class VideoStore < ApplicationRecord
  has_many :movies, :dependent => :destroy
end
