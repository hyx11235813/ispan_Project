package team3.meowie.dic.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.meowie.dic.model.Comment;
import team3.meowie.dic.model.CommentRepository;
import team3.meowie.dic.model.dto.CommentDto;
import team3.meowie.member.model.User;
import team3.meowie.member.service.UserService;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    public void addComment(Comment comment) {
        commentRepository.save(comment);

    }

    //轉爲dto進行資料傳遞
    public List<CommentDto> getCommentsByPostId(Integer postID) {
        List<Comment> comments = commentRepository.findByPost_PostID(postID);
        // Comment轉爲CommentDto列表
        List<CommentDto> commentDtos = comments.stream().map(comment -> {
            CommentDto dto = new CommentDto();
            dto.setContent(comment.getContent());
            dto.setPostID(postID);
            dto.setUsername(comment.getUser().getUsername());

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//
            String CommentDate = sdf.format(comment.getCommentDate());//

            dto.setCommentDate(CommentDate);
            dto.setUserID(comment.getUser().getId());
            dto.setCommentID(comment.getCommentID());

            return dto;
        }).collect(Collectors.toList());
        return commentDtos;
    }

    public void deleteCommentByCommentId(Integer commentID) {
        commentRepository.deleteById(commentID);
    }

    public List<Object[]> getCommentsCountPerPost() {
        return commentRepository.findCommentsCountPerPost();
    }


}
