const MessageStore = require('./message_store');

const Sent = {
  render: function(){
    let container = document.createElement('ul');
    container.className = 'messages';
    let SentMessages = MessageStore.getSentMessages();

    SentMessages.forEach( (el) => {
      let currentMessage = this.renderMessage(el);
      container.appendChild(currentMessage);
    });

    return container;
  },
  renderMessage: function (message) {
    let li = document.createElement('li');
    li.className = 'messages';
    li.className = "style_Content";
    li.innerHTML = `
      <span class="to"> ${message.to} </span>
      <span class="subject"> ${message.subject}: </span>
      <span class="body"> ${message.body} </span>
    `;
    return li;
  }
};

module.exports = Sent;
