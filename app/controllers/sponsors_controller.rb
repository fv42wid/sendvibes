class SponsorsController < ApplicationController
  
  def show

  end

  def new

  end

  def create
    customer = if current_user.stripe_id?
                 Stripe::Customer.retrieve(current_user.stripe_id)
               else
                 Stripe::Customer.create(email: current_user.email)
               end
    subscription = customer.subscriptions.create(
      source: params[:stripeToken],
      plan: "vibe_sponsor"                                           
    )                     

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id
    }

    options.merge!(
      card_last_4: params[:card_last_4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    ) if params[:card_last_4]
    
    current_user.update(options)
    redirect_to root_path
  end
end
