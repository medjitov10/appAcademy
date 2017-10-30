import { RECEIVE_TODOS,
         RECEIVE_TODO,
         REMOVE_TODO,
         UPDATE_TODO,
         receiveTodos,
         receiveTodo,
         removeTodo} from '../actions/todo_actions.js';
import merge from 'lodash/merge';

const _defaultState = {
      1: {
        id: 1,
        title: 'wash car',
        body: 'with soap',
        done: false
      },
    2: {
      id: 2,
      title: 'wash dog',
      body: 'with shampoo',
      done: true
    }
};

const todosReducer = (state = _defaultState, action) => {
  let nextState = {};
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach( el => { newState[el.id].push(el); });
      return newState;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      return merge({}, state, newTodo);
    case REMOVE_TODO:
      nextState = merge({}, state);
      delete nextState[action.todo.id];
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;
