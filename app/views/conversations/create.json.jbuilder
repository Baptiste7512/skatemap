if @conversation.persisted?
  json.form json.partial!("conversations/form.html.erb", skatespot: @skatespot, conversation: Conversation.new)
  json.inserted_item json.partial!("skatespots/conversation.html.erb", conversation: @conversation)
else
  json.form json.partial!("conversations/form.html.erb", skatespot: @skatespot, conversation: @conversation)
end
