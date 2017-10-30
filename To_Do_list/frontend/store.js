import {createStore} from 'redux';
import reducer from './reducers/todo_reducer';

const configureStore = createStore(reducer);

export default configureStore;
