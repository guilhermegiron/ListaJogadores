//
//  CardView.swift
//  TrabalhoFinal
//
//  Created by user239587 on 5/9/23.
//

import UIKit

class CardView: UIView {
    
    // Define as propriedades do card com meu objeto player
    var player: Player?
    
    // Inicializa o meu player
    init(player: Player) {
        self.player = player
        super.init(frame: .zero)
    }
    
    // Cria e configura os elementos do card
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let idadeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let salarioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let golsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let conquistasLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Define o layout do card e adiciona os elementos a ele
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10
        self.backgroundColor = player?.corcelula
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2
        
        titleLabel.textColor = player?.corescrita
        titleLabel.frame = CGRect(x: 16, y: 16, width: self.frame.width - 32, height: 24)
        titleLabel.text = player?.name
        titleLabel.textAlignment = .center
        
        if let imagem = player?.imagem {
            cardImageView.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 8, width: self.frame.width - 32, height: 400)
            cardImageView.image = imagem.image
            cardImageView.contentMode = .scaleAspectFill
        }
        else {
            cardImageView.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 8, width: 0, height: 0)
        }
        
        idadeLabel.textColor = player?.corescrita
        idadeLabel.frame = CGRect(x: 16, y: cardImageView.frame.maxY + 8, width: self.frame.width - 32, height: 0)
        idadeLabel.text = "Idade: " + String(player!.idade) + " Anos"
        idadeLabel.font = UIFont.systemFont(ofSize: 14)
        idadeLabel.sizeToFit()
        
        //Formatar valor do salario
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        var valorformatado : String
        valorformatado = ""
        
        if let formattedValue = formatter.string(from: NSNumber(value: player!.salario)) {
            print(formattedValue)
            valorformatado = formattedValue // saída: "R$ 1.234,56"
        } else {
            print("Erro ao formatar valor.")
        }
        
        salarioLabel.textColor = player?.corescrita
        salarioLabel.frame = CGRect(x: 16, y: idadeLabel.frame.maxY + 8, width: self.frame.width - 32, height: 0)
        salarioLabel.text = "Salario Mes: " + valorformatado
        salarioLabel.font = UIFont.systemFont(ofSize: 14)
        salarioLabel.sizeToFit()

        
        golsLabel.textColor = player?.corescrita
        golsLabel.frame = CGRect(x: 16, y: salarioLabel.frame.maxY + 8, width: self.frame.width - 32, height: 0)
        golsLabel.text = "Total de Gols Marcados: " + String(player!.totalgols) + " Gols"
        golsLabel.sizeToFit()
        golsLabel.font = UIFont.systemFont(ofSize: 14)
        
        conquistasLabel.textColor = player?.corescrita
        conquistasLabel.frame = CGRect(x: 16, y: golsLabel.frame.maxY + 8, width: self.frame.width - 32, height: 0)
        conquistasLabel.text = "Titulos: " + String(player!.titulos)
        conquistasLabel.sizeToFit()
        conquistasLabel.font = UIFont.systemFont(ofSize: 14)
        
        
        //Adiciona todas Views
        self.addSubview(titleLabel)
        self.addSubview(idadeLabel)
        self.addSubview(salarioLabel)
        self.addSubview(golsLabel)
        self.addSubview(conquistasLabel)
        self.addSubview(cardImageView)
        
    }

    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
}
