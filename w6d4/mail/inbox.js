const MessageStore = require('./message_store');

const Inbox = {
  render: function(){
    const container = document.createElement("ul");
    let InboxMessages = MessageStore.getInboxMessages();

    InboxMessages.forEach( (el) => {
      let CurrentMessage = this.renderMessage(el);
      container.appendChild(CurrentMessage);
    });

    container.className = "messages";

    return container;
  },
  renderMessage: function(message){
    const li = document.createElement('li');
    li.className = "messages";
    li.className = "style_Content";
    li.innerHTML = `
      <span class="from"> ${message.from} </span>
      <span class="subject"> ${message.subject}: </span>
      <span class="body"> ${message.body} </span>
    `;
    return li;
  }
};

module.exports = Inbox;
