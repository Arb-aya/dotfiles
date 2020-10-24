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


## State hooks for functional components
When using the useState hook in functional components, it's important to know that the function returned from useState doesn't merge the new state with the old one. But rather replaces it.
When passing in arguments to functions passed as props we have two ways:

```
click={this.foo.bind(this,bar)}
```

```
click={()=> this.foo(bar)}
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

### Creation

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


