# React Notes

### Creating a basic react app
For now I am using `npx create-react-app name-of-app`
Then running `npm start` in the directory of `name-of-app`

But there are other toolchains you should look at in the future: [React docs: create a new react app]( https://reactjs.org/docs/create-a-new-react-app.html )


### Elements
Elements are the basic building blocks of react. Typically they are described using JSX.

```
const name = "Chris";
const my_element = Hello, {name}; 
```

### Components
Conceptually similar to JS Functions, components let you split the UI into independent and reusable pieces.

It is important to note that user defined components should start with a capital letter.  React treats components starting with a lowercase letter as a DOM tag.

All components must act as a pure function (that is they do not alter their props). Props are immutable!

A component also has access to `state`, similar to props but private and fully controlled by the component it belongs to.

For functional components (a component with only a render method) you can declare them two ways, the former being more common.

1.
```
function Welcome(props){
	return <h1>Hello, {name}</h1>;
}
```
2. 
```
class Welcome extends React.Component{
	render(){
		return <h1>Hello, { this.props.name }</h1>;
	}
}
```

If you have a more complex component (more than just a render function) you will need to use method two of creating it.

#### Component constructors
If your component has a constructor it is important to have a call to the parent constructor as the first line (otherwise how would you sensibly build an object?)

```
class Foo extends React.Component{
 constructor(props){
	super(props);
	//other good stuff here
 }

 render(){ return(  <p>bar</p>); }
}
```
#### Managing State
Use the `setState` method to update state as needed.

There are 3 rules when using state.

1. Never modify state directly: `this.state.foo = 'bar';`
2. You can only assign state in the Constructor.
3. State updates maybe Asynchronous
	 The following example is unpredictable: `this.setState({counter: this.state.counter + this.props.increment,});
	 
	 If you need to mimic synchronous behaviour use the second form of setState that accepts a function:
	 `this.setState((state,props)=>({counter: state.counter + props.increment}));

### Rendering to the DOM
React has a virtual DOM and only updates elements as and when needed. 

Typically react elements are rendered to a HTML element with the id "root" (usually a div)

You will need to import the following: `import ReactDOM from 'react-dom'`

**Rendering Elements**
```
import React from 'react'
import ReactDOM from 'react-dom'

const name = "Kit";
const element = <h1>Hello, {name}</h1>;

ReactDOM.render(
	element,
	document.getElementById('root')
);

```

**Rendering Components**

Note: When react encounters an element representing a user defined component it passes all JSX attributes and children to the component in  a single object `props`.

```
 import React from 'react'
 import ReactDOM from 'react-dom'

 function Welcome(props){
		return <h1>Hello, { this.props.name }</h1>;
 }

 const my_component = <Welcome name="Kit"/>

 ReactDOM.render(
   my_component,
	document.getElementById('root')
 );

```

### Mounting / Unmouting
This refers to the creation and removal of resources used by components when they are added to and removed from the DOM.

There are two "lifestyle methods" in a class you can use to do this: `componentDidMount()` and `componentWillUnmount()`

**componentDidMount** is called after the component output has been rendered to the DOM.


