var React = require('react');
var ReactDOM = require('react-dom');

// コンポーネント名の頭文字は大文字にする
var HelloReact = React.createClass({
  render: function () {
    return (
      <h2>{this.props.children}</h2>
    );
  }
});

ReactDOM.render(
  <HelloReact>Sample</HelloReact>,
  document.querySelector("#app")
);