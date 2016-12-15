class UsersController < ApplicationController

  def logup
    name = params[:name]
    email = params[:email]
    password = params[:password]
  	
    if User.where(email: email).any? 
  		render json: {errors: "Email ya tomado"}, :status => 422
  	elsif  password.present? && password.length < 6 
  		render json: {errors: "Clave demasiado corta"}, :status => 422
  	else
  		user = User.create(name: name,email: email, password: password)	
  		render json: {email: email, password: password,id: user.id }		
  	end	
  end

  def login
  	email = params[:email]
  	password = params[:password]
  	user = User.where(email: email).take
	      
  	if user.present? && user.password == password
	    render json: {errors: "Usuario logueado con id #{user.id}",user_id: user.id}
    else
		  render :json => { :errors => 'Email o clave invalido' }, :status => 422
    end   	
  end 	
end
