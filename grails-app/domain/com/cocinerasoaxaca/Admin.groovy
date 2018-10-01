package com.cocinerasoaxaca

class Admin {
    String nombre
    String apPaterno
    String apMaterno
    String username

    static belongsTo = [user:User]

    static constraints = {
        username unique:true
    }
}
