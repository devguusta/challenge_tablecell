//
//  TableViewCell.swift
//  DesafioTableViewCell
//
//  Created by Premiersoft on 10/06/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    static let identifier: String = "TableViewCell";
    
    
    static func nib( ) -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(car: CarEntity) {
        configTitleLabel(title: car.titleCar)
        configImageCell(urlImage: car.imageCar)
    }
    
    
   private  func configTitleLabel( title: String){
        
        titleCell.tintColor = .red;
        titleCell.numberOfLines = 2;
        titleCell.textColor = .black;
        titleCell.text = title;
    }
    
    private func configImageCell(urlImage: String){
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!)
        imageCell.image = UIImage(data: data!)
       imageCell.contentMode = .scaleAspectFit
        
    }
    
}
