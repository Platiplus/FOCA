//
//  modalNovoCurso.swift
//  FOCA_App
//
//  Created by Platiplus on 21/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import UIKit

class modalNovoCurso: UIViewController {

    @IBOutlet weak var viewModal: UIView!
    @IBOutlet weak var labelModal: UILabel!
    @IBOutlet weak var textFieldModal: UITextField!
    @IBOutlet weak var popupView: UIView!
    var cursos = Curso.fetchAddCurso()
    var idCurso: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelModal.layer.cornerRadius = 5
        popupView.layer.cornerRadius = 15
        if (idCurso == (-1)){
            textFieldModal.text = "Novo"
        }
        else{
            textFieldModal.text = String(cursos[idCurso!].title)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueNovoCurso"{
            if let novoCurso = segue.destination as? CursoViewController{
                novoCurso.titulo = textFieldModal.text!
                novoCurso.idCurso = idCurso
            }
        }
    }

}
