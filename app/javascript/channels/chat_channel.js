import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ChatChannel", joined_group_id: joinedGroupId }, {
  received(data) {
    // Append the new message to the message list
    const messages = document.getElementById('messages');
    messages.innerHTML += data.message;
  }
});