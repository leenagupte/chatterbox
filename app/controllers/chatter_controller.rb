class ChatterController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  skip_before_action :verify_authenticity_token, :only => [:ask]

  def show; end

  def ask
    @question_text = strip_tags(params[:question_text]).presence
    @chat_response = OpenAIService.new(@question_text).call

    render :show
  end
end
