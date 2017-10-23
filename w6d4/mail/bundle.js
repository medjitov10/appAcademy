/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Router = __webpack_require__(1);
const Inbox = __webpack_require__(2);
const Sent = __webpack_require__(4);
const Compose = __webpack_require__(5);
const ROUTES = {
  compose: Compose,
  inbox: Inbox,
  sent: Sent
};

document.addEventListener('DOMContentLoaded', () => {
  let navItems = document.querySelectorAll('.sidebar-nav li');
  let content = document.querySelector('.content');

  let router = new Router(content, ROUTES);
  router.start();

  window.location.hash = "#inbox";

  navItems.forEach( (el) => {
    el.addEventListener('click', (e) => {
      let innerText = el.innerText.toLowerCase();

      window.location.hash = "";
      window.location.hash+="#" + innerText;
    });
  });



});


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class Router{
  constructor(node, routes){
    this.node = node;
    this.routes = routes;
  }


  start(){
    window.addEventListener("hashchange", () => {
      this.render();
    });
  }

  render(){
    this.node.innerHTML = "";
    const component = this.activeRoute();

    if ( component ) {
      this.node.appendChild(component.render());
    }

  }

  activeRoute(){
    let hashFragment = window.location.hash;
    hashFragment = hashFragment.slice(1, hashFragment.length);
    let component = this.routes[hashFragment];
    return component;
  }
}

module.exports = Router;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports) {

class Message{
  constructor(from, to="", subject="", body=""){
    this.from = from;
    this.to = to;
    this.subject = subject;
    this.body = body;
  }
}

let messageDraft = new Message;
let messages = JSON.parse(localStorage.getItem('messages'));

if(!messages){
  messages = {
    sent: [
      {
        to: "friend@mail.com",
        subject: "Check this out",
        body: "It's so cool"
      },
      {
        to: "person@mail.com",
        subject: "zzz",
        body: "so booring"
      }
    ],
    inbox: [
      {
        from: "grandma@mail.com",
        subject: "Fwd: Fwd: Fwd: Check this out",
        body: "Stay at home mom discovers cure for leg cramps. Doctors hate her"
      },
      {
        from: "person@mail.com",
        subject: "Questionnaire",
        body: "Take this free quiz win $1000 dollars"
      }
    ]
  };

}

let MessageStore = {
  getInboxMessages: function(){
    return messages.inbox;
  },
  getSentMessages: function(){
    return messages.sent;
  },
  updateDraftField: function(field, value){
    messageDraft[field] = value;
  },
  getMessageDraft() {
    return new Message;
  },
  sendDraft: function(){
    messages.sent.push(messageDraft);
    messageDraft = new Message;
    localStorage.setItem('messages', JSON.stringify(messages));
  }
};


module.exports = MessageStore;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

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


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

const Compose = {
  render: function() {

    let div = document.createElement('div');
    div.className = 'new-message';
    div.innerHTML = this.renderForm();

    div.addEventListener('change', (e) =>{
      let target = e.target;
      MessageStore.updateDraftField(target.name, target.value);
    });

    div.addEventListener('submit', e => {
      e.preventDefault();
      MessageStore.sendDraft();
      location.hash = "inbox";
    });

    return div;
  },
  renderForm: function() {
    let currentMessage = MessageStore.getMessageDraft();
    let html = `
      <p class="new-message-header"> New Message </p>
      <form class="compose-form">
        <input
          placeholder="Recipient"
          name="to"
          type="text"
          value = "${currentMessage.to}"
        >
        <input
          placeholder="Subject"
          name="subject"
          type="text"
          value = "${currentMessage.subject}"
        >
        <textarea name="body" rows="20">${currentMessage.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">
          Sent
        </button>
      </form>
    `;
    return html;
  }
};

module.exports = Compose;


/***/ })
/******/ ]);