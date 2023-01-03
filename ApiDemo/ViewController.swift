//
//  ViewController.swift
//  ApiDemo
//
//  Created by Mac Mini on 03/01/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var viewAddUser: UIView!
    
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var inactiveButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var AddNewUserView: UIView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    //MARK: - Declaration
    var getUsersModel: [GetUsersModel]?
    var selectedStatus = String()
    var selectedGender = String()
    var addUserModel: AddUserModel?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        apiCallForUserList()
    }
    
    
    //MARK: - Setupview function
    func register() {
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self
        self.usersTableView.register(UINib(nibName: "AddNewUserTableViewCell", bundle: nil), forCellReuseIdentifier: AddNewUserTableViewCell.identifier)
        viewAddUser.isHidden = true
        maleButton.isSelected = true
        activeButton.isSelected = true
        selectedGender = "male"
        selectedStatus = "active"
        selectedStatus = ""
        addUserButton.addButtonBorder(borderWidth: 1.0, borderColor: .black, cornerRadius: 10.0)
        AddNewUserView.addViewBorder(borderWidth: 2.0, borderColor: .black, cornerRadius: 15.0)
        doneButton.layer.cornerRadius = doneButton.frame.size.height/2
    }
    
    func checkValidation() {
        if !Validator.sharedInstance.isValidEmail(email: self.emailTextField.text ?? "") {
            self.showAlert(title: TextString().alert, message: TextString().enterValidEmail)
        } else if !Validator.sharedInstance.isValidEmpty(text: self.nameTextField.text ?? "") {
            self.showAlert(title: TextString().alert, message: TextString().enterPassword)
        } else {
            self.apiCallingAddUser()
//            let nav = AppStoryBoard.Onboarding.instance.instantiateViewController(withIdentifier: "ProceedDetailsViewController") as! ProceedDetailsViewController
//            self.navigationController?.pushViewController(nav, animated: true)
        }
    }


    
    //MARK: - Button action
    @IBAction func addUserButtonTap(_ sender: UIButton) {
        viewAddUser.isHidden = false
    }
    
    @IBAction func done(ButtonTap_ sender: UIButton) {
        viewAddUser.isHidden = true
        checkValidation()
    }

    @IBAction func maleButtonTap(_ sender: UIButton) {
        if sender.isSelected {
            femaleButton.isSelected = false
            selectedGender = "male"
        } else {
            sender.isSelected = true
            selectedGender = "male"
            femaleButton.isSelected = false
        }
    }
    
    @IBAction func femaleButtonTap(_ sender: UIButton) {
        if sender.isSelected {
            selectedGender = "female"
            maleButton.isSelected = false
        } else {
            sender.isSelected = true
            selectedGender = "female"
            maleButton.isSelected = false
        }
    }
    
    @IBAction func inactiveButtonTap(_ sender: UIButton) {
        if sender.isSelected {
            selectedStatus = "inactive"
            activeButton.isSelected = false
        } else {
            sender.isSelected = true
            selectedStatus = "inactive"
            activeButton.isSelected = false
        }
    }
    
    @IBAction func activeButtonTap(_ sender: UIButton) {
        if sender.isSelected {
            inactiveButton.isSelected = false
            selectedStatus = "active"
        } else {
            sender.isSelected = true
            selectedStatus = "active"
            inactiveButton.isSelected = false
        }
    }
}

//MARK: - Tableview delegate and datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getUsersModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddNewUserTableViewCell.identifier, for: indexPath) as! AddNewUserTableViewCell
        cell.idLabel.text = "\(getUsersModel?[indexPath.row].id ?? 0)"
        cell.nameLabel.text = getUsersModel?[indexPath.row].name ?? ""
        cell.emailLabel.text = getUsersModel?[indexPath.row].email ?? ""
        cell.genderLabel.text = getUsersModel?[indexPath.row].gender ?? ""
        cell.statusLabel.text = getUsersModel?[indexPath.row].status ?? ""
       if cell.statusLabel.text == "inactive" {
           cell.userActivityImageView.isHighlighted = false
       } else if cell.statusLabel.text == "active" {
           cell.userActivityImageView.isHighlighted = true
       }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension ViewController {
    func apiCallForUserList() {
        activityIndicator.startAnimating()
        HomeServices().getCategory { response in
            activityIndicator.stopAnimating()
            print(response)
            self.getUsersModel = response
            self.usersTableView.reloadData()
        } failure: { error in
            activityIndicator.stopAnimating()
            self.showAlert(title: TextString().error, message: error)
        }
    }
    
    func apiCallingAddUser() {
        let param = ["email": "\(emailTextField.text ?? "")",
                     "name": "\(nameTextField.text ?? "")",
                     "status": "\(selectedStatus)",
                     "gender": "\(selectedGender)"] as [String: AnyObject]
        activityIndicator.startAnimating()

        HomeServices().getAddUSer(paramater: param) { response in
            activityIndicator.stopAnimating()
            print(response)
            self.addUserModel = response
           // self.getUsersModel?.append(response)
            if response.id != nil {
                self.apiCallForUserList()
            } else {
                
            }
            self.usersTableView.reloadData()
        } failure: { error in
            activityIndicator.stopAnimating()
            self.showAlert(title: TextString().error, message: error)
            print(error)
        }

    }
}

