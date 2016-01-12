class ChargesController < ApplicationController
  def create
    #creates a stripe customer object, for charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    customer: customer.id, #NOT the user_id in app
    amount: Amount.default,
    description: "Donate to keep this LFG project running - #{current_user.email}",
    currency: 'usd'
    )

    flash[:notice] = "Thank you for your purchase, #{current_user.email}!"
    redirect_to user_path(current_user)

    #Stripe will send back CardErrors with message
    #when something goes wrong
    #rescue block catches and displays errors

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Membership - #{current_user.email}",
      amount: Amount.default
    }
  end

  class Amount
    def self.default
      1500
    end
  end
end
