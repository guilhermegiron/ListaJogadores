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
    
    let players = [Player(name: "Luis Suarez 🇺🇾 ", idade: 36, corcelula: .systemBlue, corescrita: .white ,totalgols: 500, salario: 1100500.40),
                   Player(name: "Lionel Messi 🇦🇷", idade: 36, corcelula: .blue, corescrita: .white, totalgols: 800, salario: 2000000.00),
                   Player(name: "Neymar Jr 🇧🇷", idade: 31, corcelula: UIColor(red: 243, green: 238, blue: 104), corescrita: UIColor(red: 25, green: 56, blue: 31), totalgols: 400, salario: 3000000.00),
                   Player(name: "Cristiano Ronaldo 🇵🇹", idade: 38, corcelula: UIColor(red: 2, green: 57, blue: 74), corescrita: .green, totalgols: 750, salario: 4500000.00)]
    //mbappe 24
    
    
    let emoticons = ["Luis Suarez 🇺🇾", "Neymar Jr 🇧🇷", " Lionel Messi 🇦🇷", " Kylian Mbappe 🇫🇷",
                     " Haaland 🏴󠁧󠁢󠁥󠁮󠁧󠁿", " Cristiano Ronaldo 🇵🇹", " Vinicius Jr 🇧🇷", " Karin Benzema 🇫🇷",
                     " Luka Modric 🇭🇷", " Robert Lewandowski 🇵🇱", " Sadio Mane 🇸🇳"]
    
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
        view.backgroundColor = .gray
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
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.529).isActive = true
        
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
        
    }

}



