//
//  UsuarioDAO.swift
//  FocaDB
//
//  Created by Platiplus on 24/11/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//


import Foundation
import CoreData


class UsuarioDAO {
    
    static func getAll() -> [Usuario] {
        var usuarios = [Usuario]()
        //monta request para obter todas as usuarios
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        //ordena pelo nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa request
            try usuarios = CoreDataManager.sharedManager().getContext().fetch(request)
            print("Total de usuarios = ", usuarios.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return usuarios
    }
    
    static func get(nome: String) -> [Usuario] {
        var usuarios = [Usuario]()
        //monta request
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        let predicate = NSPredicate(format: "nome contains[c] %@", nome)
        
        request.predicate = predicate
        //ordena por nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa consulta
            try usuarios = CoreDataManager.sharedManager().getContext().fetch(request)
            print("Total de usuarios por nome = ", usuarios.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return usuarios
        
    }
    
    static func getByNome(nome: String) -> [Usuario] {
        var usuarios = [Usuario]()
        //monta request
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        let predicate = NSPredicate(format: "nome contains[c] %@", nome)
        
        request.predicate = predicate
        //ordena por nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa consulta
            try usuarios = CoreDataManager.sharedManager().getContext().fetch(request)
            print("Total de materias por nome = ", usuarios.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return usuarios
        
    }
    
    static func getById(id: Int) -> Usuario {
        var usuarios = [Usuario]()
        //monta request
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        let predicate = NSPredicate(format: "id = \(id)")        
        request.predicate = predicate
        
        do {
            //executa consulta
            try usuarios = CoreDataManager.sharedManager().getContext().fetch(request)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return usuarios[0]
        
    }

    static func count() -> Int {
        var usuarios = [Usuario]()
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        do {
            //executa request
            try usuarios = CoreDataManager.sharedManager().getContext().fetch(request)
            return usuarios.count
            
        } catch let erro as NSError {
            print(erro)
        }
        return 0
    }
    
    static func insert(usu: Usuario) -> Bool {
        var resultado = false
        
        usu.id = count() + 1
        
        //insere o usuario
        CoreDataManager.sharedManager().getContext().insert(usu)
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return resultado
    }
    
    
    static func addMateria(id: Int, materia: Materia) -> Bool{
        var usuario = Usuario()
        var resultado = false
        usuario = getById(id: Int(id))
        usuario.addToMaterias(materia)
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }
    
    
    static func removeMateria(id: Int, materia: Materia) -> Bool{
        var usuario = Usuario()
        var resultado = false
        usuario = getById(id: Int(id))
        usuario.removeFromMaterias(materia)
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }

    static func update(usu: Usuario) -> Bool{
        var usuario = Usuario()
        var resultado = false
        
        usuario = getById(id: Int(usu.id));
        usuario.nome = usu.nome
        usuario.disponibilidade = usu.disponibilidade
        usuario.inaugural = usu.inaugural
        usuario.materias = usu.materias
        usuario.senha = usu.senha
        usuario.user = usu.user
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }

    
    static func delete(user: Usuario) -> Bool {
        var resultado = false
        //deleta o usuario
        CoreDataManager.sharedManager().getContext().delete(user)
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }
    
}
