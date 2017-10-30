import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store';
import Root from './components/root.jsx';
import Selector from './reducers/selectors';


document.addEventListener('DOMContentLoaded', () =>{
  const store = configureStore();
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
