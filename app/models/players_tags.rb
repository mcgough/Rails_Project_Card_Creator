class PlayersTags < ActiveRecord::Base
  belongs_to :player
  belongs_to :tag
end
