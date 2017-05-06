import React,{Component} from 'react';
import CommentList from './CommentBox';
import CommentForm from './CommentForm';

export default class CommentBox extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return(
            <div className="commentBox">
                <h2>Comments.</h2>
                <CommentList />
                <CommentForm />
            </div>
        );
    }
} 
