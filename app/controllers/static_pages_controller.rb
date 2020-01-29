class StaticPagesController < ApplicationController
  def welcome
    features = [
    "Choose from premade quizzes on a variety of topics",
    "Make your own quizzes to customize your learning",
    "Compare your scores with other users"
    ]

    respond_to do |format|
      format.html { render :welcome, locals: {features: features } }
    end
  end
  
  def about
    respond_to do |format|
      format.html { render :about }
    end
  end

  def contact
    respond_to do |format|
      format.html { render :contact, locals: { feedback: {} } }
    end
  end

  def leave_feedback
    required = [ :name, :email, :reply, :feedback_type, :message]
    form_complete = true
    required.each do |f|
      if params.has_key? f and not params[f].blank?
        # do nothing
      else
        form_complete = false
      end
    end
    if form_complete
      form_status_msg = 'Thanks!'
    else
      form_status_msg = "Please fill in remaining fields."
    end
    respond_to do |format|
      format.html { render :contact, locals: { status_msg: form_status_msg, feedback: params } }
    end

  end
end
