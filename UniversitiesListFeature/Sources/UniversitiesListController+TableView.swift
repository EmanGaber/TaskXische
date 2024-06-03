//
//  UniversitiesList.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import UIKit

extension UniversitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "UniversitiesCell", bundle:  .module), forCellReuseIdentifier: "UniversitiesCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.universitiesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversitiesCell") as! UniversitiesCell
        
        cell.selectedBackgroundView = UIView()
        
         presenter.configureUniversitiesCell(cell, indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = presenter.getUniversityInRow(row: indexPath.row)

        router!.navigateToUniversitiesDetails(from: self, universityName:model?.name ?? "" ,
                                                               universityWebPages: model?.webPages ?? [],
                                                               universityAlphaTwoCode: model?.alphaTwoCode ?? "",
                                                               universityStateProvince: model?.stateProvince ?? "",
                                                               universityCountry: model?.country ?? "")
        
        
        
    }
}

