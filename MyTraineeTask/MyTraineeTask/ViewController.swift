//
//  ViewController.swift
//  MyTraineeTask
//
//  Created by Artyom Ivanov on 01.09.2022.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    
    //получает даннае с модели
    var company: Company? {
        didSet{
            
            // что бы выполнение задачи происходило последовательно в главном потоке
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.textLable.text = self.company?.company.name
            }
        }
    }
    
    
    //MARK: - TableViewFunc
    
    //отображение количества строк
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company?.company.employees.count ?? 0
    }
    
    //отображение данных в ячейках
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        var employer = company?.company.employees[indexPath.row]
        cell.textLabel?.text = "Name: \((employer?.name)!) (phone: \((employer?.phone_number)!))"
        cell.detailTextLabel?.text = "Skill: \((employer?.skills.description)!)"
        return cell
    }
    

    //MARK: - UIElements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell") //регистрация объектас представлением таблицы
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var textLable: UILabel = {
       let lable = UILabel()
       lable.translatesAutoresizingMaskIntoConstraints = false
        
       return lable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //MARK: - AddJSON
        
        guard let url = URL(string:"https://run.mocky.io/v3/0c5d58be-3cf8-41c1-9cce-0c5ee681b107")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
                do {
                    let company = try JSONDecoder().decode(Company.self, from: data)
                    self.company = company
                }
                catch {
                    print(error)
                }
        }.resume()
            
                

        ConfigureView()
        SetupSubviews()
    }
    
    
    //MARK: - AddElements
    
    private func ConfigureView(){
        
        view.backgroundColor = .white
    }
    
    private func SetupSubviews() {
        
        tableView.dataSource = self
        
        view.addSubview(tableView)
        view.addSubview(textLable)
        
        SetupConstrain()
    }
    
    
    private func SetupConstrain() {
    
        //textLable constraints
        textLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //textLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive
        textLable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        
        
        // tebleView constraints
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}


