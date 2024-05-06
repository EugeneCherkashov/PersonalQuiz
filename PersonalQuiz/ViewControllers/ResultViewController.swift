//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
            dismiss(animated: true)
    }
    
    
}



extension ResultViewController {
    private func updateResult() {
        
        let mostFAnimal: Animal
        let animals = answers.map { $0.animal }
        let animalCountDict = animals.reduce(into: [:]) { frequencyOfAnimals, animal in frequencyOfAnimals[animal, default: 0] += 1
        }
        if let mostFrequentAnimal = animalCountDict.max(by: { $0.value < $1.value }) {
            mostFAnimal = mostFrequentAnimal.key
        }
        
        updateUI(with: mostFAnimal) // Я запутался, не понимаю, как исправлять код
        
    }
    
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
    
}
