import React, {Component} from 'react';
import Comment from './Comment';

export default class CommentLsit extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        let commentNodes = this
            .props
            .data
            .map((comment) => {
                return (
                    <Comment author={comment.author} key={comment.id}>
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
