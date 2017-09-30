import * as React from 'react';

export interface HelloProps {
  compiler: string;
  framework: string;
}

export interface HelloState {
  name: string;
  age: number;
}

// 'HelloProps'はpropsの形状(shape)を表すものです。
// Stateがセットされることは無いため、'undefined'型を使用します。
export default class Hello extends React.Component<HelloProps, HelloState> {

  constructor(props: HelloProps) {
    super(props);
    this.state = {'name': 'sample', 'age': 20};
  }

  render(): JSX.Element {
    return(
      <h1>Hello from {this.props.compiler} and {this.props.framework} and name {this.state.name} and age {this.state.age}!</h1>
    );
  }
}