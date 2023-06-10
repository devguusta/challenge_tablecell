
import UIKit

class DescriptionCarViewController: UIViewController {
    static let identifier: String = "DescriptionCarViewController";
    
    @IBOutlet weak var titleCar: UILabel!
    @IBOutlet weak var descriptionCar: UILabel!
    
    @IBOutlet weak var imageCar: UIImageView!
    let car: CarEntity;
    
  init?(coder: NSCoder, car: CarEntity) {
     
      self.car = car;
      super.init(coder: coder)
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpController(car: car)
       
    }
    

    private  func configTitleLabel( title: String){
    
      
        titleCar.numberOfLines = 2;
        titleCar.textColor = .black;
        titleCar.text = title;
     }
     
     private func configImageCar(urlImage: String){
         let url = URL(string: urlImage)
         let data = try? Data(contentsOf: url!)
         imageCar.image = UIImage(data: data!)
         imageCar.contentMode = .scaleAspectFit
         imageCar.backgroundColor = .darkGray;
      
         
     }
     
    
    private  func configDescriptionCar( title: String){
         
        descriptionCar.tintColor = .red;
        
        descriptionCar.textColor = .black;
        descriptionCar.text = title;
     }
    
    func setUpController( car: CarEntity) {
        configTitleLabel(title: car.titleCar);
        configDescriptionCar(title: car.descriptionCar);
        configImageCar(urlImage: car.imageCar)
    }

    
}
