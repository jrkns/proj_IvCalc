//
//  CalculatorCore.swift
//  IvCalc
//
//  Created by Danupat Kns. on 8/16/2559 BE.
//  Copyright © 2559 Danupat Kns.freeJ. All rights reserved.
//

import Foundation

class CalculatorCore {
    
    var mean : Double
    
    var max : Double
    
    var min : Double
    
    var best : Stat
    
    var worst : Stat
    
    var yourBest : Stat
    
    var yourWorst : Stat
    
    var combinationCount : Int

    init(){
        mean = 0
        max = 0
        min = 0
        combinationCount = 0
        best = Stat(atk: 0, def: 0, sta: 0)
        worst = Stat(atk: 0, def: 0, sta: 0)
        yourBest = Stat(atk: 0, def: 0, sta: 0)
        yourWorst = Stat(atk: 0, def: 0, sta: 0)
    }
    
    struct Stat {
        var atk : Int
        var def : Int
        var sta : Int
        init(atk : Int,def : Int,sta : Int) {
            self.atk = atk
            self.def = def
            self.sta = sta
        }
    }
    struct Level {
        var multiplierA : Double
        var multiplierB : Double
        var levelA : Int
        var levelB : Int
        init(A : Int,mA : Double,mB : Double) {
            self.multiplierA = mA
            self.multiplierB = mB
            self.levelA = A
            self.levelB = A+1
        }
    }
    
