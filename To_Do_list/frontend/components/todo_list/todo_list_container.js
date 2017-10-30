import { connect } from 'react-redux';
import { allTodos } from '../../reducers/selectors';
import { receiveTodos, receiveTodo, removeTodo, updateTodo }
  from '../../actions/todo_actions';
import TodoList from './todo_list';

const mapStateToProps = state => ({
  todos: allTodos(state),
  state
});

const mapDispatchToProps = dispatch => ({
  receiveTodos: () => dispatch(receiveTodos()),
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo.currentTarget.value)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
