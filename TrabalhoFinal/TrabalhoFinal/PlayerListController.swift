//	
//  ViewController.swift
//  TrabalhoFinal
//
//  Created by user239587 on 5/2/23.
//


import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}


class PlayerListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    
    let players = [Player(name: "Luis Suarez 🇺🇾 ", idade: 36, corcelula: .systemBlue, corescrita: .white ,totalgols: 500,                 salario: 1100500.40, imagem: UIImageView(image: UIImage(named: "suarez")), titulos: "2 UCL, 1 Premier League, 2 LaLiga"),
                   Player(name: "Lionel Messi 🇦🇷", idade: 36, corcelula: .white, corescrita: .blue, totalgols: 800, salario: 15091000.00, imagem: UIImageView(image: UIImage(named: "messi")), titulos: "4 UCL, 1 Copa do Mundo"),
                   Player(name: "Neymar Jr 🇧🇷", idade: 31, corcelula: UIColor(red: 243, green: 238, blue: 104), corescrita: UIColor(red: 25, green: 56, blue: 31), totalgols: 400, salario: 31000000.00,
                          imagem: UIImageView(image: UIImage(named: "neymarjr")), titulos: "1 UCL, 1 LaLiga"),
                   Player(name: "Cristiano Ronaldo 🇵🇹", idade: 38, corcelula: UIColor(red: 3, green: 77, blue: 99), corescrita: .green, totalgols: 750, salario: 91005000.00,
                          imagem: UIImageView(image: UIImage(named: "cristiano")), titulos: "5 UCL, 3 LaLiga"),
                   Player(name: "Karin Benzema 🇫🇷", idade: 35, corcelula: .blue, corescrita: .white, totalgols: 292, salario: 1500000.00,
                          imagem: UIImageView(image: UIImage(named: "karin")), titulos: "3 UCL, 2 LaLiga"),
                   Player(name: "Luka Modric 🇭🇷", idade: 37, corcelula: UIColor(red: 184, green: 31, blue: 0), corescrita: UIColor(red: 249, green: 251, blue: 239), totalgols: 67, salario: 2500000.00,
                          imagem: UIImageView(image: UIImage(named: "luka")), titulos: "2 UCL, 1 Vice Copa do Mundo"),
                   Player(name: "Robert Lewandowski 🇵🇱", idade: 34, corcelula: UIColor(red: 221, green: 224, blue: 227), corescrita: UIColor(red: 117, green: 9, blue: 6  ), totalgols: 353, salario: 1750000.00,
                          imagem: UIImageView(image: UIImage(named: "lewa")), titulos: "1 UCL, 2 Bundesliga"),
                   Player(name: "Vinicius Jr 🇧🇷", idade: 22, corcelula: UIColor(red: 19, green: 103, blue: 63), corescrita: UIColor(red: 243, green: 238, blue: 30), totalgols: 400, salario: 1340500.00,
                          imagem: UIImageView(image: UIImage(named: "vini")), titulos: "1 UCL, 1 LaLiga")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        //Habilitar Scroll... ai posso ter mais elementos e assim poder scrollar a tableview
        tableView.isScrollEnabled = true
        
        
    }
    
    func setupView(){
        view.backgroundColor = UIColor(red: 39, green: 42, blue: 63)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Para ocupar toda a view usa esse bounds...
        //tableView.frame = view.bounds
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //tableView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.429).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = PlayerTableViewCell(style: .default, reuseIdentifier: "player", player: players[indexPath.row])
        
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(players[indexPath.row].name)"
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let playerController = PlayerController()
        playerController.parametro = players[indexPath.row]
        
        self.navigationController?.pushViewController(playerController, animated: true)
        print("teste")
        
        //Desselecionar a linha para nao mudar a cor depois que seleciona...
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}



