//
//  ViewController.swift
//  MultasRD
//
//  Created by Luis Tejada on 6/1/18.
//  Copyright © 2018 Luis Tejada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bannerLabel : UILabel!
    var documentTextField : UITextField!
    var consultButton : UIButton!
    var bannerImage : UIImageView!
    var tableView : UITableView!
    var lastContentOffset : CGFloat!
    var isScrollToTop : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lastContentOffset = 0
        isScrollToTop = false
        
        //The banner label with text that say: "MultasRD
        bannerLabel = UILabel(frame: CGRect.zero)
        documentTextField = UITextField(frame: CGRect.zero)
        consultButton = UIButton(frame: CGRect.zero)
        bannerImage = UIImageView(image: #imageLiteral(resourceName: "appIcon"))
        tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        
        bannerLabel.translatesAutoresizingMaskIntoConstraints = false
        documentTextField.translatesAutoresizingMaskIntoConstraints = false
        consultButton.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        bannerLabel.attributedText = NSAttributedString(string: "MultasRD", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 38)])
        bannerLabel.numberOfLines = 0
        bannerLabel.adjustsFontSizeToFitWidth = true
        bannerLabel.minimumScaleFactor = 0.5
        view.addSubview(bannerLabel)
        
        documentTextField.borderStyle = .none
        documentTextField.backgroundColor = UIColor.white
        documentTextField.font = UIFont.init(name: "Arial", size: 15)
        documentTextField.placeholder = "Introdusca su cédula!"
        documentTextField.textAlignment = .center
        documentTextField.layer.cornerRadius = 5
        view.addSubview(documentTextField)
        
        consultButton.setTitle("Consultar", for: .normal)
        consultButton.backgroundColor = UIColor.white
        consultButton.setTitleColor(#colorLiteral(red: 0.7235868718, green: 0.9063029817, blue: 0.9236206709, alpha: 1), for: .normal)
        consultButton.setTitleColor(#colorLiteral(red: 0.6125294495, green: 0.7768875798, blue: 0.7917306372, alpha: 1), for: .highlighted)
        consultButton.layer.cornerRadius = 5
        view.addSubview(consultButton)
        
        bannerImage.contentMode = .scaleAspectFit
        bannerImage.clipsToBounds = true
        bannerImage.layer.cornerRadius = bannerImage.frame.size.width / CGFloat(2)
        view.addSubview(bannerImage)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.estimatedRowHeight = 60
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)
        tableView.register(MultaTableTableViewCell.self, forCellReuseIdentifier: "multaCell")
        tableView.backgroundColor = #colorLiteral(red: 0.7241066098, green: 0.9044535756, blue: 0.9248488545, alpha: 1)
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.5)
        
        view.addSubview(tableView)
        
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[bannerImage]-1-[bannerLabel]-8-[documentTextField(40)]-8-[consultButton(40)]", options: [], metrics: nil, views: ["bannerLabel":bannerLabel, "documentTextField":documentTextField, "consultButton":consultButton, "bannerImage":bannerImage])
        view.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=20)-[documentTextField(>=250)]-(>=20)-|", options: [], metrics: nil, views: ["bannerLabel":bannerLabel, "documentTextField":documentTextField, "consultButton":consultButton, "bannerImage":bannerImage])
        view.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=20)-[consultButton(>=250)]-(>=20)-|", options: [], metrics: nil, views: ["bannerLabel":bannerLabel, "documentTextField":documentTextField, "consultButton":consultButton, "bannerImage":bannerImage])
        view.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[consultButton]-20-[tableView]-0-|", options: [], metrics: ["midView":self.view.center.y], views: ["bannerLabel":bannerLabel, "documentTextField":documentTextField, "consultButton":consultButton, "bannerImage":bannerImage, "tableView":tableView])
        view.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: [], metrics: ["midView":self.view.center.y], views: ["bannerLabel":bannerLabel, "documentTextField":documentTextField, "consultButton":consultButton, "bannerImage":bannerImage, "tableView":tableView])
        view.addConstraints(constraints)
        
        var constraint = NSLayoutConstraint(item: bannerLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: documentTextField, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: consultButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: bannerImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        view.addConstraint(constraint)
    }
    
    override var prefersStatusBarHidden : Bool {return true}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        documentTextField.resignFirstResponder()
    }


}
extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "multaCell", for: indexPath) as! MultaTableTableViewCell
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.25
        cell.layer.masksToBounds = false
        cell.clipsToBounds = false
        cell.imageView?.image = #imageLiteral(resourceName: "ic_multas").tinted(with: #colorLiteral(red: 1, green: 0.9930704543, blue: 0.8873265226, alpha: 1))
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let multaCell = cell as! MultaTableTableViewCell
        multaCell.cellContainer.alpha = 1
        if self.isScrollToTop {
        multaCell.center.y = multaCell.center.y + multaCell.bounds.height
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {

            multaCell.center.y = multaCell.center.y - multaCell.bounds.height
            multaCell.cellContainer.alpha = 0.5
            }, completion: nil)
        } else {
            
            multaCell.center.y = multaCell.center.y - multaCell.bounds.height
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                
                multaCell.center.y = multaCell.center.y + multaCell.bounds.height
                multaCell.cellContainer.alpha = 0.5
            }, completion: nil)
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        self.lastContentOffset = scrollView.contentOffset.y
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            self.isScrollToTop = true
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            self.isScrollToTop = false
        }
    }
}
extension UIImage {
    func tinted(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        color.set()
        withRenderingMode(.alwaysTemplate)
            .draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
