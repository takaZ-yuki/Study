import Comment from "./Comment";
import React from "react";

export default class CommentList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    var commentNodes = this.props.data.map((comment) => {
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