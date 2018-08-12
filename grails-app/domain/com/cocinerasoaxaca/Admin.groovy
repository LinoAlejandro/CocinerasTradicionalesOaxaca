package com.cocinerasoaxaca

class Admin {

    String nombre
    String apPaterno
    String apMaterno
    String username
    String password
    String passwordVerification

    static constraints = {
        username unique:true
        password validator: { val, obj ->
            obj.passwordVerification == val
        }
    }

    static belongsTo = [user:User]
}
