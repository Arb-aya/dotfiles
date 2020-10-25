# React Notes

## JSX 
We can create html elements using `React.createElement()` or using JSX.

To create a div we can use: `React.createElement('div',null)`
To create a div with a css class we can use: `React.createElement('div',{className: 'App'})`
To create nested elements we can use: `React.createElement('div',className: 'App', React.createElement('h1',null,'I am a child node'))`


This is the same as the JSX code:  
```
 return(
	<div className="App">
		<h1>I am a child node</h1>
	</div>
 );
```

JSX needs one root element per component.

### Rendering Adjacent JSX elements without a root element
You can return an array of elements with a unique key property.

```
render(){
	return(
		<div>
			<p>foo</p>
			<p>bar</p>
		</div>
	);	
}
```

then becomes

```
render(){
	return[ 
		<p key="p1">foo</p>,
		<p key="p2">bar</p>
	];	
}

```

You can also achieve a similar effect by creating a higher order component to wrap your JSX in, but doesn't affect the page structure (like a div)

```
const aux = props=> props.children;
export default aux;
```

Presuming this has been imported the render function would then become:


```
render(){
	 <Aux>
		<p key="p1">foo</p>,
		<p key="p2">bar</p>
	</Aux>
}

```

In React versions 16.2 and higher you can use `<React.fragment>` which is a built in version of the aux element demonstrated above. 

## Setting state correctly (when depending on old state)
Using setState does not ***guarantee*** that an update cycle will be triggered (and therefore render() run) immediately. 

This means that the snippet below might appear to work, but it's behaviour is not guaranteed.
```
this.setState({
  foobar: this.state.foobar + 1	
});
```

In cases where you need to achieve this you should use the following syntax:

```
this.setState((prevState, props) => {
		return {
	     foobar: prevState.foobar + 1	
		};
});
```
## Using proptypes
These allow you to dictate which props (and their type) your component uses.

These is another package called `prop-types` (npm install --save prop-types)

You then import them into the component you want to use them with: `import PropTypes from "prop-types";`

After your component declaration (either class of functional) you add `componentName.propTypes = { click: PropTypes.func };` to state that you expect a prop of click which is a function.

## Refs
On any element you can add a special property `ref`. You can pass a fuction that takes one parameter, which is a reference to the element that ref is defined on. For example:

```
return (
			<input type="text" 
			onChange={this.props.change} 
			ref={(inputEl) => {inputEl.focus()}}
			/>	
		);
```
You can also add this reference as a class property:

```
return (
			<input type="text" 
			onChange={this.props.change} 
			ref={(inputEl) => {this.elementReference=inputEl}}
			/>	
		);
```

In react 16.3 and later you can also use references as follows:

```
import React from "react";

constructor(){
	super(props);
	this.inputElement = React.createRef();
}

return (
			<input type="text" 
			onChange={this.props.change} 
			ref={this.inputElement}
			/>	
		);
```

### Refs with functional components

Import the `useRef` hook from react.

```
import React {useEffect, useRef} from "react";

const fooBar = (props) => {
  const pRef = useRef(null); 
	
	useEffect(() => {
		pRef.current.onCopy(...);

	},[]);//remember with no dependencies, this useEffect will only run once.
	

  return <p ref={fooBar}> foobar </p>;
};

```
## React hooks

### State hooks for functional components
When using the useState hook in functional components, it's important to know that the function returned from useState doesn't merge the new state with the old one. But rather replaces it.
When passing in arguments to functions passed as props we have two ways:

```
click={this.foo.bind(this,bar)}
```

```
click={()=> this.foo(bar)}
```
### useRef

See above.

### useEffect
Has a similar effect to using both componentDidMount and componentDidUpdate

`import {useEffect} from 'react';`

As a default useEffect takes a function as an argument that will run every render cycle.

#### useEffect as componentDidUpdate
If you only want to run the function when certain props or state propeties change, you can pass in an array to denote which props / state properties they are.

`useEffect(() => { console.log("foobar");}, [props.foo, props.bar])`

If you wanted different functions to run for different prop changes you can use multiple useEffect calls.

`useEffect(() => { console.log("foo");}, [props.foo])`
`useEffect(() => { console.log("bar");}, [props.bar])`

#### useEffect as componentDidMount
If you pass in an empty array of dependencies, the function will run the first time and only the first time.

#### useEffect as componentWillUnmount

You can return a function that is run when the component is unmounted.

```
import React, {useEffect} from "react";

const Foobar = () => {
	useEffect(() => {
		//logic here	
		return () => { //cleanup work}
	},[]); // Important to note you need this empty array
	
	return (
		 <p>foobar</p>	
			);
}
```

The example below will run on every update cycle when it has no dependencies or named dependencies.
```
import React, {useEffect} from "react";

const Foobar = () => {
	useEffect(() => {
		//logic here	
		return () => { //cleanup work}
	});
	
	return (
		 <p>foobar</p>	
			);
}
```

