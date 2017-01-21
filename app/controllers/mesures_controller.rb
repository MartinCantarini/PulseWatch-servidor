class MesuresController < ApplicationController

  def statics
    id = params[:user_id]

    #TODAS LAS MEDICIONES DE ID
    mesures = Mesure.where(user_id: id)
    
    #ULTIMO MINUTO
    last_minute_mesures = mesures.where(created_at: (Time.now - 1.minutes)..Time.now)
    last_minute_mesures_count = last_minute_mesures.count
    last_minute_mesures_sum = last_minute_mesures.sum(&:value) 
    if last_minute_mesures_count > 0
      last_minute_mesures_prom = last_minute_mesures_sum / last_minute_mesures_count 
    else
      last_minute_mesures_prom = 0   
    end

    #ULTIMOS 5 MINUTOS
    last_5_minutes_mesures = mesures.where(created_at: (Time.now - 5.minutes)..Time.now)
    last_5_minutes_mesures_count = last_5_minutes_mesures.count
    last_5_minutes_mesures_sum = last_5_minutes_mesures.sum(&:value)
    if last_5_minutes_mesures_count > 0
      last_5_minutes_mesures_prom = last_5_minutes_mesures_sum / last_5_minutes_mesures_count
    else
      last_5_minutes_mesures_prom = 0   
    end

    #TODAS LAS MEDICIONES
    mesures_count = mesures.count
    all_mesures_prom = mesures.sum(&:value)
    if mesures_count > 0
      all_mesures_prom /= mesures_count
    else
      all_mesures_prom = 0
    end  

    #MEDICIÓN MAS ALTA
    max_mesure = mesures.maximum(:value)
    
    #JSON
    render json: {max_mesure: max_mesure,last_minute_mesures_prom: last_minute_mesures_prom,all_mesures_prom: all_mesures_prom,last_5_minutes_mesures_prom: last_5_minutes_mesures_prom,mesures: mesures}
  end  

  def create_mesure
    valor = params[:data]
    id = params[:id]
    @mesure = Mesure.create(value: valor,user_id: id)
  	
    render json: {msj: 'Creado' }
  end	
end
