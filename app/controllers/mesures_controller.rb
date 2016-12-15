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

  def statics
    id = params[:user_id]
    cant = 10
    cant2 = 50

    last_minute_mesures = Mesure.where(user_id: id).last(cant)
    last_minute_mesures_count = last_minute_mesures.count
    last_minute_mesures_prom = last_minute_mesures.sum(&:value)
    if (last_minute_mesures_count != 0 &&  last_minute_mesures_count < cant)
      cant = last_minute_mesures_count
    end  
    last_minute_mesures_prom /= cant
   
    mesures = Mesure.where(user_id: id)
    mesures_count = mesures.count
    all_mesures_prom = mesures.sum(&:value)
    if mesures_count > 0
      all_mesures_prom /= mesures_count
    else
      all_mesures_prom = 0
    end  

    last_5_minutes_mesures = Mesure.where(user_id: id).last(cant2)
    last_5_minutes_mesures_count = last_5_minutes_mesures.count
    last_5_minutes_mesures_prom = last_5_minutes_mesures.sum(&:value)
    if (last_5_minutes_mesures_count != 0 && last_5_minutes_mesures_count < cant2)
      cant2 = last_5_minutes_mesures_count
    end  
    last_5_minutes_mesures_prom /= cant2

    max_mesure = mesures.maximum(:value)
    render json: {max_mesure: max_mesure,last_minute_mesures_prom: last_minute_mesures_prom,all_mesures_prom: all_mesures_prom,last_5_minutes_mesures_prom: last_5_minutes_mesures_prom,mesures: last_minute_mesures}
  end  

  def create_mesure
  valor = params[:data]
  id = params[:id]
  @mesure = Mesure.create(value: valor,user_id: id)
	
  render json: {msj: 'Creado' }
  #redirect_to mesures_path(user_id: id)
  end	
end
