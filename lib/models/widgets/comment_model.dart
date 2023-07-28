class CommentModel {
  final String commentId;
  final String? commentAuthor;
  final String? commentAuthorImage;
  final String? commentDescription;
  final String? commentDate;
  final String? commentTime;
  final int? commentLikes;
  final List<ReplyModel>? replies;

  CommentModel({
    required this.commentId,
    this.commentAuthor,
    this.commentAuthorImage,
    this.commentDescription,
    this.commentDate,
    this.commentTime,
    this.commentLikes,
    this.replies,
  });

  CommentModel copyWith({
    String? commentId,
    String? commentAuthor,
    String? commentAuthorImage,
    String? commentDescription,
    String? commentDate,
    String? commentTime,
    int? commentLikes,
    List<ReplyModel>? replies,
  }) {
    return CommentModel(
      commentId: commentId ?? this.commentId,
      commentAuthor: commentAuthor ?? this.commentAuthor,
      commentAuthorImage: commentAuthorImage ?? this.commentAuthorImage,
      commentDescription: commentDescription ?? this.commentDescription,
      commentDate: commentDate ?? this.commentDate,
      commentTime: commentTime ?? this.commentTime,
      commentLikes: commentLikes ?? this.commentLikes,
      replies: replies ?? this.replies,
    );
  }
}

class ReplyModel {
  final String? replyAuthor;
  final String? replyAuthorImage;
  final String? replyDescription;
  final String? replyDate;
  final String? replyTime;

  ReplyModel({
    this.replyAuthor,
    this.replyAuthorImage,
    this.replyDescription,
    this.replyDate,
    this.replyTime,
  });
}
