import React,{Component} from 'react';
import Marked from 'marked';

export default class Comment extends Component {
    rawMarkup() {
        let rawMarkup = Marked(this.props.children.toString(), {sanitize:  true});
        return {__html: rawMarkup};
    }

    render() {
        return(
            <div className="comment">
                <h2 className="commentAuthor">
                    {this.props.author}
                </h2>
                <span dangerouslySetInnerHTML={this.rawMarkup()}></span>
            </div>
        );
    }
}