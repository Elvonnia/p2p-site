class Stockfile < ApplicationRecord
	belongs_to :room
	validates_presence_of :id
	validates_numericality_of :size, :message=>"Error Message. No size limit!"
end
