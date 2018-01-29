//
//  MateriaDAO.swift
//  FocaDB
//
//  Created by Platiplus on 24/11/17.
//  Copyright © 2017 Hackatruck. All rights reserved.
//


import Foundation
import CoreData


class MateriaDAO {
    
    
    static func getAll() -> [Materia] {
        var materias = [Materia]()
        //monta request para obter todas as materias
        let request: NSFetchRequest<Materia> = Materia.fetchRequest()
        //ordena pelo nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa request
            try materias = CoreDataManager.sharedManager()
                .getContext().fetch(request)
            print("Total de materias = ", materias.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return materias
    }
    
    static func getByNome(nome: String) -> [Materia] {
        var materias = [Materia]()
        //monta request
        let request: NSFetchRequest<Materia> = Materia.fetchRequest()
        let predicate = NSPredicate(format: "nome contains[c] %@", nome)
        
        request.predicate = predicate
        //ordena por nome
        request.sortDescriptors = [NSSortDescriptor.init(key: "nome", ascending: true)]
        
        do {
            //executa consulta
            try materias = CoreDataManager.sharedManager().getContext().fetch(request)
            print("Total de materias por nome = ", materias.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return materias
        
    }
    
    static func getById(id: Int) -> Materia? {
        var materias = [Materia]()
        //monta request
        let request: NSFetchRequest<Materia> = Materia.fetchRequest()
        let predicate = NSPredicate(format: "id == \(id)")
        
        request.predicate = predicate
        
        do {
            //executa consulta
            try materias = CoreDataManager.sharedManager().getContext().fetch(request)
            
        } catch let erro as NSError {
            print(erro)
        }
        if materias.count > 0{
            return materias[0]
        }
        else{
            return nil
        }
        
    }
    
    
    
    static func count() -> Int {
        var materias = [Materia]()
        let request: NSFetchRequest<Materia> = Materia.fetchRequest()
        do {
            //executa request
            try materias = CoreDataManager.sharedManager().getContext().fetch(request)
            return materias.count
            
        } catch let erro as NSError {
            print(erro)
        }
        return 0
    }
    
    static func insert(mat: Materia) -> Int16 {
        var resultado: Int16 = 0
        
        mat.id = count() + 1
        print("ID da materia = ", mat.id)
        
        //insere a materia
        CoreDataManager.sharedManager().getContext().insert(mat)
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = mat.id
            print("salvou")
            print(count())
            
        } catch let erro as NSError {
            print(erro)
        }
        
        return resultado
    }
    
    static func addTopico(id: Int, topico: Topico) -> Bool{
        var materia = Materia()
        var resultado = false
        materia = getById(id: Int(id))!
        materia.addToTopicos(topico)
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }
    
    
    static func removeTopico(id: Int, topico: Topico) -> Bool{
        var materia = Materia()
        var resultado = false
        materia = getById(id: Int(id))!
        materia.removeFromTopicos(topico)
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }
    
    
    static func update(mat: Materia) -> Bool{
        var materia = Materia()
        var resultado = false
        
        materia = getById(id: Int(mat.id))!;
        materia.nome = mat.nome
        materia.status = mat.status
        materia.tempo = mat.tempo
        
        do {
            //tenta salvar
            try CoreDataManager.sharedManager().getContext().save()
            resultado = true
            
        } catch let erro as NSError {
            print(erro)
        }
        return resultado
    }
    
    
    static func delete(mat: Materia) -> Bool {
        var resultado = false
        //deleta a materia
        CoreDataManager.sharedManager().getContext().delete(mat)
        
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
