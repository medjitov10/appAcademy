import React from 'react';
import merge from 'lodash/merge';
class TodoListItem extends React.Component {
  constructor(props){
    super(props);
    this.state = { done: props.todo.done };
    this.changeDone = this.changeDone.bind(this);
  }

  changeDone(e){
    e.preventDefault();
    let toggleTodo = merge ({}, this.props.todo,
      { done: !this.props.todo.done }
    );
    this.props.receiveTodo(toggleTodo);

  }

  render() {
    const { todo ,  removeTodo } = this.props;

    return (
      <li className="todo-list-item">
        <div className="todo-header">
          <h3>{ todo.title }</h3>
          <button onClick={this.changeDone}>
            { todo.done ? "Done" : "Undo" }
          </button>
          <button onClick={removeTodo} value={todo.id}>X</button>
        </div>

      </li>
    );
  }
}

export default TodoListItem;
