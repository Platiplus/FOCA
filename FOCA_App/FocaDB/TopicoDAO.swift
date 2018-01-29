//
//  UsuarioDAO.swift
//  FocaDB
//
//  Created by Platiplus on 24/11/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//


import Foundation
import CoreData


class TopicoDAO {
    
    static func getAll() -> [Topico] {
        var topicos = [Topico]()
        //monta request para obter todas as topicos
        let request: NSFetchRequest<Topico> = Topico.fetchRequest()
        //ordena pelo nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa request
            try topicos = CoreDataManager.sharedManager().getContext().fetch(request)
            print("Total de topicos = ", topicos.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return topicos
    }
    
    static func get(nome: String) -> [Topico] {
        var topicos = [Topico]()
        //monta request
        let request: NSFetchRequest<Topico> = Topico.fetchRequest()
        let predicate = NSPredicate(format: "nome contains[c] %@", nome)
        
        request.predicate = predicate
        //ordena por nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa consulta
            try topicos = CoreDataManager.sharedManager().getContext().fetch(request)
            print("Total de topicos por nome = ", topicos.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return topicos
        
    }
    
    static func getById(id: Int) -> Topico {
        var topicos = [Topico]()
        //monta request
        let request: NSFetchRequest<Topico> = Topico.fetchRequest()
        let predicate = NSPredicate(format: "id = \(id)")
        request.predicate = predicate
        
        do {
            //executa consulta
            try topicos = CoreDataManager.sharedManager().getContext().fetch(request)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return topicos[0]
        
    }
    
    static func count() -> Int {
        var topicos = [Topico]()
        let request: NSFetchRequest<Topico> = Topico.fetchRequest()
        do {
            //executa request
            try topicos = CoreDataManager.sharedManager().getContext().fetch(request)
            return topicos.count
            
        } catch let erro as NSError {
            print(erro)
        }
        return 0
    }
    
    static func insert(topi: Topico) -> Bool {
        var resultado = false
        
        topi.id = count() + 1
        
        //insere a materia
        CoreDataManager.sharedManager().getContext().insert(topi)
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return resultado
    }
    
    static func delete(topic: Topico) -> Bool {
        var resultado = false
        //deleta o topico
        CoreDataManager.sharedManager().getContext().delete(topic)
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }
    
    static func update(topi: Topico) -> Bool{
        var topico = Topico()
        var resultado = false
        
        topico = getById(id: Int(topi.id));
        topico.nome = topi.nome
        topico.status = topi.status
        topico.tempo = topi.tempo
        
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
