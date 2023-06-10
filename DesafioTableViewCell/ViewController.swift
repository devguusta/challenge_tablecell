//
//  ViewController.swift
//  DesafioTableViewCell
//
//  Created by Premiersoft on 10/06/23.
//

import UIKit

class ViewController: UIViewController {
    
  
    let listOfCar: [CarEntity] = [
        
        CarEntity(imageCar: "https://img.freepik.com/fotos-premium/super-carro-esportivo-em-um-fundo-branco-ilustracao-3d_101266-10371.jpg", titleCar: "Gol", descriptionCar: "Um famoso carro popular"),
        CarEntity(imageCar: "https://img.freepik.com/fotos-premium/super-carro-esportivo-em-um-fundo-branco-ilustracao-3d_101266-10371.jpg", titleCar: "Celta", descriptionCar: "O melhor carro popular do Brasil"),
        CarEntity(imageCar: "https://img.freepik.com/fotos-premium/super-carro-esportivo-em-um-fundo-branco-ilustracao-3d_101266-10371.jpg", titleCar: "Honda", descriptionCar: "Um carro para elevar o seu padrão de vida."),
    
    ];
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configProgressIndicator()
        configTableView()
    }
    
    func configProgressIndicator() {
        progressIndicator.tintColor = .red;
        progressIndicator.startAnimating();
    }
    
    func configTableView( ){
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        progressIndicator.stopAnimating();
        progressIndicator.removeFromSuperview()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell;
        cell?.setupCell(car: listOfCar[indexPath.row])
     
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCar.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicou em \(listOfCar[indexPath.row].descriptionCar)")
        let vc: DescriptionCarViewController? = UIStoryboard(name: DescriptionCarViewController.identifier, bundle: nil)
            .instantiateViewController(identifier:DescriptionCarViewController.identifier){
                coder in return DescriptionCarViewController(coder: coder, car: self.listOfCar[indexPath.row])
            }
        self.navigationController?.pushViewController(vc ?? UIViewController( ), animated: true)
       }
    
   
    
    
    
}

