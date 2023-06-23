class OpenAIService
  attr_reader :question_text

  def initialize(question_text)
    @question_text = question_text
  end

  def call
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: [{ role: "user", content: question_text}], # Required.
          temperature: 0.7,
      })

    response.dig("choices", 0, "message", "content")
  end

private

  def client
    @client ||= OpenAI::Client.new
  end
end
