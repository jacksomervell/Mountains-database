class Mountains < Sinatra::Base

  # General route actions
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

  # RESTful Mountain Controller Actions
  # index
  get '/mountains' do
    @mountains = Mountain.all
    erb(:"mountains/index")
  end

  # new
  get '/mountains/new' do
    @mountain = Mountain.new
    erb(:"mountains/new")
  end

  # create
  post '/mountains' do
    @mountain = Mountain.new(params[:mountain])
    if @mountain.save
      redirect("/mountains/#{@mountain.id}")
    else
      erb(:"mountains/new")
    end
  end

  # show
  get '/mountains/:id' do
    @mountain = Mountain.find(params[:id])
    erb(:"mountains/show")
  end

  # edit
  get '/mountains/:id/edit' do
    @mountain = Mountain.find(params[:id])
    erb(:"mountains/edit")
  end

  # update
  post '/mountains/:id' do
    @mountain = Mountain.find(params[:id])
    if @mountain.update_attributes(params[:mountain])
      redirect("/mountains/#{@mountain.id}")
    else
      erb(:"mountains/edit")
    end
  end

  # delete
  post '/mountains/:id/delete' do
    @mountain = Mountain.find(params[:id])
    if @mountain.destroy
      redirect('/mountains')
    else
      redirect("/mountains/#{@mountain.id}")
    end
  end

end
