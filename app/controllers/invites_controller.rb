class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params) # Make a new Invite
    @invite.sender_id = current_user.id # set the sender to the current user
    @invite.league_id = params[:league_id]
        # binding.pry
    @league = League.find(params[:league_id])

    if @invite.save

      #if the user already exists
        if @invite.recipient != nil 

           #send a notification email
           #InviteMailer.existing_user_invite(@invite).deliver 

           #Add the user to the user group
           # Membership.create!(
           #      :user_id => @invite.recipient.id,
           #      :league_id => @invite.league_id
           #    )
           redirect_to @league, notice: 'You did it!'

        else
            #InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
            #send the invite data to the mailer
            redirect_to @league, notice: "That person doesn't exist. Tell them to sign up!"
        end
      else
          # invite creation failed
          redirect_to @league, notice: 'Could not send invite.' 
     end
  end

  private
  def invite_params
    params.require(:invite).permit(:league_id, :email) #if params[:movie]
  end
end
