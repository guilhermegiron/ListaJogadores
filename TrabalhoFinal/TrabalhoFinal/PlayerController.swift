//
//  PlayerController.swift
//  TrabalhoFinal
//
//  Created by user239587 on 5/2/23.
//

import UIKit

class PlayerController : UIViewController {
    
    var parametro : Player?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let p = parametro else{
            return
        }
        
        print(p)

        view.backgroundColor = UIColor(red: 39, green: 42, blue: 63)
        let leftBarButtonItem = UIBarButtonItem(title: "< Voltar", style: .plain, target: self, action: #selector(menuButtonTapped))
        
        leftBarButtonItem.tintColor = p.corcelula
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let card = CardView(player: p)
    
        view.addSubview(card)
        
        card.translatesAutoresizingMaskIntoConstraints = false
        card.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        card.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        card.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.659).isActive = true
        
        
    }
    
    
    @objc func menuButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }
}
