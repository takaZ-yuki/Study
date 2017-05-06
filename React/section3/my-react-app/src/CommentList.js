import React, {Component} from 'react';
import Comment from './Comment';

export default class CommentLsit extends Component {

    constructor(comment) {
        this.comment = comment;
    }

    render() {
        this.commentNodes = this.props.data.map(function (comment) {
            return (
                <Comment author={comment.author}>
                    {comment.text}
                </Comment>
            );
        });

        return (
            <div className="commentList">
                {commentNodes}
            </div>
        );
    }
}
