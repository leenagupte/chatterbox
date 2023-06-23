class ChatterController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  skip_before_action :verify_authenticity_token, :only => [:ask]

  def show; end

  def ask
    @question_text = strip_tags(params[:question_text]).presence

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: @question_text}], # Required.
          temperature: 0.7,
      })

    @chat_response = response.dig("choices", 0, "message", "content")

    render :show
  end
end
