require 'date'

class UpdateOfferStatusJob < ApplicationJob
  queue_as :default

  def perform()
    offers = Offer.where(status: "active")
    offers.each do |offer| 
      if offer.deadline < Date.today && offer.target_reached?
        offer.status = 'accomplished'
        offer.save
      elsif offer.deadline < Date.today
        offer.status = 'expired'
        offer.save
      end
    end
  end
end
