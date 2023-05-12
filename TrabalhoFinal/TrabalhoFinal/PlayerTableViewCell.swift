//
//  PlayerTableViewCell.swift
//  TrabalhoFinal
//
//  Created by user239587 on 5/2/23.
//

import UIKit


class PlayerTableViewCell : UITableViewCell {
    
    var meuplayer : Player?
    
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, player: Player) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        meuplayer = player
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
       
        self.backgroundColor = meuplayer?.corcelula
        self.textLabel?.textColor = meuplayer?.corescrita
    
    }
    
}
