import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {

  render() {
    const { todos, receiveTodo, removeTodo } = this.props;
    const todoItems = todos.map(todo => (
        <TodoListItem
          todo={todo}
          receiveTodo={ receiveTodo }
          removeTodo={ removeTodo }
         />
      )
    );

    return(
      <div>
          { todoItems }
          <TodoForm receiveTodo={ receiveTodo }/>
      </div>
    );
  }
}

export default TodoList;
