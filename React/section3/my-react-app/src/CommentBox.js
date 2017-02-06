import React, {Component} from 'react';
import request from 'superagent';
import CommentList from './CommentList';
import CommentForm from './CommentForm';

export default class CommentBox extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: []
        };
    }

    loadCommentsFromServer = () => {
        request.get(this.props.url).end((err, res) => {
            if (err) {
                throw err;
            }
            this.setState({data: res.body});
        });
    }

    handleCommentsSubmit = (comment) => {
        let comments = this.state.data;
        comments.id = Date.now();
        let newComments = comments.concat([comment]);
        this.setState({data: newComments});
        request.props(this.props.url).send(comment).end((err, res) => {
            if (err) {
                this.setState({data: comments});
                throw err;
            }
            this.setState({data: res.body});
        });
    }

    componentDidMount = () => {
        this.loadCommentsFromServer();
        setInterval(this.loadCommentsFromServer, this.props.pollInterval);
    }

    render () {
        return(
            <div className="commentBox">
                <h1>Comments</h1>
                <CommentList data={this.state.data} />
                <CommentForm onCommentSubmit={this.handleCommentsSubmit} />
            </div>
        )
    }
}