## Lists of components
When generating lists of components each child component needs to be given a unique `key` property. If you have nested components being generated in a list, then the key should be supplied to the outer most component.

## Radium - for inline styling of components
When applying styles inline with JSX, there are some limitations. We can't use pseudo-selectors and media queries. But you can use `Radium`.

It is known as a higher order component. This can be used with functional and class components.
Once installed you need to import it `import Radium from "radium";` and then when exporting your component wrap it in a function call to Radium: `export default Radium(foobar);`


An example of targetted psuedo elements using radium.
```
import React from 'react';
import Radium from 'radium';

const foobar = () => {
  const style = {
	   backgroundColor: 'green',
		 ":hover":{
				backgroundColor: 'red',
		 } 
	}
	
	return <p style={style}> Foobar </p>
}

export default Radium(foobar);
```

If you want to dynamically access psuedo stylings: `style[':hover']={backgroundColor='salmon'};`


Radium also allows you to use media queries and animations:

```
import React from 'react';
import Radium from 'radium';

const foobar = () => {
  const style = {
	   backgroundColor: 'green',
		 "@media (min-width: 600px)":{
		    width: '450px';
		 } 
	}
	
	return <p style={style}> Foobar </p>
}

export default Radium(foobar);
```
If you use radium to transform a component an extra step is needed. You need to wrap the entire application (not just the component using media queries or animations ) in the StyleRoot component.
```
import React from 'react';
import Radium, {StyleRoot} from 'radium';
import Foobar from './foobar';
class App extends React.Component {
	render(){
		return (
		<StyleRoot>
      <Foobar /> 
		</StyleRoot>
		);
	}
}

export default Radium(App);
```

