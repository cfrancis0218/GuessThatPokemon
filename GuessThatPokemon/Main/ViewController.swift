//
//  ViewController.swift
//  GuessThatPokemon
//
//  Created by Christian Elijah on 2020-10-26.
//

import UIKit

class ViewController: UIViewController {
    
    var pokemonNames = [String]()
    
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet var randomImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPokemonToList()
        guessThatPokemon()
    }
    
    private func addPokemonToList() {
        pokemonNames += ["Pikachu", "Bulbasaur", "Squirtle", "Charmander", "Charizard", "Slowpoke", "Piplup", "Chimchar", "Jolteon", "Caterpie"]
    }
    
    private func guessThatPokemon(action: UIAlertAction! = nil) {
        
        let randomImages = arc4random_uniform(10)
        
        
        switch randomImages {
            case 0:
                randomImage.image = #imageLiteral(resourceName: "pipdark")
                break
            case 1:
                randomImage.image = #imageLiteral(resourceName: "bulbdark")
                break
            case 2:
                randomImage.image = #imageLiteral(resourceName: "chimdark")
                break
            case 3:
                randomImage.image = #imageLiteral(resourceName: "joltdark")
                break
            case 4:
                randomImage.image = #imageLiteral(resourceName: "pikdark")
                break
            case 5:
                randomImage.image = #imageLiteral(resourceName: "chardark")
                break
            case 6:
                randomImage.image = #imageLiteral(resourceName: "zarddark")
                break
            case 7:
                randomImage.image = #imageLiteral(resourceName: "catdark")
                break
            case 8:
                randomImage.image = #imageLiteral(resourceName: "squirtdark")
                break
            default:
                print("No Pokemon")
        }
        
        // Animations
        self.randomImage.alpha = 0.0
        self.nextButton.isHidden = true
        
        UIImageView.animate(withDuration: 0.7, animations: ({
            self.randomImage.center.y += -100
            self.randomImage.alpha = 1.0
        }))
        
        UIButton.animate(withDuration: 0.5, animations: ({
            self.nextButton.center.x += -100
            self.nextButton.isHidden = false
        }))
        
        // Shuffle through Names to present on buttons
        pokemonNames.shuffle()
        // Set Titles to buttons
        optionOneButton.setTitle(pokemonNames[0], for: .normal)
        optionTwoButton.setTitle(pokemonNames[1], for: .normal)
        optionThreeButton.setTitle(pokemonNames[2], for: .normal)
        // Clip images to bounds
        randomImage.clipsToBounds = true
        // Return to Original Color
        optionOneButton.backgroundColor = UIColor(red: 22/255.0, green: 24/255.0, blue: 26/255.0, alpha: 1.0)
        optionTwoButton.backgroundColor = UIColor(red: 22/255.0, green: 24/255.0, blue: 26/255.0, alpha: 1.0)
        optionThreeButton.backgroundColor = UIColor(red: 22/255.0, green: 24/255.0, blue: 26/255.0, alpha: 1.0)
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "", message: "Would You like to continue?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: guessThatPokemon))
        present(alertController, animated: true, completion: nil)
    }
    
    // Main
    @IBAction func correctButtonTapped(_ sender: UIButton) {
        
        let tagIsZero = (sender.tag == 0)
        let tagIsOne = (sender.tag == 1)
        let tagIsTwo = (sender.tag == 2)
        
        if tagIsZero && randomImage.image == UIImage(named: "pipdark") && optionOneButton.titleLabel?.text == "Piplup" {
            print(sender.tag)
            
            randomImage.image = #imageLiteral(resourceName: "piplup")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "pipdark") && optionTwoButton.titleLabel?.text == "Piplup" {
            randomImage.image = #imageLiteral(resourceName: "piplup")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "pipdark") && optionThreeButton.titleLabel?.text == "Piplup" {
            randomImage.image = #imageLiteral(resourceName: "piplup")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "pikdark") && optionOneButton.titleLabel?.text == "Pikachu" {
            randomImage.image = #imageLiteral(resourceName: "pikachu")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "pikdark") && optionTwoButton.titleLabel?.text == "Pikachu" {
            randomImage.image = #imageLiteral(resourceName: "pikachu")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "pikdark") && optionThreeButton.titleLabel?.text == "Pikachu" {
            randomImage.image = #imageLiteral(resourceName: "pikachu")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "joltdark") && optionOneButton.titleLabel?.text == "Jolteon" {
            randomImage.image = #imageLiteral(resourceName: "jolteon")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "joltdark") && optionTwoButton.titleLabel?.text == "Jolteon" {
            randomImage.image = #imageLiteral(resourceName: "jolteon")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "joltdark") && optionThreeButton.titleLabel?.text == "Jolteon" {
            randomImage.image = #imageLiteral(resourceName: "jolteon")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "zarddark") && optionOneButton.titleLabel?.text == "Charizard" {
            randomImage.image = #imageLiteral(resourceName: "charizard")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "zarddark") && optionTwoButton.titleLabel?.text == "Charizard" {
            randomImage.image = #imageLiteral(resourceName: "charizard")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "zarddark") && optionThreeButton.titleLabel?.text == "Charizard" {
            randomImage.image = #imageLiteral(resourceName: "charizard")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "bulbdark") && optionOneButton.titleLabel?.text == "Bulbasaur" {
            randomImage.image = #imageLiteral(resourceName: "bulbasaur")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "bulbdark") && optionTwoButton.titleLabel?.text == "Bulbasaur" {
            randomImage.image = #imageLiteral(resourceName: "bulbasaur")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "bulbdark") && optionThreeButton.titleLabel?.text == "Bulbasaur" {
            randomImage.image = #imageLiteral(resourceName: "bulbasaur")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "catdark") && optionOneButton.titleLabel?.text == "Caterpie" {
            randomImage.image = #imageLiteral(resourceName: "caterpie")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "catdark") && optionTwoButton.titleLabel?.text == "Caterpie" {
            randomImage.image = #imageLiteral(resourceName: "caterpie")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "catdark") && optionThreeButton.titleLabel?.text == "Caterpie" {
            randomImage.image = #imageLiteral(resourceName: "caterpie")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "chimdark") && optionOneButton.titleLabel?.text == "Chimchar" {
            randomImage.image = #imageLiteral(resourceName: "chimchar")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "chimdark") && optionTwoButton.titleLabel?.text == "Chimchar" {
            randomImage.image = #imageLiteral(resourceName: "chimchar")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "chimdark") && optionThreeButton.titleLabel?.text == "Chimchar" {
            randomImage.image = #imageLiteral(resourceName: "chimchar")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "squirtdark") && optionOneButton.titleLabel?.text == "Squirtle" {
            randomImage.image = #imageLiteral(resourceName: "squirtle")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "squirtdark") && optionTwoButton.titleLabel?.text == "Squirtle" {
            randomImage.image = #imageLiteral(resourceName: "squirtle")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "squirtdark") && optionThreeButton.titleLabel?.text == "Squirtle" {
            randomImage.image = #imageLiteral(resourceName: "squirtle")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "chardark") && optionOneButton.titleLabel?.text == "Charmander" {
            randomImage.image = #imageLiteral(resourceName: "charmander")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "chardark") && optionTwoButton.titleLabel?.text == "Charmander" {
            randomImage.image = #imageLiteral(resourceName: "charmander")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "chardark") && optionThreeButton.titleLabel?.text == "Charmander" {
            randomImage.image = #imageLiteral(resourceName: "charmander")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else if tagIsZero && randomImage.image == UIImage(named: "slowdark") && optionOneButton.titleLabel?.text == "Slowpoke" {
            randomImage.image = #imageLiteral(resourceName: "slowpoke")
            optionOneButton.backgroundColor = .systemGreen
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsOne && randomImage.image == UIImage(named: "slowdark") && optionTwoButton.titleLabel?.text == "Slowpoke" {
            randomImage.image = #imageLiteral(resourceName: "slowpoke")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemGreen
            optionThreeButton.backgroundColor = .systemRed
        } else if tagIsTwo && randomImage.image == UIImage(named: "slowdark") && optionThreeButton.titleLabel?.text == "Slowpoke" {
            randomImage.image = #imageLiteral(resourceName: "slowpoke")
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemGreen
        } else {
            optionOneButton.backgroundColor = .systemRed
            optionTwoButton.backgroundColor = .systemRed
            optionThreeButton.backgroundColor = .systemRed
            
            let playAgainController = UIAlertController(title: "Play Again?", message: "Do you want to play again?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
            
            playAgainController.addAction(yesAction)
            playAgainController.addAction(noAction)
            present(playAgainController, animated: true, completion: nil)
        }
    }
    
    
}

