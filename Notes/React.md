# React Notes

### Creating a basic react app
For now I am using `npx create-react-app name-of-app`
Then running `npm start` in the directory of `name-of-app`

But there are other toolchains you should look at in the future: [React docs: create a new react app]( https://reactjs.org/docs/create-a-new-react-app.html )

### JSX
Javascript XML. Gives you the power of template languages and javascript combined.

Single line example: `const my_element = <h1>Hello, {name}</h1>;` 

Multi line example: 
```
 const my_element = (
<ul>
	<li>foo</li>
	<li>bar</li>
	<li>foobar</li>
</ul>
 );
```
HTML must be wrapped in ONE top level element.

```
 const my_element = (
 <div> // top level element
  <h1>foo</h1> 
	<h1>bar</h1>
 </div>
 );
```
JSX follows XML rules and so HTML elements must be properly closed:
`const my_element = <input type="text" />;`

### Elements
Elements are the basic building blocks of react. Typically they are described using JSX.

```
const name = "Chris";
const my_element = <h1>Hello, {name}</h1>; 
```

### Components
Conceptually similar to JS Functions, components let you split the UI into independent and reusable pieces.

It is important to note that user defined components should start with a capital letter.  React treats components starting with a lowercase letter as a DOM tag.

All components must act as a pure function (that is they do not alter their props).

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
#### Props
Props are immutable. Read only. You can't change them, okay?

#### State
A component also has access to `state`, similar to props but private and fully controlled by the component it belongs to.

Everytime a component's state changes the component is re-rendered.

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

Typically react elements are rendered to a HTML element with the id "root". This doesn't have to be be a div and the id doesn't have to be root.

You will need to import the following: `import ReactDOM from 'react-dom'`

**Rendering Elements**
```
import React from 'react';
import ReactDOM from 'react-dom';

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
 import React from 'react';
 import ReactDOM from 'react-dom';

 function Welcome(props){
		return <h1>Hello, { this.props.name }</h1>;
 }

 const my_component = <Welcome name="Kit"/>

 ReactDOM.render(
   my_component,
	document.getElementById('root')
 );

```
### Components in separate files

See below for keeping a component in a separate file.

`foobar.js`

```
import React from 'react';
import ReactDOM from 'react-dom';

class Foobar extends React.Component{
	render(){
		return <h1>Foobar</h1>;
	}
}

export default Foobar;
```

To use it in other files you need to import from other files, similar to ES6 modules.

### Lifecycle of Components

Components have 3 main phases: Mounting, Updating, Unmounting

#### Mounting
This means putting elements into the DOM. When a component is mounted react calls the following methods in order:

1. constructor()
2. getDerivedStateFromProps()
		Only recommended for rare uses by react docs. Article on alternatives to using it
		https://reactjs.org/blog/2018/06/07/you-probably-dont-need-derived-state.html	
3. render()
4. componentDidMount()
		This is called after the component has been rendered. Good for statements that need to be executed when the component is in the DOM. For example using setTimeout()
5. render() - this is the only non-optional method

#### Updating
A component is updated whenever there are changes in state or props.

The following methods get called in order:
1. getDerivedStateFromProps()
2. shouldComponentUpdate()
		Returns a boolean on whether the component should continue updating. Go figure. Defaults to `true`.
3. render()
4. getSnapshotBeforeUpdate(prevProps, prevState)
	Gives you access to the props and state before the update. If this method is present you will need to include componentDidUpdate or you will get an error.
5. componentDidUpdate()
	Called after the component is rendered in the DOM.	

#### Unmounting
When a component is removed from the DOM.

1. componentWillUnmount()
	Useful for cleaning up resources used by the component. For example timers

### React Events

Events in react are written using camelCase rather than all lowercase in JS. For example `onClick` vs `onclick`.

React event handlers are written in {} rather than "". `onClick={foobar}` vs `onClick="foobar()"`

It is a good practice to put event handlers as a method inside the component class.

Better to use arrow functions as they are already bound to the component (as is their nature...) if you do use regular functions you mus tuse the bind method to the component instance.

However if you use arrow functions and want access to the react event object you must supply it manually (this is done for you when using bind on regular functions)
`<button onClick={(ev) => this.foo("bar",ev);}> Click </button>`

#### Preventing default action
You cannot simply return false to prevent the default behaviour of an element. Use `event.preventDefault()`
