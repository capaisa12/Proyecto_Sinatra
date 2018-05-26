require 'sinatra'
require 'make_todo'

get '/' do
 erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  Tarea.create(params[:title])
  redirect '/Listado_tareas'
end

get '/Listado_tareas' do
  erb :Listado_tareas
end

get '/completas' do
  erb :completas
end

post '/completas' do
  Tarea.update(params[:id])
  redirect '/Listado_tareas'
end

post '/borrar' do
  Tarea.destroy(params[:id])
  redirect '/Listado_tareas'
end

get '/pendientes' do
  erb :pendientes
end

post '/borrar_pendientes' do
    Tarea.destroy(params[:id])
    redirect '/pendientes'
end

post '/completar_pendiente' do
  Tarea.update(params[:id])
  redirect '/pendientes'
end

post '/borrar_terminadas' do
  Tarea.destroy(params[:id])
  redirect '/completas'
end
