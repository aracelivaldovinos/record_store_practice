require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

# get('/test') do
#   @something = "this is a variable"
#   erb(:whatever)
# end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:year') do
  @album = Album.search(params[:year].to_i())
  erb(:album)
end

post('/albums') do
  album = Album.new(params[:album_name], nil, params[:album_year], params[:album_genre], params[:album_artist])
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name], params[:year], params[:genre], params[:artist])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

# get('/custom_route') do
#   "We can even create custom routes, but we should only do this when needed."
# end