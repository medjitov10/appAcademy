const Router = require('./router');
const Inbox = require('./inbox');
const Sent = require('./sent');
const Compose = require('./compose');
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
