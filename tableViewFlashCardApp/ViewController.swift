//
//  ViewController.swift
//  TableIndexViewCh#14
//
//  Created by Tabita Sadiq on 2/29/24.
//

import UIKit

struct MedicalTerm {
    let name: String
    let definition: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    let flashCards: [MedicalTerm] = [
        MedicalTerm(name: "Anemia", definition: "A condition in which there is a deficiency of red cells or of hemoglobin in the blood, resulting in pallor and weariness."),
        MedicalTerm(name: "Biopsy", definition: "A sample of tissue taken from the body for examination to diagnose a medical condition."),
        MedicalTerm(name: "Carcinoma", definition: "A type of cancer that starts in cells that make up the skin or the tissue lining organs, such as the liver or kidneys."),
        MedicalTerm(name: "Diabetes", definition: "A metabolic disease that causes high blood sugar because insulin production is inadequate, or because the body's cells do not respond properly to insulin."),
        MedicalTerm(name: "Embolism", definition: "The sudden blockage of a blood vessel by an embolus (a blood clot or a foreign body)."),
        MedicalTerm(name: "Fibrosis", definition: "The thickening and scarring of connective tissue, usually as a result of injury."),
        MedicalTerm(name: "Gangrene", definition: "The death of body tissue due to either a lack of blood flow or a serious bacterial infection."),
        MedicalTerm(name: "Hypertension", definition: "A condition in which the blood pressure in the arteries is persistently elevated."),
        MedicalTerm(name: "Immunodeficiency", definition: "A state in which the immune system's ability to fight infectious disease is compromised or entirely absent."),
        MedicalTerm(name: "Jaundice", definition: "A yellowing of the skin or whites of the eyes, arising from excess of the pigment bilirubin and typically caused by obstruction of the bile duct, liver disease, or excessive breakdown of red blood cells."),
        MedicalTerm(name: "Ketosis", definition: "A metabolic state characterized by raised levels of ketone bodies in the body tissues, which is typically pathological in conditions such as diabetes, or may be the result of a diet that is very low in carbohydrates."),
        MedicalTerm(name: "Leukemia", definition: "A malignant progressive disease in which the bone marrow and other blood-forming organs produce increased numbers of immature or abnormal leukocytes. These suppress the production of normal blood cells, leading to anemia and other symptoms."),
        MedicalTerm(name: "Melanoma", definition: "A type of skin cancer that develops from the pigment-containing cells known as melanocytes."),
        MedicalTerm(name: "Necrosis", definition: "The death of most or all of the cells in an organ or tissue due to disease, injury, or failure of the blood supply."),
        MedicalTerm(name: "Osteoporosis", definition: "A medical condition in which the bones become brittle and fragile from loss of tissue, typically as a result of hormonal changes, or deficiency of calcium or vitamin D."),
        MedicalTerm(name: "Pneumonia", definition: "An inflammatory condition of the lung affecting primarily the small air sacs known as alveoli, typically caused by an infection."),
        MedicalTerm(name: "Quarantine", definition: "A restriction on the movement of people and goods which is intended to prevent the spread of disease or pests."),
        MedicalTerm(name: "Rickets", definition: "A disease of children caused by vitamin D deficiency, characterized by imperfect calcification, softening, and distortion of the bones typically resulting in bow legs."),
        MedicalTerm(name: "Scurvy", definition: "A disease resulting from a lack of vitamin C, characterized by swollen bleeding gums and the opening of previously healed wounds."),
        MedicalTerm(name: "Tuberculosis", definition: "A potentially serious infectious bacterial disease that mainly affects the lungs."),
        MedicalTerm(name: "Ulcer", definition: "An open sore on an external or internal surface of the body, caused by a break in the skin or mucous membrane that fails to heal."),
        MedicalTerm(name: "Varicella", definition: "A highly contagious viral disease, also known as chickenpox, characterized by a fever and a red rash."),
        MedicalTerm(name: "Wernicke's Encephalopathy", definition: "A neurological disorder typically caused by a deficiency in thiamine (vitamin B1), characterized by nystagmus, ataxia, and confusion."),
        MedicalTerm(name: "Xerophthalmia", definition: "A medical condition in which the eye fails to produce tears, leading to dryness and potential damage to the cornea and conjunctiva."),
        MedicalTerm(name: "Yeast Infection", definition: "An infection caused by a fungus of the Candida species, particularly Candida albicans, affecting the skin or mucous membrane.")
        ]

    
    let indexArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    
    let cellID = "cellID"

   
    @IBOutlet weak var petTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.dataSource = self
        petTable.delegate = self
        petTable.sectionIndexColor = UIColor.white
        petTable.sectionIndexBackgroundColor = UIColor.black
        petTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //this method determines how many rows will be displayed in each section of the table view
        return flashCards.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        let terms = flashCards[indexPath.row]
        cell?.textLabel?.text = terms.name
        return cell!
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //didSelect handles tap action by user
        let term = flashCards[indexPath.row]
        let alert = UIAlertController(title: term.name, message: term.definition, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        flashCards.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return indexArray[section]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }




}

