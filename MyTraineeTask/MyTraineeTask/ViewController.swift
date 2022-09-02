//
//  ViewController.swift
//  MyTraineeTask
//
//  Created by Artyom Ivanov on 01.09.2022.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    
    //MARK: - TableViewFunc
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    //MARK: - UIElements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
        
        SetupConstrain()
    }
    
    
    private func SetupConstrain() {
    
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}


