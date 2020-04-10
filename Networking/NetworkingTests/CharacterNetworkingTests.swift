//
//  CharacterNetworkingTests.swift
//  Networking
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import Combine
@testable import Networking

class CharacterNetworkingTests: XCTestCase {

    func testGetCharactersWithValidResponse() throws {
        let data = validResponse1.data(using: .utf8)!
        let responseExpection = expectation(description: "Wait for valid character response.")
        let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!
        _ = getCharacters(limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { _ in }) { characters in
                let validCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: validResponse1.data(using: .utf8)!).data.results
                
                XCTAssert(validCharacters == characters, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }
    
    func testGetCharactersWithDifferentResponse() throws {
        let data = validResponse1.data(using: .utf8)!
        let responseExpection = expectation(description: "Wait for valid character response.")
        let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!
        _ = getCharacters(limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { _ in }) { characters in
                let validCharacters = try! JSONDecoder().decode(CommonBody<CharacterBody>.self, from: validResponse2.data(using: .utf8)!).data.results
                
                XCTAssert(validCharacters != characters, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }

}

fileprivate let validResponse2 = #"""
{
  "code": 200,
  "status": "Ok",
  "copyright": "© 2020 MARVEL",
  "attributionText": "Data provided by Marvel. © 2020 MARVEL",
  "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
  "etag": "70604da4193a9071ee8c35231ab329cac6a25ac2",
  "data": {
    "offset": 0,
    "limit": 20,
    "total": 1,
    "count": 1,
    "results": [
      {
        "id": 1009144,
        "name": "A.I.M.",
        "description": "AIM is a terrorist organization bent on destroying the world.",
        "modified": "2013-10-17T14:41:30-0400",
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
          "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
        "comics": {
          "available": 49,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/comics",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/36763",
              "name": "Ant-Man & the Wasp (2010) #3"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/17553",
              "name": "Avengers (1998) #67"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/7340",
              "name": "Avengers (1963) #87"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/4214",
              "name": "Avengers and Power Pack Assemble! (2006) #2"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/63217",
              "name": "Avengers and Power Pack (2017) #3"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/63218",
              "name": "Avengers and Power Pack (2017) #4"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/63219",
              "name": "Avengers and Power Pack (2017) #5"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/63220",
              "name": "Avengers and Power Pack (2017) #6"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/64790",
              "name": "Avengers by Brian Michael Bendis: The Complete Collection Vol. 2 (Trade Paperback)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/1170",
              "name": "Avengers Vol. 2: Red Zone (Trade Paperback)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/1214",
              "name": "Avengers Vol. II: Red Zone (Trade Paperback)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/12787",
              "name": "Captain America (1998) #28"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/7513",
              "name": "Captain America (1968) #132"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/7514",
              "name": "Captain America (1968) #133"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/65466",
              "name": "Captain America by Mark Waid, Ron Garney & Andy Kubert (Hardcover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/20367",
              "name": "Defenders (1972) #57"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/31068",
              "name": "Incredible Hulks (2010) #606 (VARIANT)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/46168",
              "name": "Indestructible Hulk (2012) #3"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/43944",
              "name": "Iron Man (2012) #1"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/9544",
              "name": "Iron Man (1968) #295"
            }
          ],
          "returned": 20
        },
        "series": {
          "available": 33,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/series",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/13082",
              "name": "Ant-Man & the Wasp (2010 - 2011)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/354",
              "name": "Avengers (1998 - 2004)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/1991",
              "name": "Avengers (1963 - 1996)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/23123",
              "name": "Avengers and Power Pack (2017)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/1046",
              "name": "Avengers and Power Pack Assemble! (2006)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/23600",
              "name": "Avengers by Brian Michael Bendis: The Complete Collection Vol. 2 (2017)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/227",
              "name": "Avengers Vol. 2: Red Zone (2003)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/271",
              "name": "Avengers Vol. II: Red Zone (2003)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/1996",
              "name": "Captain America (1968 - 1996)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/1997",
              "name": "Captain America (1998 - 2002)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/23810",
              "name": "Captain America by Mark Waid, Ron Garney & Andy Kubert (2017)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/3743",
              "name": "Defenders (1972 - 1986)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/8842",
              "name": "Incredible Hulks (2010 - 2011)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
              "name": "Indestructible Hulk (2012 - 2014)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/16593",
              "name": "Iron Man (2012 - 2014)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/2029",
              "name": "Iron Man (1968 - 1996)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/23915",
              "name": "Iron Man Epic Collection: Doom (2018)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/9718",
              "name": "Marvel Adventures Super Heroes (2010 - 2012)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/1506",
              "name": "Marvel Masterworks: Captain America Vol. (2005)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/189",
              "name": "Marvel Masterworks: Captain America Vol. 1 - 2nd Edition (2003)"
            }
          ],
          "returned": 20
        },
        "stories": {
          "available": 52,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/5800",
              "name": "Avengers and Power Pack Assemble! (2006) #2",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/5801",
              "name": "2 of 4 - 4XLS",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/10253",
              "name": "When the Unliving Strike",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/10255",
              "name": "Cover #10255",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/10256",
              "name": "The Enemy Within!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/10259",
              "name": "Death Before Dishonor!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/10261",
              "name": "Cover #10261",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/10262",
              "name": "The End of A.I.M.!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/11921",
              "name": "The Red Skull Lives!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/11930",
              "name": "He Who Holds the Cosmic Cube",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/11936",
              "name": "The Maddening Mystery of the Inconceivable Adaptoid!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/11981",
              "name": "If This Be... Modok",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/11984",
              "name": "A Time to Die -- A Time to Live!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/11995",
              "name": "At the Mercy of the Maggia",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/15243",
              "name": "Look Homeward, Avenger",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/17518",
              "name": "Captain America (1968) #132",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/17519",
              "name": "The Fearful Secret of Bucky Barnes",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/17520",
              "name": "Captain America (1968) #133",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/17521",
              "name": "Madness In the Slums",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28233",
              "name": "In Sin Airy X",
              "type": "interiorStory"
            }
          ],
          "returned": 20
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/events",
          "items": [],
          "returned": 0
        },
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/characters/1009144/aim.?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "wiki",
            "url": "http://marvel.com/universe/A.I.M.?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "comiclink",
            "url": "http://marvel.com/comics/characters/1009144/aim.?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ]
      }
    ]
  }
}
"""#

fileprivate let validResponse1 = #"""
{
  "code": 200,
  "status": "Ok",
  "copyright": "© 2020 MARVEL",
  "attributionText": "Data provided by Marvel. © 2020 MARVEL",
  "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
  "etag": "2e336f12f2d4592e89b299e5466ec6c70aac3f41",
  "data": {
    "offset": 0,
    "limit": 20,
    "total": 1,
    "count": 1,
    "results": [
      {
        "id": 1017100,
        "name": "A-Bomb (HAS)",
        "description": "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
        "modified": "2013-09-18T15:54:04-0400",
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
          "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1017100",
        "comics": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/comics",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/40632",
              "name": "Hulk (2008) #53"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/40630",
              "name": "Hulk (2008) #54"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/comics/40628",
              "name": "Hulk (2008) #55"
            }
          ],
          "returned": 3
        },
        "series": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/series",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/17765",
              "name": "FREE COMIC BOOK DAY 2013 1 (2013)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/series/3374",
              "name": "Hulk (2008 - 2012)"
            }
          ],
          "returned": 2
        },
        "stories": {
          "available": 7,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92078",
              "name": "Hulk (2008) #55",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92079",
              "name": "Interior #92079",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92082",
              "name": "Hulk (2008) #54",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92083",
              "name": "Interior #92083",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92086",
              "name": "Hulk (2008) #53",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92087",
              "name": "Interior #92087",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/105929",
              "name": "cover from Free Comic Book Day 2013 (Avengers/Hulk) (2013) #1",
              "type": "cover"
            }
          ],
          "returned": 7
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/events",
          "items": [],
          "returned": 0
        },
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "comiclink",
            "url": "http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ]
      }
    ]
  }
}
"""#