    fileprivate var pokeStat : Dictionary<String,Stat> = [
        "Abra" : Stat(atk: 110,def: 76,sta: 50),
        "Aerodactyl" : Stat(atk: 182,def: 162,sta: 160),
        "Alakazam" : Stat(atk: 186,def: 152,sta: 110),
        "Arbok" : Stat(atk: 166,def: 166,sta: 120),
        "Arcanine" : Stat(atk: 230,def: 180,sta: 180),
        "Articuno" : Stat(atk: 198,def: 242,sta: 180),
        "Beedrill" : Stat(atk: 144,def: 130,sta: 130),
        "Bellsprout" : Stat(atk: 158,def: 78,sta: 100),
        "Blastoise" : Stat(atk: 186,def: 222,sta: 158),
        "Bulbasaur" : Stat(atk: 126,def: 126,sta: 90),
        "Butterfree" : Stat(atk: 144,def: 144,sta: 120),
        "Caterpie" : Stat(atk: 62,def: 66,sta: 90),
        "Chansey" : Stat(atk: 40,def: 60,sta: 500),
        "Charizard" : Stat(atk: 212,def: 182,sta: 156),
        "Charmander" : Stat(atk: 128,def: 108,sta: 78),
        "Charmeleon" : Stat(atk: 160,def: 140,sta: 116),
        "Clefable" : Stat(atk: 178,def: 178,sta: 190),
        "Clefairy" : Stat(atk: 116,def: 124,sta: 140),
        "Cloyster" : Stat(atk: 196,def: 196,sta: 100),
        "Cubone" : Stat(atk: 102,def: 150,sta: 100),
        "Dewgong" : Stat(atk: 156,def: 192,sta: 180),
        "Diglett" : Stat(atk: 108,def: 86,sta: 20),
        "Ditto" : Stat(atk: 110,def: 110,sta: 96),
        "Dodrio" : Stat(atk: 182,def: 150,sta: 120),
        "Doduo" : Stat(atk: 126,def: 96,sta: 70),
        "Dragonair" : Stat(atk: 170,def: 152,sta: 122),
        "Dragonite" : Stat(atk: 250,def: 212,sta: 182),
        "Dratini" : Stat(atk: 128,def: 110,sta: 82),
        "Drowzee" : Stat(atk: 104,def: 140,sta: 120),
        "Dugtrio" : Stat(atk: 148,def: 140,sta: 70),
        "Eevee" : Stat(atk: 114,def: 128,sta: 110),
        "Ekans" : Stat(atk: 112,def: 112,sta: 70),
        "Electabuzz" : Stat(atk: 198,def: 160,sta: 130),
        "Electrode" : Stat(atk: 150,def: 174,sta: 120),
        "Exeggcute" : Stat(atk: 110,def: 132,sta: 120),
        "Exeggutor" : Stat(atk: 232,def: 164,sta: 190),
        "Farfetch'd" : Stat(atk: 138,def: 132,sta: 104),
        "Fearow" : Stat(atk: 168,def: 146,sta: 130),
        "Flareon" : Stat(atk: 238,def: 178,sta: 130),
        "Gastly" : Stat(atk: 136,def: 82,sta: 60),
        "Gengar" : Stat(atk: 204,def: 156,sta: 120),
        "Geodude" : Stat(atk: 106,def: 118,sta: 80),
        "Gloom" : Stat(atk: 162,def: 158,sta: 120),
        "Golbat" : Stat(atk: 164,def: 164,sta: 150),
        "Goldeen" : Stat(atk: 112,def: 126,sta: 90),
        "Golduck" : Stat(atk: 194,def: 176,sta: 160),
        "Golem" : Stat(atk: 176,def: 198,sta: 160),
        "Graveler" : Stat(atk: 142,def: 156,sta: 110),
        "Grimer" : Stat(atk: 124,def: 110,sta: 160),
        "Growlithe" : Stat(atk: 156,def: 110,sta: 110),
        "Gyarados" : Stat(atk: 192,def: 196,sta: 190),
        "Haunter" : Stat(atk: 172,def: 118,sta: 90),
        "Hitmonchan" : Stat(atk: 138,def: 204,sta: 100),
        "Hitmonlee" : Stat(atk: 148,def: 172,sta: 100),
        "Horsea" : Stat(atk: 122,def: 100,sta: 60),
        "Hypno" : Stat(atk: 162,def: 196,sta: 170),
        "Ivysaur" : Stat(atk: 156,def: 158,sta: 120),
        "Jigglypuff" : Stat(atk: 98,def: 54,sta: 230),
        "Jolteon" : Stat(atk: 192,def: 174,sta: 130),
        "Jynx" : Stat(atk: 172,def: 134,sta: 130),
        "Kabuto" : Stat(atk: 148,def: 142,sta: 60),
        "Kabutops" : Stat(atk: 190,def: 190,sta: 120),
        "Kadabra" : Stat(atk: 150,def: 112,sta: 80),
        "Kakuna" : Stat(atk: 62,def: 82,sta: 90),
        "Kangaskhan" : Stat(atk: 142,def: 178,sta: 210),
        "Kingler" : Stat(atk: 178,def: 168,sta: 110),
        "Koffing" : Stat(atk: 136,def: 142,sta: 80),
        "Krabby" : Stat(atk: 116,def: 110,sta: 60),
        "Lapras" : Stat(atk: 186,def: 190,sta: 260),
        "Lickitung" : Stat(atk: 126,def: 160,sta: 180),
        "Machamp" : Stat(atk: 198,def: 180,sta: 180),
        "Machoke" : Stat(atk: 154,def: 144,sta: 160),
        "Machop" : Stat(atk: 118,def: 96,sta: 140),
        "Magikarp" : Stat(atk: 42,def: 84,sta: 40),
        "Magmar" : Stat(atk: 214,def: 158,sta: 130),
        "Magnemite" : Stat(atk: 128,def: 138,sta: 50),
        "Magneton" : Stat(atk: 186,def: 180,sta: 100),
        "Mankey" : Stat(atk: 122,def: 96,sta: 80),
        "Marowak" : Stat(atk: 140,def: 202,sta: 120),
        "Meowth" : Stat(atk: 104,def: 94,sta: 180),
        "Metapod" : Stat(atk: 56,def: 86,sta: 100),
        "Mew" : Stat(atk: 220,def: 220,sta: 200),
        "Mewtwo" : Stat(atk: 284,def: 202,sta: 212),
        "Moltres" : Stat(atk: 242,def: 194,sta: 180),
        "Mr.Mime" : Stat(atk: 154,def: 196,sta: 80),
        "Muk" : Stat(atk: 180,def: 188,sta: 210),
        "Nidoking" : Stat(atk: 204,def: 170,sta: 162),
        "Nidoqueen" : Stat(atk: 184,def: 190,sta: 180),
        "Nidoran♀" : Stat(atk: 100,def: 104,sta: 110),
        "Nidoran♂" : Stat(atk: 110,def: 94,sta: 92),
        "Nidorina" : Stat(atk: 132,def: 136,sta: 140),
        "Nidorino" : Stat(atk: 142,def: 128,sta: 122),
        "Ninetales" : Stat(atk: 176,def: 194,sta: 146),
        "Oddish" : Stat(atk: 134,def: 130,sta: 90),
        "Omanyte" : Stat(atk: 132,def: 160,sta: 70),
        "Omastar" : Stat(atk: 180,def: 202,sta: 140),
        "Onix" : Stat(atk: 90,def: 186,sta: 70),
        "Paras" : Stat(atk: 122,def: 120,sta: 70),
        "Parasect" : Stat(atk: 162,def: 170,sta: 120),
        "Persian" : Stat(atk: 156,def: 146,sta: 130),
        "Pidgeot" : Stat(atk: 170,def: 166,sta: 166),
        "Pidgeotto" : Stat(atk: 126,def: 122,sta: 126),
        "Pidgey" : Stat(atk: 94,def: 90,sta: 80),
        "Pikachu" : Stat(atk: 124,def: 108,sta: 70),
        "Pinsir" : Stat(atk: 184,def: 186,sta: 130),
        "Poliwag" : Stat(atk: 108,def: 98,sta: 80),
        "Poliwhirl" : Stat(atk: 132,def: 132,sta: 130),
        "Poliwrath" : Stat(atk: 180,def: 202,sta: 180),
        "Ponyta" : Stat(atk: 168,def: 138,sta: 100),
        "Porygon" : Stat(atk: 156,def: 158,sta: 130),
        "Primeape" : Stat(atk: 178,def: 150,sta: 130),
        "Psyduck" : Stat(atk: 132,def: 112,sta: 100),
        "Raichu" : Stat(atk: 200,def: 154,sta: 120),
        "Rapidash" : Stat(atk: 200,def: 170,sta: 130),
        "Raticate" : Stat(atk: 146,def: 150,sta: 110),
        "Rattata" : Stat(atk: 92,def: 86,sta: 60),
        "Rhydon" : Stat(atk: 166,def: 160,sta: 210),
        "Rhyhorn" : Stat(atk: 110,def: 116,sta: 160),
        "Sandshrew" : Stat(atk: 90,def: 114,sta: 100),
        "Sandslash" : Stat(atk: 150,def: 172,sta: 150),
        "Scyther" : Stat(atk: 176,def: 180,sta: 140),
        "Seadra" : Stat(atk: 176,def: 150,sta: 110),
        "Seaking" : Stat(atk: 172,def: 160,sta: 160),
        "Seel" : Stat(atk: 104,def: 138,sta: 130),
        "Shellder" : Stat(atk: 120,def: 112,sta: 60),
        "Slowbro" : Stat(atk: 184,def: 198,sta: 190),
        "Slowpoke" : Stat(atk: 110,def: 110,sta: 180),
        "Snorlax" : Stat(atk: 180,def: 180,sta: 320),
        "Spearow" : Stat(atk: 102,def: 78,sta: 80),
        "Squirtle" : Stat(atk: 112,def: 142,sta: 88),
        "Starmie" : Stat(atk: 194,def: 192,sta: 120),
        "Staryu" : Stat(atk: 130,def: 128,sta: 60),
        "Tangela" : Stat(atk: 164,def: 152,sta: 130),
        "Tauros" : Stat(atk: 148,def: 184,sta: 150),
        "Tentacool" : Stat(atk: 106,def: 136,sta: 80),
        "Tentacruel" : Stat(atk: 170,def: 196,sta: 160),
        "Vaporeon" : Stat(atk: 186,def: 168,sta: 260),
        "Venomoth" : Stat(atk: 172,def: 154,sta: 140),
        "Venonat" : Stat(atk: 108,def: 118,sta: 120),
        "Venusaur" : Stat(atk: 198,def: 200,sta: 160),
        "Victreebel" : Stat(atk: 222,def: 152,sta: 160),
        "Vileplume" : Stat(atk: 202,def: 190,sta: 150),
        "Voltorb" : Stat(atk: 102,def: 124,sta: 80),
        "Vulpix" : Stat(atk: 106,def: 118,sta: 76),
        "Wartortle" : Stat(atk: 144,def: 176,sta: 118),
        "Weedle" : Stat(atk: 68,def: 64,sta: 80),
        "Weepinbell" : Stat(atk: 190,def: 110,sta: 130),
        "Weezing" : Stat(atk: 190,def: 198,sta: 130),
        "Wigglytuff" : Stat(atk: 168,def: 108,sta: 280),
        "Zapdos" : Stat(atk: 232,def: 194,sta: 180),
        "Zubat" : Stat(atk: 88,def: 90,sta: 80)
    ]
    
