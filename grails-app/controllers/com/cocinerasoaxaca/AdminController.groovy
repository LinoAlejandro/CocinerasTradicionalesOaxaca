package com.cocinerasoaxaca
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class AdminController {

    def index() {
        Cocinera.withSession {
            it.flush()
            it.clear()
        }
        Noticia.withSession {
            it.flush()
            it.clear()
        }
        Actividad.withSession {
            it.flush()
            it.clear()
        }
        [admins: Admin.findAll()]
    }

    def create(Admin admin) {
        if(request.method == 'POST') {
            def user = new User(username:params.username, password:params.password)
            admin.user = user
            if(admin.save(flush:true)) {
                user.save(flush:true)
                def role = Role.findByAuthority('ROLE_ADMIN')
                UserRole.create user, role
                UserRole.withSession {
                    it.flush()
                    it.clear()
                }
                redirect action:'index'
                return
            }
        }
        [admin:admin]
    }

    def update(Admin admin) {
        if(request.method == 'POST') {
            admin.properties = params
            if(admin.save(flush:true)) {
                def user = admin.user
                user.username = params.username
                user.password = params.password
                admin.save(flush:true)
                user.save(flush:true)
                redirect action:'index'
            }
        }
        [admin:admin]
    }

    def delete(Admin admin) {
        def user = admin.user
        def userRole = UserRole.findByUser(user)
        admin.delete(flush:true)
        userRole.delete(flush:true)
        user.delete(flush:true)
        redirect action:'index'
    }
}
