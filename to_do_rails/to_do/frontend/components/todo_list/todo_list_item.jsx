import React from 'react';
import merge from 'lodash/merge';
class TodoListItem extends React.Component {
  constructor(props){
    super(props);
    this.state = { done: props.todo.done };
    this.changeDone = this.changeDone.bind(this);
    this.deleteThis = this.deleteThis.bind(this);
  }

  changeDone(e){
    e.preventDefault();
    let toggleTodo = merge ({}, this.props.todo,
      { done: !this.props.todo.done }
    );
    this.props.updateTodo(toggleTodo);
  }

  deleteThis(e){
    e.preventDefault();
    this.props.deleteTodo(this.props.todo);
  }

  render() {
    const { todo ,  deleteTodo } = this.props;

    return (
      <li className="todo-list-item">
        <div className="todo-header">
          <h3>{ todo.title }</h3>
          <button onClick={this.changeDone}>
            { todo.done ? "Done" : "Undo" }
          </button>
          <button onClick={this.deleteThis} value= {todo}>X</button>
        </div>

      </li>
    );
  }
}

export default TodoListItem;
