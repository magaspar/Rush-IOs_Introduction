//
//  ListTableViewController.swift
//  Map
//
//  Created by Benjamin Pisano on 26/01/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import UIKit
import MapKit

class ListTableViewController: UITableViewController {

    let list = [Place(coordinate: CLLocationCoordinate2D(latitude: 44.339232, longitude: 1.207528), title: "Montcuq", description: "A cool place to be", text: "Montcuq est une ancienne commune française située dans le département du Lot, en région Occitanie. Cette charmante bourgade possède deux chateaux et de multiple auberge, disponible pour vos mariages ou autres Bar Mitzvah ! De plus l'activité touristique se développe grace notamment a une fête du slip qui est organisée depuis 28 juillet 2016 !"),
                Place(coordinate: CLLocationCoordinate2D(latitude: 48.067620, longitude: 12.862121), title: "Fucking", description: "Another cool place", text: "Fucking est un village d'environ 150 habitants. L'endroit porte ce nom depuis au moins l'an 1070, et devrait son appellation à un personnage du vie siècle dénommé « Focko », le suffixe ing signifiant en vieil allemand « les gens ». « Fucking » pourrait donc se traduire par « Chez Focko »."),
                Place(coordinate: CLLocationCoordinate2D(latitude: 48.885630, longitude: 2.064770), title: "Fourqueux", description: "A nice place", text: "Commune medieval rattachée a St-Germain-En-Laye, Fourqueux se distingue par son église classée monument historique ainsi que sa fête du village, organisée tous les ans en début d'année scolaire (septembre), au stade de la commune (animations, feux d'artifices)."),
                Place(coordinate: CLLocationCoordinate2D(latitude: 42.433683, longitude: 1.944643), title: "Bourg-madame", description: "A beautiful place", text: "À l'origine, La Guingueta d'Ix (les Guinguettes d'Hix en français) était un hameau de la ville originellement du Comté de Barcelone (Comtat de Barcelona) d'Ix (ou Hix en français), situé près de la nouvelle frontière tracée entre la France et l'Espagne après les traités des Pyrénées de 1659 et de Llivia de 1660. Profitant du développement du commerce transfrontalier et de la contrebande, une grande partie des habitants d'Ix se déplacèrent vers le hameau des Guinguettes d'Hix, qui finit par devenir plus peuplé que le village original.\nLors des Cent-Jours, en 1815, Napoléon Ier avait exilé à Barcelone le duc d'Angoulême Louis-Antoine, fils ainé de Charles d'Artois (futur Charles X) et neveu de Louis XVIII. De retour après la bataille de Waterloo, le duc d'Angoulême s'installa le 10 juillet à Puigcerdà.\nLe duc décida d'élever le premier village français qu'il allait traverser au rang de ville : les habitants proposèrent alors de rebaptiser la ville Bourg-Angoulême. Mais le duc préféra rendre hommage à son épouse Marie-Thérèse de France (fille ainée de Louis XVI, elle portait donc le titre de « Madame Royale »), et donna à la ville le nom de Bourg-Madame.\nDe janvier à mars 1939, le gouvernement Daladier ouvre la frontière aux réfugiés espagnols affluant à travers les Pyrénées par Le Perthus, Cerbère et Bourg-Madame. Cet épisode de la Guerre civile espagnole, connu sous le nom de Retirada, inspirera la Chanson de Bourg-Madame qui évoque l'entrée des réfugiés dans le bourg.\nLa commune de Caldégas est rattachée le 1er juin 1973 à Bourg-Madame par arrêté préfectoral du 2 mai 1973.")]
    var touchedPlace: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlaceTableViewCell
        let place = list[indexPath.row]
        
        cell.titleLabel?.text = place.title
        cell.descriptionLabel?.text = place.description
        cell.mapView.zoomOn(place: place)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        touchedPlace = list[indexPath.row]
        performSegue(withIdentifier: "location", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "location" {
            let mapVC = segue.destination as! MapViewController
            
            mapVC.place = touchedPlace
        }
    }
}
