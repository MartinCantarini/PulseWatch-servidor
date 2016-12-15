class MesuresController < ApplicationController

  def index
  	@mesures = Mesure.where(user_id: params[:user_id])
    #@mesures_to_json = @mesures.collect{|x| x.id, x.value, x.create_at}
    @mesures_to_json = []
    @mesures.each do |x|
      @mesures_to_json << [id: x.id,value: x.value,date: x.created_at.strftime('%Y-%m-%d %H:%M:%S')] 
      end
      
    render json: @mesures
  end

   def create
  end	

  def last_mesures
    id = params[:user_id]
    binding.pry
    @mesures = Mesure.where(user_id: id).last(10)
    render json: @mesures
  end  

  def create_mesure
  valor = params[:data]
  id = params[:id]
	@mesure = Mesure.create(value: valor,user_id: id)
  redirect_to mesures_path(user_id: id)
  end	
end
