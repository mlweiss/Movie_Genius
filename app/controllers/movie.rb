get '/find_movie' do
  erb :add_movie
end

post '/find_movie' do
  redirect "/search_results/#{params[:user_movie]}"
end

get '/search_results/:search' do
  @user_movie = Imdb::Search.new(params[:search])
  erb :search_results
end

post '/add_movie' do
  p params
  new_movie = Imdb::Movie.new(params[:movie_id])
  Movie.create(title: new_movie.title, synopsis: new_movie.plot_synopsis)
  redirect '/'
end
