import React from 'react';
import ReactDOM from 'react-dom';
import store from './store';
import Root from './components/root.jsx';
import Selector from './reducers/selectors';

window.Selector = Selector;
window.store = store;

document.addEventListener('DOMContentLoaded', () =>{
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
