class PostMailer < ApplicationMailer
  def post_mail(picture)
    @picture = picture

    mail to: "ttkaws15@gmail.com", subject: "投稿完了"
  end
end
