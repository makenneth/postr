module PostsHelper
   def ensure_valid_link(url)
      if url =~ /^http[s]?:\/\/$/
         return ""
      else
         return url if url =~ /^http[s]?:\/\//
         "http://" + url
      end
   end

   def compose_all_sub_comments(comment)
      comment_fragment = div_for_sub_comments(comment)
      sub_comments = comment.comments
      sub_comments.each do |comm|
         comment_fragment += compose_all_sub_comments(comm)
      end
      comment_fragment += end_tag
      comment_fragment += "<a class='show-comment'>Reply to this</a>".html_safe
      comment_fragment += "<a class='hidden hide-comment-form'>Hide Form</a>".html_safe
      comment_fragment += hidden_comment_form(comment)
      comment_fragment
   end

   def div_for_sub_comments(comment)
      html = '<div class="sub-comm">'.html_safe
      html += "<b>#{h(comment.author.username)}</b>".html_safe
      html += "<span> #{h(time_ago_in_words(comment.created_at))} ago</span>".html_safe
      html += "<span class='hide-chain'><a>Hide</a></span>".html_safe
      html += "<span class='show-comment-chain hidden'><a>Show</a></span>".html_safe
      html += "<p>#{h(comment.body)}</p>".html_safe
      html
   end

   def hidden_comment_form(source)
      html = "<div class='hidden comment-form'>".html_safe
      html += comment_form(source)
      html += end_tag
      html
   end
   def comment_form(source)
      raw( render 'comments/form', source: source, post_id: @post.id)
   end
   def end_tag
      "</div>".html_safe
   end
end
