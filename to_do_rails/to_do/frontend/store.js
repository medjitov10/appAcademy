import { createStore, applyMiddleware } from 'redux';
import RootReducer from './reducers/todo_reducer';
import thunkMiddleware from './middleware/thunk';


const configureStore = (preloadedState = {}) => {
  return createStore(
    RootReducer,
    preloadedState,
    applyMiddleware(thunkMiddleware, logger)
  );
};

const logger = store => next => action => {

  console.log('Action received:', action);
  console.log('State pre-dispatch:', store.getState());

  let result = next(action);

  console.log('State post-dispatch:', store.getState());

  return result;
};


export default configureStore;
