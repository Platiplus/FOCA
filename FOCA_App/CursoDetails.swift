//
//  CursoDetails.swift
//  FOCA_App
//
//  Created by Platiplus on 20/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import UIKit

class CursoDetails: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var idCurso: Int?
    var topicos:[Topico] = []
    var dias:[TopicoFront] = []
    
    var tituloCursoLabel = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(idCurso, "idcurso")
        
        if let materia = MateriaDAO.getById(id: idCurso!){
            
            topicos = materia.topicos?.allObjects as! [Topico]
            print(topicos[0].nome)
            tituloCursoLabel = materia.nome!
            
        }
        
        self.title = tituloCursoLabel

        //dias = createDias()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        navigationController?.navigationBar.setNavigationBarTransparent()
        
        tableView.layer.cornerRadius = 15
        
    }

    

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "preencherDias"{
            if let cursoDetails = segue.destination as? PlanejadorDias{
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    
                    cursoDetails.tempo = topicos[indexPath.row].tempo
                    cursoDetails.dificuldade = topicos[indexPath.row].dificuldade
                    cursoDetails.tituloCursoLabel = topicos[indexPath.row].nome

                }
                
            }
        }
    }
    
}

extension CursoDetails: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topico = topicos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicoCell") as! TopicoCell
        
        cell.setTopico(nome: topico.nome!)
        print(topico.dificuldade,"dif")
        cell.setEstrela(dificuldade: Double(topico.dificuldade))
        
        return cell
}
}
