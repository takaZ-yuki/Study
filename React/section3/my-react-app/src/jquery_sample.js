import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import jQuery from 'jquery';
import 'jquery-ui';
import 'jquery-ui/ui/widgets/autocomplete';

export default class Jquery_sample extends Component {

    render() {
        return (
            <div>
                <p>Sample</p>
                <input type="text" ref="txtSample" id="samplePLE" onBlur={this.texttt}></input>
            </div>
        );
    }

    texttt(e) {
        console.log(document.querySelector('#samplePLE').value);
    }

    componentDidMount(event) {
        let datasource = ['Sample', 'Sample2', 'Sample3'];
        jQuery(ReactDOM.findDOMNode(this.refs.txtSample)).autocomplete({source: datasource});
    }
}
