require 'date'

class UpdateOfferStatusJob < ApplicationJob
  queue_as :default

  def perform()
    offers = Offer.where(status: "active")
    offers.each do |offer| 
      if offer.deadline < Date.today && offer.target_reached?
        offer.status = 'accomplished'
      elsif offer.deadline < Date.today
        offer.status = 'expired'
      end
    end
  end
end
