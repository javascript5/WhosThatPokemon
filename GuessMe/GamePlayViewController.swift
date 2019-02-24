//
//  GamePlayViewController.swift
//  GuessMe
//
//  Created by pleng on 24/2/2562 BE.
//  Copyright © 2562 pleng. All rights reserved.
//

import UIKit
import Kingfisher

class GamePlayViewController: UIViewController {
    var imgList:[UIImage] = [#imageLiteral(resourceName: "ประชาธิปัตย์"),#imageLiteral(resourceName: "อนาคตใหม่"),#imageLiteral(resourceName: "เพื่อไทย")]
    var currentIndex = 0;
//    var answer:[String] = ["apisit","thanatorn","sudarat"];
    var answer = ""
    var heart:Int = 5;
    var score:Int = 0;
    let pokemonApiManager:PokemonApiManager = PokemonApiManager();
    let pokemonModel:PokemonModel = PokemonModel();
    @IBOutlet weak var guessImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var heartLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        textField.placeholder = String(repeating: "*", count: answer[currentIndex].count);
        heartLabel.text = String(repeating: "❤️", count: heart);
        loadPokemonData();

    }
    
    private func loadPokemonData(){
        let id = Int.random(in: 1 ... 100)
        pokemonApiManager.getPokemonDetails(id: id){ (pokemonModel) in
            self.answer = pokemonModel.name!
            self.textField.placeholder = String(repeating: "O", count: self.answer.count)
            let url = URL(string: pokemonModel.sprites!.front_default!)!
            self.guessImage.kf.setImage(with: url)
            print("\(pokemonModel.name!)")
        }
        
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        if answer == textField.text!.lowercased(){
            loadPokemonData()
            score += 10;
            scoreLabel.text = "score : \(score)"
            textField.text = ""
        }else{
            incorrectLabel.text = "\(textField.text!)"
            textField.text = "";
            incorrectLabel.isHidden = false;
            heart -= 1;
            heartLabel.text = String(repeating: "❤️", count: heart)
            if heart == 0{
                let alert = UIAlertController(title: "You Lose", message: "ไปฝึกมาใหม่ไอ่น้อง", preferredStyle: .alert);
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.dismiss(animated: true, completion: nil)
                }))
                present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
