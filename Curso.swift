//
//  Curso.swift
//  FOCA_App
//
//  Created by Platiplus on 20/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import UIKit

class Curso
{
    // MARK: - Public API
    var title = ""
    var featuredImage: UIImage
    var color: UIColor
    var id: Int
    
    init(title: String, featuredImage: UIImage, color: UIColor, id: Int)
    {
        self.title = title
        self.featuredImage = featuredImage
        self.color = color
        self.id = id
    }
    
    // MARK: - Private
    // dummy data
    static func fetchCurso() -> [Curso]
    {
        var materias = [Materia]()
        materias = MateriaDAO.getAll()
        
        print("Total de materias: ", materias.count)
        
        if materias.count > 0 {
            for m in materias {
                print("---")
                print(m.nome)
                print(m.id)
                print(m.topicos?.count)
            }
        }
        
        
        var cursos = [Curso]()
        
        if(MateriaDAO.count() != 0){
            for indice in 0..<(MateriaDAO.count()){
                
               /* if let img = UIImage(named: (String(materias[indice].nome!)!)) {
                    cursos.append(Curso(title: String(materias[indice].nome!)!, featuredImage: img, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.5), id: Int(materias[indice].id)))
                }
                else{*/
                    cursos.append(Curso(title: String(materias[indice].nome!)!, featuredImage: UIImage(named: "imgPadrao")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.5), id: Int(materias[indice].id)))
                //}
                
            }
        }
        else{
            cursos.append(Curso(title: "Nenhum curso adicionado!", featuredImage: UIImage(named: "imgPadrao")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.5), id: -1))
        }
        
        return cursos
    }
    
    static func fetchAddCurso() -> [Curso]
    {
        var materias = [Materia]()
        materias = MateriaDAO.getAll()
        
        var cursos = [Curso]()
        
        if(MateriaDAO.count() != 0){
            for indice in 0..<(MateriaDAO.count()){
                if(materias[indice].interno){
                    if let img = UIImage(named: (String(materias[indice].nome!)!)) {
                        cursos.append(Curso(title: String(materias[indice].nome!)!, featuredImage: img, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.5), id: Int(materias[indice].id)))
                    }
                    else{
                        cursos.append(Curso(title: String(materias[indice].nome!)!, featuredImage: UIImage(named: "imgPadrao")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.5), id: Int(materias[indice].id)))
                    }
                }
            }
        }
        
        cursos.append(Curso(title: "+", featuredImage: UIImage(named: "imgPadrao")!, color: UIColor(red: 63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.5), id: -1))
        
        
        return cursos
    }
}


extension UINavigationBar {
    
    func setNavigationBarTransparent(){
        
        self.setBackgroundImage(UIImage(), for: .default)
        self.backgroundColor = .clear
        self.isTranslucent = true
        self.shadowImage = UIImage()
        self.tintColor = .darkGray        
    }
    
}
