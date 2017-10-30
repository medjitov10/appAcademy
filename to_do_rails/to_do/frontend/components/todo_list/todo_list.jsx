import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  componentDidMount() {
   this.props.requestTodos();
  }

  render() {
    const { todos, createTodo, updateTodo, deleteTodo } = this.props;
    let i = 1;
    const todoItems = todos.map(todo => (
        <TodoListItem
          key={i++}
          todo={todo}
          updateTodo = { updateTodo }
          deleteTodo = { deleteTodo }
         />
      )
    );

    return(
      <div>
          { todoItems }
          <TodoForm createTodo={ createTodo }/>
      </div>
    );
  }
}

export default TodoList;
