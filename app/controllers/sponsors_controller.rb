class SponsorsController < ApplicationController
  
  def show
    @sponsor = Sponsor.find(params[:id])
  end

  def new
    @cause_id = params[:chargeable][:cause_id]
    @type = params[:chargeable][:type]
  end

  def create
    customer = if current_user.stripe_id?
                 Stripe::Customer.retrieve(current_user.stripe_id)
               else
                 Stripe::Customer.create(email: current_user.email)
               end
    #subscription = customer.subscriptions.create(
    #  source: params[:stripeToken],
    #  plan: "vibe_sponsor"                                           
    #)                     
    begin
      charge = Stripe::Charge.create(
        :amount => 399,
        :currency => "usd",
        :source => params[:stripeToken],
        :description => "Sponsorship of Cause #{params[:cause_id]}"
      )
    rescue Stripe::CardError => e
      raise e
    end

    options = {
      stripe_id: customer.id
      #stripe_subscription_id: subscription.id
    }

    options.merge!(
      card_last_4: params[:card_last_4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    ) if params[:card_last_4]
    
    current_user.update(options)
    @charge = Charge.new(
      user_id: current_user.id,
      chargeable_id: params[:cause_id],
      chargeable_type: params[:type].capitalize,
      description: "Sponsorship of cause #{params[:cause_id]}",
      amount: 399,
      currency: "usd",
      stripe_charge_id: charge.id,
      card_last_4: params[:card_last_4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    )
    @charge.save
    redirect_to root_path
  end

  private
  def sponsor_params
    params.require().permit(:cause_id, :type)
  end
end
