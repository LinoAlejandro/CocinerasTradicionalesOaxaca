package com.cocinerasoaxaca

class Admin {
    String nombre
    String apPaterno
    String apMaterno
    String username
    String password
    String passwordVerification

    static belongsTo = [user:User]

    static constraints = {
        username unique:true
        password validator: { val, obj ->
            obj.passwordVerification == val
        }
    }
}
