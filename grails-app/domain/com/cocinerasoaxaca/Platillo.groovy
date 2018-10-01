package com.cocinerasoaxaca

class Platillo {
    String nombre
    String tipoPlatillo
    String historia
    String razonPorPlatillo
    String modoPreparacion
    String formaConsumirPlatillo
    String tipoPreparacion
    String origen
    String rendimiento
    String consumo
    Collection ingredientes
    Collection premios

    static belongsTo = [cocinera:Cocinera]

    static hasMany = [ingredientes:String, premios:Posicion]

    static constraints = {
        nombre size:5..300
        tipoPlatillo inList:['Cotidiano', 'Ceremonial']
        historia size:5..550
        razonPorPlatillo size:5..550
        modoPreparacion size:5..550
        formaConsumirPlatillo size:5..550
        tipoPreparacion size:5..550
        origen size:5..550
        rendimiento size:5..550
        consumo size:5..550
    }
}