class PagesController < ApplicationController

    skip_before_action :authenticate_user!

    def about
    end

    def contact
    end

    def submit_contact
        # Handle contact form submission
        name = params[:name]
        email = params[:email]
        phone = params[:phone]
        subject = params[:subject]
        message = params[:message]
        
        # Here you can add email sending logic or save to database
        # For now, just show success message

        flash[:notice] = "Thank you for contacting us, #{name}. We will get back to you soon!"
        redirect_to contact_path
    end
end
