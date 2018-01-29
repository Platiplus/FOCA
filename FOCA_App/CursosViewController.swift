//
//  CursosCollectionViewController.swift
//  FOCA_App
//
//  Created by Platiplus on 20/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class CursosViewController: UIViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "preencherCurso"{
            if let cursoDetails = segue.destination as? CursoDetails{
                if let indexPath = self.collectionView.indexPathsForSelectedItems {
                    
                    //let selecionado = cursos[]
                    print( cursos[(indexPath[0])[1]].id )
                    cursoDetails.idCurso = cursos[(indexPath[0])[1]].id
                }
                
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var cursos = Curso.fetchCurso()
    let cellScaling: CGFloat = 0.75
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Hey! Você mesmo!"
        content.subtitle = "Você já focou nos estudos hoje?"
        content.body = "Não se esqueça de atualizar seu progresso caso tenha estudado!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 43200, repeats: true)
        
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        
        
        let screenSize = UIScreen.main.bounds.size
        
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        
        let insetX = (view.bounds.width - cellWidth)/2.0
        let insetY = (view.bounds.height - cellHeight)/2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        navigationController?.navigationBar.setNavigationBarTransparent()
        setSearchColor()
        
        
    }

    
    func setSearchColor(){
        
        searchBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: .default)
        searchBar.isTranslucent = true
        searchBar.tintColor = .darkGray
        searchBar.backgroundColor = .clear
        navigationController?.view.backgroundColor = .clear
    }
        
}



extension CursosViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CursoCell", for: indexPath) as! CursoCollectionViewCell
        
        cell.curso = cursos[indexPath.item]
        
        return cell
        
    }
    
}

extension CursosViewController : UIScrollViewDelegate, UICollectionViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}