## Styled Components - for inline styling of components
[ styled-components.com ]( https://styled-components.com )

This makes use of tagged template literals (in essence a function that processes a template literal)

To begin you need to import `import styled from 'styled-components';

```
import React from 'react';
import styled from 'styled-components';

const styledP = styled.p`
  background-color: ${(props) => props.foobar ? "red" : "green"}; // example of conditional / dynamic styles
	
	@media (min-width: 500px){
		background-color: green;
	}

&:hover{
	background-color: lightgreen;
}
`;
const foobar = () => {
	return <StyledP> foobar </StyledP>; 
}

export default foobar;
```
## CSS Modules

### Note on react scripts version

In V2 and higher, you do not need to eject or modify the config files. You can simply name your css files like `foo.module.css` and import the styles from them like `import styles from '.foo.module.css';`

Allows CSS to live in CSS files whilst being scoped to a component. 

First of all it's important to run `npm run eject`

This will expose the config and scripts folder. As we want to change how our files are bundled (using webpack) we want to look at the `webpack.config.dev.js` and `webpack.config.prod.js` files in the config folder.

For what we want to achieve you need to look for `test: /\.css$/,`. We want to change the options for 'css-loader'

We want to include the following options:

```
	modules: true,
	localIdentName: '[name]__[local]__[hash:base64:5]'
```

You will want to add these to both the dev and prod files.


This will then change how you import css into your components.

`import foo from './Bar.css';`

This will now import all the classes defined in Bar.css as properties of the foo object. We can then assign these to our components:

` <button className={foo.Button}/>`

This will return a dictionary of the format `foo[cssClassName] = newHashedUniqueCssName` therefore ensuring that these styles are limited to this component.

## Error boundaries

Create a new directory called ErrorBoundary and in there a component for handling errors.

```
import React from 'react';

class Foobar extends React.Component{
	state = {
		hasError: false, 
		errorMessage: '',
	}

	componentDidCatch= (error,info) => {
	 this.setState({hasError: true, errorMessage: erorr});
	}

	render(){
		if(this.state.hasError){
			return <p>{ this.state.errorMessage }</p>;
		}else{
			return this.props.children;
		}

	}
}

export default Foobar;
```

Then you can surround this component with any possible problematic components:

```
import React from 'react';

const Problematic = () => {
  return throw new Error("I'm a problem");
}
```


`<Foobar> <Problematic /></Foobar>`


## Class based  vs functional components

General speaking, use class based to manage state or if you need lifecycle hooks.
Use functional components for every other class (unless you are working on a project that uses react hooks).

### Class based 
* Can access state
* Access state and props via "this"
* Can use lifecycle hooks

### Functional 
* Can access state via useState, but there is the caveat where you must manually update all state properties (even those you are not wanting to change)
* Can not use lifecycle hooks
* Access props via "props"


## Component lifecycle

Has the following methods:

* constructor()
* getDerivedStateFromProps()
* getSnapShotBeforeUpdate()
* componentDidCatch()
* shouldComponentUpdate()
* componentDidUpdate() 
* componentDidMount()
* componentWillUnmount()
* render() 

Of which the most commonly used are: shouldComponentUpdate, componentDidUpdate and componentDidMount.

### Creation lifecycle

* constructor(props)
	super(props) must be the first line of the constructor to make sure the object is created properly.

 * getDerivedStateFromProps(props,state)
	 This is a static method.
   Whenever props change, you can sync your state to them. Very fairly used.

 * render()
   returns JSX. How should the component be displayed?
	 * render any child components

 * componentDidMount()
   Can cause side effects here. For example make a HTTP request. Do not update state here as it will cause a re-render.
   You can update state syncronously, for example with javascript promises.

 * componentWillMount()
   This will be removed in future. Work that can be done here is typically done in getDerivedStateFromProps or the constructor.

### Update lifecycle 

 * getDerivedStateFromProps(props,state)
   See notes above. 

 * **shouldComponentUpdate(nextProps, nextState)**

   Decide whether or not to continue updating. Must return a boolean.
	 ```shouldComponentUpdate(nextProps, nextState){
				return (nextProps.foobar !== this.props.foobar); 
	 }
	 ```

   Given that this method only belongs to class components, you can achieve the same with functional components by wrapping the export in a call to `React.memo`
	 `export default React.memo(foobar);`

 * render()

 * Update child components

 * getSnapShotBeforeUpdate(prevProps,prevState)

 * componentDidUpdate()
   Similar notes to componentDidMount.

### Destruction lifecycle

 * componentWillUnmount()
   Used to close any external dependencies / event listeners / timers attached to a component that is unmounted.


## When to optimise?
Given we now know that you can optimise the update lifecycle of class and functional components via shouldComponentUpdate and React.memo respectively, it is a good idea to discuss when youshould use them.

If a child prop should always update when their parent updates, using the aforementioned methods can result in needless calls.

Basically, if I don't need to update when my parent does then use these methods.


### PureComponents - an alternative to shouldComponentUpdate
If you want to use shouldComponentUpdate to check if any of the props supplied to a class component have changed you would need to write a lengthy if statement to check them all. There is a better alternative. 

You can extend a PureComponent instead of Component.  `class foobar extends React.PureComponent`

PureComponent automatically provides a shouldComponentUpdate that checks for changes in all props.


## How does React update the DOM

render() is called.

React then compares an OLD virtual DOM and a Re-rendered Virtual DOM. If differences are found, it updates the "real" DOM, only updating the elements that have changed. If no differences are found, the "real" DOM is left untouched.

## Higher Order Component
It is usually accepted that HOC filenames being "With" for example "WithFoobar".

```
 import React from "react";

 const withFoobar= (props) => (
			 <div className={props.styles}>props.children</div>
		 );

 export default withFoobar;
```

Which means that `<div className={styles}> <p> foobar </p> </div>` is the same as `<WithFoobar styles={styles}> <p> foobar </p> </WithFoobar>`. This is a contrived example, but HOC would be useful for adding error handling for components that deal with http requests, for example.

Another way of creating HOC:

```
import React from "react";

const withFoobar = (WrappedComponent, styles) =>{
	return props => (
				<div className={styles}>
				 <WrappedComponent {...props}/>  // this is how you dynamically forward unknown props
				</div>	
			);
};

```
To use this: `export default withFoobar(App,App.styles)`

Take note that we passed the props forward to the wrapped element by using the spread operator.


### Which version should I use?
Ultimately it is up to you. However, it would be a good idea to separate HOC that affect JSX and HOC that provide behind the scenes logic. Using the first example for those that affect JSXand the second for those that provide "behind the scenes" logic.

## Context - breaking up long props chain

Imagine that we have a piece of state in A, the D needs to use. However, to get the state to D it needs to be passed via components B and C  `A -> B -> C -> D`. In these scenario imagine tthat the data being passed is not relevant to B or C at all. This makes the components B and C more difficult to reuse.

This is the ideal use case for the context API.

You would need to create a context. The createContext method allows you to define pieces of information and which components should be able to access them.

```
import React from "react";

const foo = React.createContext({bar: true});

export default foo;

```

Then in container A  you would import the context you have created and use it thusly:

```
import React from "react";
import Foo from "./foo";

	class A extends React.Component{

		state = {
		bar: false,
		}

		render(){
			return (
				<B />
				<foo.Provider value{{bar: this.state.bar}}>
					<D /> // wrap the elements that need to access the context
				</foo.Provider> 
			);
		}
	}

```


To access this in component D. Note that context.Consumer expects a function as a child, into which the context value(s) is/are passed.

``` 
import React from 'react';
import Foo from "./foo";

	d = (props) => {
		return (
			{(context) => {
				<Foo.Consumer>
				<p>The value of bar is : {context.bar}</p>;
				</Foo.Consumer>
			};
		);
	};

export default d;
```
