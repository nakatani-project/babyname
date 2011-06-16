module BabiesHelper
	 def facebook_like
     	# <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.mixedbabyname.com%2Fbabies%2F425&amp;send=false&amp;layout=box_count&amp;width=200&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=25" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:200px; height:25px;" allowTransparency="true"></iframe>
		content_tag(:iframe, nil, :src => 'http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.mixedbabyname.com%2Fbabies%2F'+ params[:id] + '&amp;send=false&amp;layout=box_count&amp;width=350&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=25', :scrolling => "no", :frameborder => "0", :style => "border:none; overflow:hidden; width:350px; height:25px;", :allowTransparency => "true")
     end
end
