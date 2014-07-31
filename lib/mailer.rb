class Mailer

  def mailer(params)
    Pony.mail(
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'allieisclever@gmail.com',
      :subject => params[:name] + " has contacted you about Players Clothing",
      :body => params[:message],
      :attachments => {params[:image][:filename] => File.read(params[:image][:tempfile])
      })
  end
  
end
