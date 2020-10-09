# React Notes


## components 

Allows you to create components usually by extending the React.Component class.

Classes have a render() method that returns a description of what we want to see on the screen. It actually returns a React Element which is a lightweight description of what to render  . During the tutorial you will use the <div/> syntax however m the JSX syntax is more commonly used.

It is important to note then when creating components with constructors you must call the parent constructor on the first line: `super(props)`

### Passing data to components

This is done via props (properties)

Example blow shows how a value is passed from one class to another:

```
class Board extends React.Component{
 renderSquare(i){
    return <Square value={i}/>; // return a square component passing property "value" with value i
 }
}

class Square extends React.Component{
 render(){
    return(
        <button className="square">
         {this.props.value} // access my property "value"
        </button>
    );
 }
}
```

### Saving state

State can be saved by initialising values in a component's constructor and then updated using setState()

```
 class Square extends React.Component{
  constructor(props)
  this.state = {
   value: null, // create state here
  }

render(){
    return(
        <button
        onClick={()=> this.setState{value : "X"}}> // example of setting state 
            {this.state.value} // example of accessing state
        </button>
        );
    }
}
```
    
#### Mutability

Try to build pure component (if something is pure it doesn't alter the state of anything outside of its own scope).


### Function Components

In React function components are a simpler way of writing components that only have a render method.

```
 class Square extends React.Component{
render(){
    return(
        <button
        onClick={()=> this.props.onClick()}> // example of passing a function via props 
            {this.props.value} 
        </button>
        );
    }
}

```
The above component becomes:

```
function Square(props){
    return(
     <button className="square" onClick={ props.onClick }>
        {props.value}
    </button>
    );
}

```

