import React, {Component} from 'react';
import CommentList from './CommentList';
import CommentForm from './CommentForm';

export default class CommentBox extends Component {

    data = [
                {author: "Pate Hunt", text: "This is one comment"},
                {author: "Jordan Walke", text: "This is *another* comment"}
            ];

    render() {
        return(
            <div className="commentBox">
                <h1>Comments</h1>
                <CommentList data={this.props.data} />
                <CommentForm />
            </div>
        );
    }
}
