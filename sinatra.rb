require "sinatra"
def wed_content(name)
    File.read("wed/#{name}.txt")
rescue Errno::ENOENT
    return nil 
end 
def save_wed(name, descripcion)
    File.open("wed/#{name}.txt", "w") do |file|
        file.print(descripcion)
    end
end
def delete_wed(name)
    File.delete("wed/#{name}.txt")
end
get '/create' do
    erb :create 
  end
get '/' do
    @files = Dir.entries("wed")
    erb :home    
  end
  get '/:name' do
    @name = params[:name]
    @descripcion = wed_content(@name)
    erb :taller 
  end
 post '/create' do
    save_wed(params["name"], params["descripcion"])
    @name = params["name"]
    @message = " CREADO "
    erb :message 
 end
delete '/:name' do
    delete_wed(params[:name])
    @name = params[:name ]
    @message = " BORRADO "
    erb :message
end
get '/:name/edit' do
    @name = params[:name]
    @descripcion = wed_content(@name)
    erb :edit
end
put '/:name' do
    save_wed(params[:name],params["descripcion"])
    redirect  URI.escape("/#{params[:name]}")
end


  