    fileprivate var pokeDust : Dictionary<Int,Level> = [
        200 : Level(A: 1 ,mA: 0.0940000 ,mB: 0.1663979),
        400 : Level(A: 3 ,mA: 0.2157325 ,mB: 0.2557201),
        600 : Level(A: 5 ,mA: 0.2902499 ,mB: 0.3210876),
        800 : Level(A: 7 ,mA: 0.3492127 ,mB: 0.3752356),
        1000 : Level(A: 9 ,mA: 0.3995673 ,mB: 0.4225000),
        1300 : Level(A: 11 ,mA: 0.4431076 ,mB: 0.4627984),
        1600 : Level(A: 13 ,mA: 0.4816850 ,mB: 0.4998584),
        1900 : Level(A: 15 ,mA: 0.5173940 ,mB: 0.5343543),
        2200 : Level(A: 17 ,mA: 0.5507927 ,mB: 0.5667545),
        2500 : Level(A: 19 ,mA: 0.5822789 ,mB: 0.5974000),
        3000 : Level(A: 21 ,mA: 0.6121573 ,mB: 0.6265671),
        3500 : Level(A: 23 ,mA: 0.6406530 ,mB: 0.6544356),
        4000 : Level(A: 25 ,mA: 0.6679340 ,mB: 0.6811649),
        4500 : Level(A: 27 ,mA: 0.6941437 ,mB: 0.7068842),
        5000 : Level(A: 29 ,mA: 0.7193991 ,mB: 0.7317000),
        6000 : Level(A: 31 ,mA: 0.7377695 ,mB: 0.7437894),
        7000 : Level(A: 33 ,mA: 0.7497610 ,mB: 0.7556855),
        8000 : Level(A: 35 ,mA: 0.7615638 ,mB: 0.7673972),
        9000 : Level(A: 37 ,mA: 0.7731865 ,mB: 0.7789328),
        10000 : Level(A: 39 ,mA: 0.7846370 ,mB: 0.7903000),
    ]
    
    
    func findIv (_ name : String,cp : Int,hp : Int,starDust : Int) -> Int {
        if pokeDust[starDust] == nil { return 1 } // IncorrectStarDust

        worst = pokeStat[name]!
        var yourBestIvCount = -1
        var yourWorstIvCount = 46
        var considerIvCountSum = 0
        var count = 0
        for i in 1...2 {
            var mul = Double(pokeDust[starDust]!.multiplierA)
            if (i == 2) { mul = Double(pokeDust[starDust]!.multiplierB) }
            let staIv =  Int(ceil((Double(hp) / mul) - Double(worst.sta)))
            for atkIv in 0...15 {
                for defIv in 0...15 {
                    let a = Double(worst.atk + atkIv) * sqrt(Double(worst.def + defIv))
                    let computedCP =  a * sqrt(Double(worst.sta + staIv)) * mul * mul / 10
                    if cp == Int(computedCP) {
                        count += 1
                        let considerIvCount = atkIv + defIv + staIv
                        considerIvCountSum += considerIvCount
                        if considerIvCount >= yourBestIvCount {
                            yourBestIvCount = considerIvCount
                            yourBest = Stat(atk: worst.atk + atkIv, def: worst.def + defIv, sta: worst.sta + staIv)
                        } else if considerIvCount <= yourWorstIvCount {
                            yourWorstIvCount = considerIvCount
                            yourWorst = Stat(atk: worst.atk + atkIv, def: worst.def + defIv, sta: worst.sta + staIv)
                        }
                    }
                }
            }
        }
        if count == 0 { return 2 } // Incorrect CP or HP
        else if count == 1 {
            if yourBestIvCount == -1 {
                max = (Double(yourWorstIvCount) / 45) * 100.0
                min = (Double(yourWorstIvCount) / 45) * 100.0
            } else {
                max = (Double(yourBestIvCount) / 45) * 100.0
                min = (Double(yourBestIvCount) / 45) * 100.0
            }
        } else {
            max = (Double(yourBestIvCount) / 45) * 100.0
            min = (Double(yourWorstIvCount) / 45) * 100.0
        }
        combinationCount = count
        best = Stat(atk: worst.atk+15, def: worst.def+15, sta: worst.sta+15)
        mean = ((Double(considerIvCountSum) / Double(count)) / 45) * 100.0

        return 0
    }

}
