class MessagesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
  end

  def receives_data
	  name = params['name']
  	message = params['message']
  	puts name
  	puts message
  	Pusher.trigger('my-channel', 'my-event', {
      message: message, name: name
    })
    render "message"
  end
end