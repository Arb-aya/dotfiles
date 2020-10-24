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
[ styled-components.com ]( styled-components.com )
