require 'date'

class UpdateOfferStatusJob < ApplicationJob
  queue_as :default

  def perform()
    offers = Offer.where(status: "active").where("CAST(deadline AS DATE) < ?", Date.today)
    offers.each do |offer| 
      if offer.deadline < Date.today && offer.target_reached?
        offer.status = 'accomplished'
        offer.save(validate: false)
      elsif offer.deadline < Date.today
        offer.status = 'expired'
        offer.save(validate: false)
      end
    end
  end
end
