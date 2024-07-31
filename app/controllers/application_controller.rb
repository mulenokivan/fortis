class ApplicationController < ActionController::Base
  def render_alert(model)
    flash.now[:alert] = model.errors.messages.values.join("\n")
    render turbo_stream: turbo_stream.update(
      "#{model.class.to_s.downcase}-#{model.id}-alert",
      partial: "alert",
      locals: { model: model}
    )
  end
end
