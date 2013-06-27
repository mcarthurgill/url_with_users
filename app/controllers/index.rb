get '/' do
  erb :index
end

post '/urls' do
  path = params[:original_url]
  @url = Url.new(:original => path)
  if @url.save
    @last_url = Url.last
    @shortened = SecureRandom.hex(3)
    @last_url.update_attributes(:shortened => @shortened)
    erb :_shortened
    #return partial with original, shortened, etc. & route to view
  else 
    erb :_error
    #return error partial
  end 
end

get '/:short_url' do
 intermediate = Url.find_by_shortened(params[:short_url])
 redirect intermediate.original
end
