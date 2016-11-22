class Stockfile < ApplicationRecord
	belongs_to :room, optional: true
	validates_presence_of :id
	validates_numericality_of :size, :message=>"Error Message. No size limit!"
end
