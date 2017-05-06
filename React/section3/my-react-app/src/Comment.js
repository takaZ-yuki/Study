import React,{Component} from 'react';
import Marked from 'marked';

export default class Comment extends Component {

    render() {
        let rawMarkup = Marked(this.props.children.toString(), {sanitize: true})
        return(
            <div className="comment">
                <h2 className="commentAuthor">
                    {this.props.author}
                </h2>
                <span dengerouslySetInnerHTML={{__html: raw}} />
            </div>
        );
    }
}