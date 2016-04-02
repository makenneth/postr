module PostsHelper
   def compose_all_sub_comments(comment)
      comment_fragment = div_for_sub_comments(comment)
      sub_comments = comment.comments
      sub_comments.each do |comm|
         comment_fragment += compose_all_sub_comments(comm)
      end
      comment_fragment += end_tag
      comment_fragment += raw( render 'comments/form', source: comment, post_id: @post.id )
      comment_fragment
   end

   def div_for_sub_comments(comment)
      html = '<div style="border: 1px solid gray; padding: 10px;">'.html_safe
      html += "<b>#{h(comment.author.username)}</b>".html_safe
      html += "<span> #{h(time_ago_in_words(comment.created_at))} ago</span>".html_safe
      html += "<p>#{h(comment.body)}</p>".html_safe
      html
   end

   def comment_box
   end
   def end_tag
      "</div>".html_safe
   end
end
