import React from 'react';
import store from '../../store';

class TodoForm extends React.Component{
  constructor(props){
    super(props);
    this.state = { title: '', body: '', done: false };
    this.submitTask = this.submitTask.bind(this);
  }

  linkState(key) {
    return (event => this.setState({ [key]: event.currentTarget.value}));
  }

  submitTask(e){
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: new Date().getTime() });
    console.log();
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render(){
    return (
      <div>
        <form onSubmit={this.submitTask}>
          <input onChange={this.linkState('title')} value={this.state.title}/>
          <input onChange={this.linkState('body')} value={this.state.body}/>
          <button >Add task!</button>
        </form>
      </div>
    );
  }
}

export default TodoForm;
