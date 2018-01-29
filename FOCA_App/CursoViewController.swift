//
//  CursoViewController.swift
//  FOCA_App
//
//  Created by Platiplus on 18/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import UIKit

class CursoViewController: UIViewController {
    
    
    @IBOutlet weak var tituloCurso: UILabel!
    @IBOutlet weak var novoTopicoTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var adicionarButton: UIButton!
    @IBOutlet weak var salvarButton: UIButton!
    @IBOutlet weak var cancelarButton: UIButton!
    
    var idCurso: Int?
    
    
    //recebe a dificuldade do usuario e a disponibilidade
    
    func diasNecessarios(dificuldade:Float, disponibilidade: Float) -> Float{
        
        //identifica o total de horas de acordo com o grau de dificuldade
        
        let totalHoras: Float = dificuldade == 1 ? 6.0 : dificuldade == 2 ? 12.0 : 24.0
        
        //retorna a quantidade de dias necessaria  - valor (arredondado para cima)
        
        return Float(ceil(totalHoras / disponibilidade))
        
    }
    
    
    @IBAction func salvarCurso(_ sender: Any) {
        let newCurso = Materia()
        newCurso.nome = tituloCurso.text
        let idMateria: Int16 = MateriaDAO.insert(mat:newCurso)
        for cell in tableView.visibleCells {
            var materia = MateriaDAO.getById(id: Int(idMateria))
            if let myCell = cell as? TopicoCell {
                let topico = Topico()
                topico.nome = myCell.topicoTitleLabel.text!
                topico.status = false
                topico.tempo = Int16(diasNecessarios(dificuldade: (Float(myCell.estrelas.rating)), disponibilidade: 1.0))
                topico.materia = materia
                topico.anotacao = ""
                topico.dificuldade = Int16(myCell.estrelas.rating)
                topico.id = 0
                let result = TopicoDAO.insert(topi: topico)
                //let salvou = MateriaDAO.addTopico(id: Int(idMateria), topico: topico)
                print(result)
                print("salvou os topicos")
                print(TopicoDAO.count())
            }
        }
        
        
        //        let dif = Int(estrelas.rating)
    }
    
    var titulo: String?
    var topicos:[TopicoFront2] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //createTopicos()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tituloCurso.text = titulo
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        navigationController?.navigationBar.setNavigationBarTransparent()
        tableView.layer.cornerRadius = 15
        adicionarButton.layer.cornerRadius = 17
        salvarButton.layer.cornerRadius = 20
        cancelarButton.layer.cornerRadius = 20
        novoTopicoTextField.layer.cornerRadius = 18
        
    }
    
    
    
    @IBAction func addNovoTopico(_ sender: UIButton) {
        
        insertNewTopico()
        
    }
    
    func insertNewTopico(){
        
        /*let topico = Topico()
        topico.nome = novoTopicoTextField.text!
        topico.status = false
        topico.tempo = 0
        //topico.materia = Materia()
        topico.anotacao = ""
        topico.dificuldade = 1
        topico.id = 0
        topicos.append(topico)
        */
        let topico = TopicoFront2(title:novoTopicoTextField.text!, estrelas: 0.0)
        topicos.append(topico)

        let indexPath = IndexPath(row: topicos.count-1, section:0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        novoTopicoTextField.text = ""
        view.endEditing(true)
    }
    
    
    /*func insertNewTopico(){
     
     topicos.append(TopicoFront(title:novoTopicoTextField.text!))
     let indexPath = IndexPath(row: topicos.count-1, section:0)
     
     tableView.beginUpdates()
     tableView.insertRows(at: [indexPath], with: .automatic)
     tableView.endUpdates()
     
     novoTopicoTextField.text = ""
     view.endEditing(true)
     }*/
    
    
    /*func createTopicos() -> [TopicoFront]{
        
        var materia = MateriaDAO.getById(id: 0)
        
        var topicos = materia?.topicos
        print("topicos")
        print(topicos)
        
        var tempTopicos:[TopicoFront] = []
        
        let topico1 = TopicoFront(title: "Topico 1")
        let topico2 = TopicoFront(title: "Topico 1")
        let topico3 = TopicoFront(title: "Topico 3")
        
        tempTopicos.append(topico1)
        tempTopicos.append(topico2)
        tempTopicos.append(topico3)
        
        return tempTopicos
    }*/
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

    }
    
}

extension CursoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topico = topicos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicoCell") as! TopicoCell
        
        cell.setTopico(nome:topico.title)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete {
            
            topicos.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
    }
    
}
