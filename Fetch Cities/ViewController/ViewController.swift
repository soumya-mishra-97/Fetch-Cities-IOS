//
//  ViewController.swift
//  Fetch Cities
//
//  Created by Soumya Mishra on 09/04/25.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var citiesTableView: UITableView!
    
    private var viewModel = CityViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationTitle()
        viewModel.fetchCityData()
        setupUI()
        bindViewModel()
    }
    
    private func navigationTitle(){
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.text = "Fetch Cities"
        navigationItem.titleView = label
    }

    private func setupUI() {
        citiesTableView.separatorColor = .gray
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        citiesTableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
    }
    
    private func bindViewModel() {
        viewModel.$cities
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.citiesTableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
                    return UITableViewCell()
                }
        let city = viewModel.cities[indexPath.row]
        cell.configrue(with: city)
        return cell
    }
}
