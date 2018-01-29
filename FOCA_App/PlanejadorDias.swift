//
//  PlanejadorDias.swift
//  FOCA_App
//
//  Created by Platiplus on 20/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import UIKit

class PlanejadorDias: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!

    
    @IBOutlet weak var estrelas: CosmosView!
    
    var dias:[TopicoFront] = []
    var tempo: Int16?
    var dificuldade: Int16?
    
    var tituloCursoLabel: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = tituloCursoLabel
        estrelas.rating = Double(dificuldade!)
        dias = createDias()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        navigationController?.navigationBar.setNavigationBarTransparent()
        tableView.layer.cornerRadius = 15
        
    }


    func createDias() -> [TopicoFront]{
        
        var tempDias:[TopicoFront] = []
        
        var numdias = Int(tempo!)
        for i in 1...numdias{
            tempDias.append(TopicoFront(title: "Dia \(i)"))
        }
        
        return tempDias
        
    }
    
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
}

}

extension PlanejadorDias: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diasRow = dias[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaCell") as! DiasCell
        
        cell.setDia(dia: diasRow)
        
        return cell
}
}
