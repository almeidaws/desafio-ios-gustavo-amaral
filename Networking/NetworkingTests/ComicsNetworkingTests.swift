//
//  ComicsNetworkingTests.swift
//  NetworkingTests
//
//  Created by Gustavo Amaral on 10/04/20.
//  Copyright © 2020 Gustavo Almeida Amaral. All rights reserved.
//

import XCTest
import Combine
@testable import Networking

class ComicsNetworkingTests: XCTestCase {

    func testGetComicsWithValidResponse() throws {
        let data = validResponse1.data(using: .utf8)!
        let responseExpection = expectation(description: "Wait for valid comics response.")
        let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!
        _ = getComics(byCharacter: "123", limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { completio_ in }) { comics in
                let validComics = try! JSONDecoder().decode(CommonBody<ComicBody>.self, from: validResponse1.data(using: .utf8)!).data.results
                XCTAssert(comics == validComics, "Input sent to the function isn't equal to the expected decoded value.")
                responseExpection.fulfill()
        }
        
        self.wait(for: [responseExpection], timeout: 1)
    }
    
    func testGetComicsDifferentValidResponse() throws {
        let data = validResponse1.data(using: .utf8)!
        let responseExpection = expectation(description: "Wait for valid comics response.")
        let testsBundle = Bundle(identifier: "com.almeidaws.NetworkingTests")!
        _ = getComics(byCharacter: "123", limit: 1, offset: 1, bundle: testsBundle, mock: .nonEmpty(data, .ok))
            .sink(receiveCompletion: { completio_ in }) { comics in
                let validComics = try! JSONDecoder().decode(CommonBody<ComicBody>.self, from: validResponse2.data(using: .utf8)!).data.results
                XCTAssert(comics != validComics, "Input sent to the function isn't equal to the expected decoded value.")
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
  "etag": "58c718858c556b817932f359c4c320d14efb4c70",
  "data": {
    "offset": 0,
    "limit": 20,
    "total": 3,
    "count": 3,
    "results": [
      {
        "id": 40632,
        "digitalId": 26673,
        "title": "Hulk (2008) #53",
        "issueNumber": 53,
        "variantDescription": "",
        "description": "The Mayan Gods are here! Guest starring Alpha Flight, Machine Man, She-Hulks, A-Bomb!",
        "modified": "2012-06-12T15:18:39-0400",
        "isbn": "",
        "upc": "5960605992-05311",
        "diamondCode": "APR120637",
        "ean": "",
        "issn": "1941-2142",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_preview_text",
            "language": "en-us",
            "text": "The Mayan Gods are here! Guest starring Alpha Flight, Machine Man, She-Hulks, A-Bomb!"
          },
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "<ul><li> MAYAN GODS!!!</li><li> END OF THE WORLD AS WE KNOW IT!!!</li><li> Guest starring Alpha Flight, Machine Man, She-Hulks, A-Bomb!!!</li><ul>"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/40632",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/40632/hulk_2008_53?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Hulk-53/digital-comic/26673?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=26673&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/26673?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/3374",
          "name": "Hulk (2008 - 2012)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2012-06-06T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "2012-05-23T00:00:00-0400"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-04-08T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2012-06-06T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 2.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/2/00/5ba3bfcc55f5a",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/2/00/5ba3bfcc55f5a",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/b0/4fda53e6d27e6",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/4/00/4f61149e5657d",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4f61149e60cc2",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/90/4f61149ca2982",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/b0/4f61148f0cef8",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/20/4f61148f0de13",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/a0/4f61148f19c6b",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/70/4f61148f162a8",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/a0/4f61148ed3870",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/b0/4f61148ea56ef",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40632/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11482",
              "name": "Jesus Aburtov",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/10172",
              "name": "Vc Clayton Cowles",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3646",
              "name": "Dale Eaglesham",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4600",
              "name": "Mark Paniccia",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/824",
              "name": "Jeff Parker",
              "role": "writer"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 12,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40632/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1017100",
              "name": "A-Bomb (HAS)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010370",
              "name": "Alpha Flight"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009163",
              "name": "Aurora"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009330",
              "name": "Guardian"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010805",
              "name": "Machine Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009513",
              "name": "Puck"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011360",
              "name": "Red Hulk"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009560",
              "name": "Sasquatch (Walter Langkowski)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009583",
              "name": "She-Hulk (Jennifer Walters)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011392",
              "name": "She-Hulk (Lyra)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009606",
              "name": "Snowbird"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011003",
              "name": "Thaddeus Ross"
            }
          ],
          "returned": 12
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40632/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92086",
              "name": "Hulk (2008) #53",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92087",
              "name": "Interior #92087",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40632/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 40630,
        "digitalId": 26830,
        "title": "Hulk (2008) #54",
        "issueNumber": 54,
        "variantDescription": "",
        "description": "Mayan Gods! End of the world as we know it! Guest starring Alpha Flight, Machine Man, She-Hulks, A-Bomb!",
        "modified": "2012-06-11T17:31:00-0400",
        "isbn": "",
        "upc": "5960605992-05411",
        "diamondCode": "APR120638",
        "ean": "",
        "issn": "1941-2142",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_preview_text",
            "language": "en-us",
            "text": "Mayan Gods! End of the world as we know it! Guest starring Alpha Flight, Machine Man, She-Hulks, A-Bomb!"
          },
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "<ul><li> MAYAN GODS!!!</li><li> END OF THE WORLD AS WE KNOW IT!!!</li><li> Guest starring Alpha Flight, Machine Man, She-Hulks, A-Bomb!!!</li><ul>"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/40630",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/40630/hulk_2008_54?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Hulk-54/digital-comic/26830?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=26830&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/26830?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/3374",
          "name": "Hulk (2008 - 2012)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2012-06-20T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "2012-06-06T00:00:00-0400"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-04-08T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2012-06-20T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 2.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/00/5ba3c7cd5f1e2",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/00/5ba3c7cd5f1e2",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/d0/4fda542847591",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/a/00/4fc8d95ac1955",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/60/4fc8d95b0262b",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/7/10/4fc8d95a95541",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/04/4fc8d95a9bf6c",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/80/4fc8d95abb4a6",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 6,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40630/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11482",
              "name": "Jesus Aburtov",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/832",
              "name": "Val Staples",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/10172",
              "name": "Vc Clayton Cowles",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3646",
              "name": "Dale Eaglesham",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4600",
              "name": "Mark Paniccia",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/824",
              "name": "Jeff Parker",
              "role": "Writer"
            }
          ],
          "returned": 6
        },
        "characters": {
          "available": 11,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40630/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1017100",
              "name": "A-Bomb (HAS)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010370",
              "name": "Alpha Flight"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009163",
              "name": "Aurora"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009330",
              "name": "Guardian"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010805",
              "name": "Machine Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009513",
              "name": "Puck"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011360",
              "name": "Red Hulk"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009560",
              "name": "Sasquatch (Walter Langkowski)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009583",
              "name": "She-Hulk (Jennifer Walters)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011392",
              "name": "She-Hulk (Lyra)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009606",
              "name": "Snowbird"
            }
          ],
          "returned": 11
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40630/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92082",
              "name": "Hulk (2008) #54",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/92083",
              "name": "Interior #92083",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40630/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 40628,
        "digitalId": 27099,
        "title": "Hulk (2008) #55",
        "issueNumber": 55,
        "variantDescription": "",
        "description": "The hands of the doomsday clock race towards MAYAN RULE! Former Avengers arrive to help stop the end of the world as more Mayan gods return. Rick \"A-Bomb\" Jones falls in battle!",
        "modified": "2012-06-19T11:48:47-0400",
        "isbn": "",
        "upc": "5960605992-05511",
        "diamondCode": "MAY120687",
        "ean": "",
        "issn": "1941-2142",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "<ul><li> The hands of the doomsday clock race towards MAYAN RULE!!!\n</li><li> Former Avengers arrive to help stop the end of the world as more Mayan gods return.\n</li><li> Rick &quot;A-Bomb&quot; Jones falls in battle!</li></ul>"
          },
          {
            "type": "issue_preview_text",
            "language": "en-us",
            "text": "The hands of the doomsday clock race towards MAYAN RULE! Former Avengers arrive to help stop the end of the world as more Mayan gods return. Rick \"A-Bomb\" Jones falls in battle!"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/40628",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/40628/hulk_2008_55?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Hulk-55/digital-comic/27099?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=27099&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/27099?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/3374",
          "name": "Hulk (2008 - 2012)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2012-07-04T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "2012-06-20T00:00:00-0400"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-04-08T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2012-07-04T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 2.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/60/5ba3d0869c543",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/60/5ba3d0869c543",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/a0/4fda5398edc41",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/b0/4fda539915bf3",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/d0/4fda5398a0685",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40628/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/10172",
              "name": "Vc Clayton Cowles",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3646",
              "name": "Dale Eaglesham",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4600",
              "name": "Mark Paniccia",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/824",
              "name": "Jeff Parker",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/832",
              "name": "Val Staples",
              "role": "colorist"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 9,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40628/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1017100",
              "name": "A-Bomb (HAS)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010370",
              "name": "Alpha Flight"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009220",
              "name": "Captain America"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010854",
              "name": "Living Lightning"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010805",
              "name": "Machine Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011360",
              "name": "Red Hulk"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009583",
              "name": "She-Hulk (Jennifer Walters)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011392",
              "name": "She-Hulk (Lyra)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010864",
              "name": "Silverclaw"
            }
          ],
          "returned": 9
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40628/stories",
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
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/40628/events",
          "items": [],
          "returned": 0
        }
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
  "etag": "39839f180b2e6a7f7a7076ca0b52c10832d72573",
  "data": {
    "offset": 0,
    "limit": 20,
    "total": 29,
    "count": 20,
    "results": [
      {
        "id": 48818,
        "digitalId": 33039,
        "title": "Secret Avengers (2013) #16",
        "issueNumber": 16,
        "variantDescription": "",
        "description": "HOW TO MA.I.M. A MOCKINGBIRD CONCLUSION!\r\n\r\n\r\n\r\n\r\n<ul><li>Maria Hill strikes a deal with...A.I.M.???</li><li>Some are dead. Some are alive. Some are in between. And some quit.</li><li>The Secret Avengers will never be the same.</li></ul>",
        "modified": "2014-02-24T15:38:01-0500",
        "isbn": "",
        "upc": "75960607911701611",
        "diamondCode": "DEC130725",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "HOW TO MA.I.M. A MOCKINGBIRD CONCLUSION!\r\n\r\n\r\n\r\n\r\n<ul><li>Maria Hill strikes a deal with...A.I.M.???</li><li>Some are dead. Some are alive. Some are in between. And some quit.</li><li>The Secret Avengers will never be the same.</li></ul>"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/48818",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/48818/secret_avengers_2013_16?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Secret-Avengers-16/digital-comic/33039?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=33039&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/33039?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/17547",
          "name": "Secret Avengers (2013 - 2014)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2014-02-26T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2014-02-12T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2014-08-25T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-02-26T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/a/a0/579b65f99cde3",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/a/a0/579b65f99cde3",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/50/52866198bda00",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48818/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2697",
              "name": "Butch Guice",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2338",
              "name": "Luke Ross",
              "role": "artist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11434",
              "name": "Nick Spencer",
              "role": "writer"
            }
          ],
          "returned": 3
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48818/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011220",
              "name": "Mockingbird"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009552",
              "name": "S.H.I.E.L.D."
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48818/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/109727",
              "name": "cover from Secret Avengers (2013) #16",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/109728",
              "name": "story from Secret Avengers (2013) #16",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48818/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 48817,
        "digitalId": 33017,
        "title": "Secret Avengers (2013) #15",
        "issueNumber": 15,
        "variantDescription": "",
        "description": "HOW TO MA.I.M. A MOCKINGBIRD, Part Four\r\n\r\n\r\n\r\n\r\n\r\n<ul><li>Secret Avengers X the A.I.M. island = Blood, sweat, punches and broken bones.</li><li>Events that began in #1 move to their conclusion.</li><li>A Secret Avenger dies.</li></ul>",
        "modified": "2014-02-07T15:25:17-0500",
        "isbn": "",
        "upc": "75960607911701511",
        "diamondCode": "DEC130724",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "HOW TO MA.I.M. A MOCKINGBIRD, Part Four\r\n\r\n\r\n\r\n\r\n\r\n<ul><li>Secret Avengers X the A.I.M. island = Blood, sweat, punches and broken bones.</li><li>Events that began in #1 move to their conclusion.</li><li>A Secret Avenger dies.</li></ul>"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/48817",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/48817/secret_avengers_2013_15?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Secret-Avengers-15/digital-comic/33017?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=33017&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/33017?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/17547",
          "name": "Secret Avengers (2013 - 2014)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2014-02-12T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2014-01-20T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2014-08-11T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-02-12T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/70/52fa84fddcc44",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/70/52fa84fddcc44",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/5/b0/52df15bc02462",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/b0/52df15974733b",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/60/52df154fc293c",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/1/40/528661575d4e9",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 7,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48817/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2133",
              "name": "Tom Brevoort",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/10172",
              "name": "Vc Clayton Cowles",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2697",
              "name": "Butch Guice",
              "role": "inker (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/12394",
              "name": "Ales Kot",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11434",
              "name": "Nick Spencer",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2338",
              "name": "Luke Ross",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/10279",
              "name": "Matthew Wilson",
              "role": "colorist (cover)"
            }
          ],
          "returned": 7
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48817/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011220",
              "name": "Mockingbird"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009552",
              "name": "S.H.I.E.L.D."
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48817/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/109725",
              "name": "cover from Secret Avengers (2013) #15",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/109726",
              "name": "story from Secret Avengers (2013) #15",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48817/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 48816,
        "digitalId": 32829,
        "title": "Secret Avengers (2013) #14",
        "issueNumber": 14,
        "variantDescription": "",
        "description": "The traitor at the heart of the group is revealed. Mockingbird faces a crossroads that threatens to tear her apart. Travel to the past. See the future.",
        "modified": "2014-01-09T12:55:23-0500",
        "isbn": "",
        "upc": "75960607911701411",
        "diamondCode": "NOV130652",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "The traitor at the heart of the group is revealed. Mockingbird faces a crossroads that threatens to tear her apart. Travel to the past. See the future."
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/48816",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/48816/secret_avengers_2013_14?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Secret-Avengers-14/digital-comic/32829?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=32829&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/32829?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/17547",
          "name": "Secret Avengers (2013 - 2014)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2014-01-15T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2013-12-29T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2014-07-14T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-01-15T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/40/52cee157a8bfa",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/40/52cee157a8bfa",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/9/50/526164dbd7ec3",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48816/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2697",
              "name": "Butch Guice",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11434",
              "name": "Nick Spencer",
              "role": "writer"
            }
          ],
          "returned": 2
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48816/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011220",
              "name": "Mockingbird"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009552",
              "name": "S.H.I.E.L.D."
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48816/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/109723",
              "name": "cover from Secret Avengers (2013) #14",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/109724",
              "name": "story from Secret Avengers (2013) #14",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/48816/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 46168,
        "digitalId": 28124,
        "title": "Indestructible Hulk (2012) #3",
        "issueNumber": 3,
        "variantDescription": "",
        "description": "Hulk: Agent of S.H.I.E.L.D.! His first official mission: to take down the all-new Quintronic Man! Banner's hold over Maria Hill is revealed! And what and where is Bannertown, U.S.A.?",
        "modified": "2014-07-13T14:02:17-0400",
        "isbn": "",
        "upc": "75960607908700311",
        "diamondCode": "NOV120688",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "<ul><li>HULK&rsquo;S first official mission: take down the ALL-NEW QUINTRONIC MAN!!!</li><li>More on Banner&rsquo;s secret hold over S.H.I.E.L.D. Director Maria Hill!</li><li>What and where is&hellip;BANNERTOWN, U.S.A?</li></ul>"
          },
          {
            "type": "issue_preview_text",
            "language": "en-us",
            "text": "Hulk: Agent of S.H.I.E.L.D.! His first official mission: to take down the all-new Quintronic Man! Banner's hold over Maria Hill is revealed! And what and where is Bannertown, U.S.A.?"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/46168",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/46168/indestructible_hulk_2012_3?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Indestructible-Hulk-3/digital-comic/28124?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=28124&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/28124?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
          "name": "Indestructible Hulk (2012 - 2014)"
        },
        "variants": [
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/47470",
            "name": "Indestructible Hulk (2012) #3 (2nd Printing Variant)"
          },
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/46169",
            "name": "Indestructible Hulk (2012) #3 (Bianchi Variant)"
          }
        ],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2013-01-16T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2013-01-02T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-07-15T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2013-01-16T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/30/5b98052c1ae54",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/30/5b98052c1ae54",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 7,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/46168/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8542",
              "name": "Gerry Alanguilan",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/452",
              "name": "Virtual Calligr",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11579",
              "name": "Sunny Gho",
              "role": "colorist (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11808",
              "name": "Jonathan Moisan",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4600",
              "name": "Mark Paniccia",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/119",
              "name": "Mark Waid",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/758",
              "name": "Leinil Francis Yu",
              "role": "penciler (cover)"
            }
          ],
          "returned": 7
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/46168/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009351",
              "name": "Hulk"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011335",
              "name": "Maria Hill"
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/46168/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/103896",
              "name": "Indestructible Hulk (2012) #3",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/103897",
              "name": "story from Indestructible Hulk (2012) #3",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/46168/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 43944,
        "digitalId": 27961,
        "title": "Iron Man (2012) #1",
        "issueNumber": 1,
        "variantDescription": "",
        "description": "Tony Stark&mdash;Iron Man: Technological visionary, wealthy playboy, unparalleled engineer, and armored Avenger. His greatest invention becomes his greatest mistake. Iron Man must act fast&hellip;and Tony Stark must build faster! The lethal techno virus Extremis is out in the wild and out for grabs to the highest bidder! It&rsquo;s up to Tony Stark to contain it and that means creating a new suit of armor&hellip;NOW!",
        "modified": "2017-09-21T16:12:58-0400",
        "isbn": "",
        "upc": "75960607909400111",
        "diamondCode": "SEP120550",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "Tony Stark&mdash;Iron Man: Technological visionary, wealthy playboy, unparalleled engineer, and armored Avenger. His greatest invention becomes his greatest mistake. Iron Man must act fast&hellip;and Tony Stark must build faster! The lethal techno virus Extremis is out in the wild and out for grabs to the highest bidder! It&rsquo;s up to Tony Stark to contain it and that means creating a new suit of armor&hellip;NOW!"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/43944",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/43944/iron_man_2012_1?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Iron-Man-1/digital-comic/27961?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=27961&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/27961?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/16593",
          "name": "Iron Man (2012 - 2014)"
        },
        "variants": [
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/47357",
            "name": "Iron Man (2012) #1 (2nd Printing)"
          }
        ],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2012-11-07T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2012-10-24T00:00:00-0400"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-05-13T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2012-11-07T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/90/5a79e06439b05",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/90/5a79e06439b05",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 6,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/43944/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/5251",
              "name": "Vc Joe Caramagna",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/12239",
              "name": "Guru Efx",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8901",
              "name": "Kieron Gillen",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/425",
              "name": "Greg Land",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/616",
              "name": "Jay Leisten",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4600",
              "name": "Mark Paniccia",
              "role": "editor"
            }
          ],
          "returned": 6
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/43944/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009494",
              "name": "Pepper Potts"
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/43944/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/99129",
              "name": "Iron Man (2012) #1",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/99130",
              "name": "story from Iron Man (2012) #1",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/43944/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 36737,
        "digitalId": 22522,
        "title": "Marvel Adventures Super Heroes (2010) #16",
        "issueNumber": 16,
        "variantDescription": "",
        "description": "Featuring Captain America! Spider-Man gets the thrill of a lifetime as he meets the living legend of World War II, Captain America! Webs spin and shields fly as Cap and everybody's favorite wall-crawler come face to face with the Gray Gargoyle and the nefarious schemes of AIM! Note: This issue reprints the contents of MARVEL AGE SPIDER-MAN TEAM-UP #2.",
        "modified": "2012-11-14T13:14:31-0500",
        "isbn": "",
        "upc": "5960607126-01611",
        "diamondCode": "",
        "ean": "",
        "issn": "1938-0380",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "Featuring Captain America! Spider-Man gets the thrill of a lifetime as he meets the living legend of World War II, Captain America! Webs spin and shields fly as Cap and everybody's favorite wall-crawler come face to face with the Gray Gargoyle and the nefarious schemes of AIM! Note: This issue reprints the contents of MARVEL AGE SPIDER-MAN TEAM-UP #2."
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/36737",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/36737/marvel_adventures_super_heroes_2010_16?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=22522&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/9718",
          "name": "Marvel Adventures Super Heroes (2010 - 2012)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2011-07-13T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "2011-06-20T00:00:00-0400"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-01-02T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 2.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/4/60/4d9f178936e34",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/4/60/4d9f178936e34",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36737/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/682",
              "name": "Todd Dezago",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/873",
              "name": "Lou Kang",
              "role": "penciller"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/9471",
              "name": "Stephen Wacker",
              "role": "editor"
            }
          ],
          "returned": 3
        },
        "characters": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36737/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009220",
              "name": "Captain America"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011420",
              "name": "Grey Gargoyle"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009610",
              "name": "Spider-Man"
            }
          ],
          "returned": 4
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36737/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/81474",
              "name": "Cover #81474",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/81475",
              "name": "Interior #81475",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36737/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 36763,
        "digitalId": 18813,
        "title": "Ant-Man & the Wasp (2010) #3",
        "issueNumber": 3,
        "variantDescription": "",
        "description": "The first team up of Marvel's most unlikely duo may be their last! While his body lay dying, it's up to Ant-Man to save Bill Foster from a burning heaven! And The Wasp is on his own against Monica Rappacini, her elite AIM troops, and the half-sleepwalker villainess ANESTHESIA!  See how the smallest Avengers get out of their over-sized jam in the conclusion to this miniseries by writer/artist Tim Seeley (Hack/Slash)!",
        "modified": "2011-01-03T13:19:55-0500",
        "isbn": "",
        "upc": "5960607434-00311",
        "diamondCode": "NOV100533",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "The first team up of Marvel's most unlikely duo may be their last! While his body lay dying, it's up to Ant-Man to save Bill Foster from a burning heaven! And The Wasp is on his own against Monica Rappacini, her elite AIM troops, and the half-sleepwalker villainess ANESTHESIA!  See how the smallest Avengers get out of their over-sized jam in the conclusion to this miniseries by writer/artist Tim Seeley (Hack/Slash)!"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/36763",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/36763/ant-man_the_wasp_2010_3?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Ant-Man-the-Wasp-3/digital-comic/18813?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=18813&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/18813?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/13082",
          "name": "Ant-Man & the Wasp (2010 - 2011)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2011-01-05T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2010-12-12T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2011-12-05T00:00:00-0500"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2011-02-16T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/f0/56ddd896e1ddb",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/f0/56ddd896e1ddb",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36763/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13251",
              "name": "Salva Espin",
              "role": "penciller"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/9550",
              "name": "Tim Seeley",
              "role": "penciller"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8822",
              "name": "Jordan White",
              "role": "editor"
            }
          ],
          "returned": 3
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36763/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010802",
              "name": "Ant-Man (Eric O'Grady)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011490",
              "name": "Hank Pym"
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36763/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/81526",
              "name": "Ant-Man & the Wasp (2010) #3 cover",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/81527",
              "name": "Ant-Man & the Wasp (2010) #3 interior",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/36763/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 31068,
        "digitalId": 0,
        "title": "Incredible Hulks (2010) #606 (VARIANT)",
        "issueNumber": 606,
        "variantDescription": "VARIANT",
        "description": "He's fought Thor, Black Bolt, the Juggernaut, and virtually every Avenger on the planet.  But nothing's ever hit Bruce Banner as hard as \"The Fall of the Hulks\"!  As the epic storyline begins, Bruce Banner makes the best and worst discovery of his life, Skaar, the savage Son of Hulk, finally shows his true colors, and a Green Goliath in purple pants takes on Doctor Doom himself!  \"Planet Hulk\" writer Greg Pak teams up with fan favorite penciler Paul Pelletier to deliver massive revelations, shocking emotional twists, and epic smashing that will transform Bruce Banner's life forever. Rated A $3.99",
        "modified": "2011-09-20T15:45:51-0400",
        "isbn": "",
        "upc": "5960606637-60621",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 40,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "He's fought Thor, Black Bolt, the Juggernaut, and virtually every Avenger on the planet.  But nothing's ever hit Bruce Banner as hard as \"The Fall of the Hulks\"!  As the epic storyline begins, Bruce Banner makes the best and worst discovery of his life, Skaar, the savage Son of Hulk, finally shows his true colors, and a Green Goliath in purple pants takes on Doctor Doom himself!  \"Planet Hulk\" writer Greg Pak teams up with fan favorite penciler Paul Pelletier to deliver massive revelations, shocking emotional twists, and epic smashing that will transform Bruce Banner's life forever. Rated A $3.99"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/31068",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/31068/incredible_hulks_2010_606_variant/variant?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/8842",
          "name": "Incredible Hulks (2010 - 2011)"
        },
        "variants": [
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/30428",
            "name": "Incredible Hulks (2010) #606 (2ND PRINTING VARIANT)"
          },
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/27651",
            "name": "Incredible Hulks (2010) #606"
          }
        ],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2010-01-20T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "2009-12-28T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 3.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/d0/4e78ed9a17072",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/d0/4e78ed9a17072",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 9,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/31068/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4992",
              "name": "Simon Bowland",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8504",
              "name": "Frank D'ARMATA",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/570",
              "name": "Klaus Janson",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13196",
              "name": "John Romita Jr.",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/11553",
              "name": "Danny K. Miki",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/536",
              "name": "Greg Pak",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4600",
              "name": "Mark Paniccia",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8822",
              "name": "Jordan White",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/559",
              "name": "Paul Pelletier",
              "role": "penciller"
            }
          ],
          "returned": 9
        },
        "characters": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/31068/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009165",
              "name": "Avengers"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009299",
              "name": "Fantastic Four"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009351",
              "name": "Hulk"
            }
          ],
          "returned": 4
        },
        "stories": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/31068/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/60572",
              "name": "Interior #60572",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/70910",
              "name": "Interior #70910",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/73476",
              "name": "",
              "type": ""
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/94788",
              "name": "Incredible Hulks (2009) #606, VARIANT",
              "type": "cover"
            }
          ],
          "returned": 4
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/31068/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 4214,
        "digitalId": 1488,
        "title": "Avengers and Power Pack Assemble! (2006) #2",
        "issueNumber": 2,
        "variantDescription": "",
        "description": "When one of billionaire Tony Stark's greatest inventions is stolen, it's up to the invincible Iron Man to track it down... unless, of course, Power Pack beats him to the punch! But is Jack Power really looking to save the day or is he just hoping for a hefty reward? \r<br>32 PGS./All Ages ...$2.99\r<br>",
        "modified": "2018-02-19T18:09:26-0500",
        "isbn": "",
        "upc": "75960605887700211",
        "diamondCode": "MAR062073",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 32,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "When one of billionaire Tony Stark's greatest inventions is stolen, it's up to the invincible Iron Man to track it down... unless, of course, Power Pack beats him to the punch! But is Jack Power really looking to save the day or is he just hoping for a hefty reward? \r<br>32 PGS./All Ages ...$2.99\r<br>"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/4214",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/4214/avengers_and_power_pack_assemble_2006_2?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=1488&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1046",
          "name": "Avengers and Power Pack Assemble! (2006)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2006-05-24T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2006-11-13T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/e0/5c3609412f240",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/e0/5c3609412f240",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/4214/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4421",
              "name": "MacKenzie Cadenhead",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13511",
              "name": "Nate Cosby",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/322",
              "name": "G Gurihiru",
              "role": "penciller (cover)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8429",
              "name": "Dave Sharpe",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/718",
              "name": "Marc Sumerak",
              "role": "writer"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/4214/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009165",
              "name": "Avengers"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010770",
              "name": "Power Pack"
            }
          ],
          "returned": 4
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/4214/stories",
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
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/4214/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 17553,
        "digitalId": 5218,
        "title": "Avengers (1998) #67",
        "issueNumber": 67,
        "variantDescription": "",
        "description": "The Avengers discover part of the Red Zone's horrible secret, but their own government bars the way to the rest! Meanwhile, a new horror strikes the She-Hulk - at the hands of one of the Avengers' own!",
        "modified": "2016-03-14T16:48:13-0400",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "The Avengers discover part of the Red Zone's horrible secret, but their own government bars the way to the rest! Meanwhile, a new horror strikes the She-Hulk - at the hands of one of the Avengers' own!"
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/17553",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/17553/avengers_1998_67?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Avengers-67/digital-comic/5218?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=5218&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/5218?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/354",
          "name": "Avengers (1998 - 2004)"
        },
        "variants": [],
        "collections": [
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/1214",
            "name": "Avengers Vol. II: Red Zone (Trade Paperback)"
          },
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/1170",
            "name": "Avengers Vol. 2: Red Zone (Trade Paperback)"
          }
        ],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2003-07-02T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "1961-01-01T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2010-02-23T00:00:00-0500"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2010-04-13T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/b0/586bd36edf4cb",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/b0/586bd36edf4cb",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 9,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/17553/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/807",
              "name": "Comicraft",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3603",
              "name": "Albert Deschesne",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/350",
              "name": "Richard Starkings",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2133",
              "name": "Tom Brevoort",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/6170",
              "name": "Olivier Coipel",
              "role": "penciller"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/181",
              "name": "Geoff Johns",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/5752",
              "name": "J. G. Jones",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/485",
              "name": "Andy Lanning",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/500",
              "name": "Christopher Sotomayor",
              "role": "colorist"
            }
          ],
          "returned": 9
        },
        "characters": {
          "available": 7,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/17553/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009165",
              "name": "Avengers"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009187",
              "name": "Black Panther"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009562",
              "name": "Scarlet Witch"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009583",
              "name": "She-Hulk (Jennifer Walters)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009697",
              "name": "Vision"
            }
          ],
          "returned": 7
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/17553/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/37479",
              "name": "Avengers (1998) #67",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/37480",
              "name": "Red Zone: Part Three - Unclassified",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/17553/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 14225,
        "digitalId": 518,
        "title": "Wolverine (2003) #1",
        "issueNumber": 1,
        "variantDescription": "",
        "description": "The mysterious death of an innocent woman leaves behind many questions. Questions that Logan intends to answer, one way or the other.",
        "modified": "2018-04-16T11:26:46-0400",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [
          {
            "type": "issue_preview_text",
            "language": "en-us",
            "text": "The mysterious death of an innocent woman leaves behind many questions. Questions that Logan intends to answer, one way or the other."
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/14225",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/14225/wolverine_2003_1?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Wolverine-1/digital-comic/518?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=518&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/518?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/632",
          "name": "Wolverine (2003 - 2009)"
        },
        "variants": [],
        "collections": [
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/1205",
            "name": "Wolverine Vol. I: The Brothers (Trade Paperback)"
          },
          {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/1090",
            "name": "Wolverine Vol. II (Trade Paperback)"
          }
        ],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2003-07-01T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "1961-01-01T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2007-11-13T00:00:00-0500"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2012-04-25T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/f0/5ae748d0d11cc",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/f0/5ae748d0d11cc",
            "extension": "jpg"
          },
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/50/4bc37dd39a81c",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/14225/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/452",
              "name": "Virtual Calligr",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/12581",
              "name": "Vc Chris Eliopoulos",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4258",
              "name": "Studio F",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/49",
              "name": "Darick Robertson",
              "role": "artist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/28",
              "name": "Greg Rucka",
              "role": "writer"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/14225/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009718",
              "name": "Wolverine"
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/14225/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28969",
              "name": "WOLVERINE (2003) #1",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28970",
              "name": "[Credits and Recap]",
              "type": "credits"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28971",
              "name": "[The Brothers Part I]",
              "type": "interiorStory"
            }
          ],
          "returned": 3
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/14225/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 12787,
        "digitalId": 16166,
        "title": "Captain America (1998) #28",
        "issueNumber": 28,
        "variantDescription": "",
        "description": null,
        "modified": "2018-06-14T09:05:58-0400",
        "isbn": "",
        "upc": "75960604455902811",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/12787",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/12787/captain_america_1998_28?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Captain-America-28/digital-comic/16166?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=16166&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/16166?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1997",
          "name": "Captain America (1998 - 2002)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "2000-04-01T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2011-09-27T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-01-21T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/03/4e8b265983613",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/f/03/4e8b265983613",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 6,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/12787/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1326",
              "name": "Dan Green",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1176",
              "name": "Joe Kubert",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/155",
              "name": "Dan Jurgens",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/7843",
              "name": "Todd Klein",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/175",
              "name": "Andy Kubert",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/5237",
              "name": "Gregory Wright",
              "role": "colorist"
            }
          ],
          "returned": 6
        },
        "characters": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/12787/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009220",
              "name": "Captain America"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009471",
              "name": "Nick Fury"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009228",
              "name": "Sharon Carter"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009664",
              "name": "Thor"
            }
          ],
          "returned": 5
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/12787/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/95096",
              "name": "Captain America (1998) #28",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/95097",
              "name": "Captain America (1998) #28",
              "type": "interiorStory"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/12787/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 13893,
        "digitalId": 30347,
        "title": "Uncanny X-Men (1963) #352",
        "issueNumber": 352,
        "variantDescription": "",
        "description": null,
        "modified": "-0001-11-30T00:00:00-0500",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 38,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/13893",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/13893/uncanny_x-men_1963_352?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Uncanny-X-Men-352/digital-comic/30347?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=30347&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/30347?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/2258",
          "name": "Uncanny X-Men (1963 - 2011)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1998-02-01T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-07-01T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-03-04T00:00:00-0500"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/e0/51acb8eb1880a",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/e0/51acb8eb1880a",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 13,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/13893/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/8320",
              "name": "Darryl Banks",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/277",
              "name": "Terry Dodson",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/717",
              "name": "Cully Hamner",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13543",
              "name": "J.H. Williams III",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/162",
              "name": "John Cassaday",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/592",
              "name": "Rachel Dodson",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/236",
              "name": "Tommy Lee Edwards",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1012",
              "name": "Mick Gray",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/235",
              "name": "Jon Holdredge",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1382",
              "name": "Gary Martin",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/4205",
              "name": "Steve Oliff",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3998",
              "name": "Steve Seagle",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/350",
              "name": "Richard Starkings",
              "role": "letterer"
            }
          ],
          "returned": 13
        },
        "characters": {
          "available": 10,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/13893/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009159",
              "name": "Archangel"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009175",
              "name": "Beast"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009219",
              "name": "Cannonball"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009257",
              "name": "Cyclops"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009380",
              "name": "Joseph"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009414",
              "name": "Maggott"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009425",
              "name": "Marrow"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009718",
              "name": "Wolverine"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009726",
              "name": "X-Men"
            }
          ],
          "returned": 10
        },
        "stories": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/13893/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28231",
              "name": "Turbulence!",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28232",
              "name": "Meet The Uncanny X-Men",
              "type": "recap"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/28233",
              "name": "In Sin Airy X",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/201088",
              "name": "story from Uncanny X-Men (1981) #352",
              "type": "interiorStory"
            }
          ],
          "returned": 4
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/13893/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 9546,
        "digitalId": 17116,
        "title": "Iron Man (1968) #297",
        "issueNumber": 297,
        "variantDescription": "",
        "description": null,
        "modified": "2019-11-27T09:23:19-0500",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/9546",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/9546/iron_man_1968_297?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Iron-Man-297/digital-comic/17116?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=17116&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/17116?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/2029",
          "name": "Iron Man (1968 - 1996)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1993-10-01T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-03-18T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-07-01T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/7/60/5a749ffe41669",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/7/60/5a749ffe41669",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9546/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13261",
              "name": "Phil Felix",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3047",
              "name": "Kevin Hopgood",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/6901",
              "name": "Len Kaminski",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2298",
              "name": "Ariane Lenshoek",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2230",
              "name": "Steve Mitchell",
              "role": "inker"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 6,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9546/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009348",
              "name": "Happy Hogan"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011004",
              "name": "M.O.D.A.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009482",
              "name": "Omega Red"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009494",
              "name": "Pepper Potts"
            }
          ],
          "returned": 6
        },
        "stories": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9546/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/19568",
              "name": "",
              "type": ""
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/66630",
              "name": "Iron Man (1968) #297",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/196386",
              "name": "story from Iron Man (1968) #297",
              "type": "interiorStory"
            }
          ],
          "returned": 3
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9546/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 9545,
        "digitalId": 17115,
        "title": "Iron Man (1968) #296",
        "issueNumber": 296,
        "variantDescription": "",
        "description": null,
        "modified": "2019-11-27T09:23:19-0500",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/9545",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/9545/iron_man_1968_296?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Iron-Man-296/digital-comic/17115?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=17115&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/17115?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/2029",
          "name": "Iron Man (1968 - 1996)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1993-09-01T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-03-18T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-07-01T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/1/40/5a749778d8331",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/1/40/5a749778d8331",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9545/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13261",
              "name": "Phil Felix",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3047",
              "name": "Kevin Hopgood",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/6901",
              "name": "Len Kaminski",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2298",
              "name": "Ariane Lenshoek",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2230",
              "name": "Steve Mitchell",
              "role": "inker"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9545/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011004",
              "name": "M.O.D.A.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009482",
              "name": "Omega Red"
            }
          ],
          "returned": 4
        },
        "stories": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9545/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/19567",
              "name": "",
              "type": ""
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/66629",
              "name": "Iron Man (1968) #296",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/196385",
              "name": "story from Iron Man (1968) #296",
              "type": "interiorStory"
            }
          ],
          "returned": 3
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9545/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 9544,
        "digitalId": 17095,
        "title": "Iron Man (1968) #295",
        "issueNumber": 295,
        "variantDescription": "",
        "description": null,
        "modified": "2019-11-27T09:23:19-0500",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/9544",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/9544/iron_man_1968_295?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Iron-Man-295/digital-comic/17095?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=17095&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/17095?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/2029",
          "name": "Iron Man (1968 - 1996)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1993-08-01T00:00:00-0400"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2013-03-18T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-07-01T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/e0/5a748b6736e52",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/e0/5a748b6736e52",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 5,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9544/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13261",
              "name": "Phil Felix",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3047",
              "name": "Kevin Hopgood",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/6901",
              "name": "Len Kaminski",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2298",
              "name": "Ariane Lenshoek",
              "role": "colorist"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2230",
              "name": "Steve Mitchell",
              "role": "inker"
            }
          ],
          "returned": 5
        },
        "characters": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9544/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009482",
              "name": "Omega Red"
            }
          ],
          "returned": 3
        },
        "stories": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9544/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/19566",
              "name": "",
              "type": ""
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/66628",
              "name": "Iron Man (1968) #295",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/196384",
              "name": "story from Iron Man (1968) #295",
              "type": "interiorStory"
            }
          ],
          "returned": 3
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/9544/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 20367,
        "digitalId": 48507,
        "title": "Defenders (1972) #57",
        "issueNumber": 57,
        "variantDescription": "",
        "description": "Ms. Marvel seeks the help of the Defenders when she has a vision that shows all of them are in trouble.",
        "modified": "2018-05-03T14:01:08-0400",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 0,
        "textObjects": [
          {
            "type": "issue_solicit_text",
            "language": "en-us",
            "text": "Ms. Marvel seeks the help of the Defenders when she has a vision that shows all of them are in trouble."
          }
        ],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/20367",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/20367/defenders_1972_57?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=48507&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/3743",
          "name": "Defenders (1972 - 1986)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1978-03-01T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2018-05-07T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/60/5aeb57b655334",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/60/5aeb57b655334",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 11,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/20367/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/44",
              "name": "Chris Claremont",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/954",
              "name": "Gerry Conway",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/46",
              "name": "Dave Cockrum",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/965",
              "name": "Ed Hannigan",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1183",
              "name": "George Tuska",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1178",
              "name": "Archie Goodwin",
              "role": "editor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1326",
              "name": "Dan Green",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/3163",
              "name": "Peter Iro",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1754",
              "name": "Gaspar Saladino",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/5205",
              "name": "Irving Watanabe",
              "role": "letterer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1811",
              "name": "Francoise Mouly",
              "role": "colorist"
            }
          ],
          "returned": 11
        },
        "characters": {
          "available": 6,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/20367/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010338",
              "name": "Captain Marvel (Carol Danvers)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011023",
              "name": "Defenders"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010351",
              "name": "Hellcat (Patsy Walker)"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009351",
              "name": "Hulk"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010349",
              "name": "Nighthawk"
            }
          ],
          "returned": 6
        },
        "stories": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/20367/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/43641",
              "name": "For the Life of the Hulk!",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/43642",
              "name": "And Along Came...Ms. Marvel!",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/148621",
              "name": "cover from Defenders (1972) #57",
              "type": "cover"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/148622",
              "name": "story from Defenders (1972) #57",
              "type": "interiorStory"
            }
          ],
          "returned": 4
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/20367/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 7340,
        "digitalId": 19362,
        "title": "Avengers (1963) #87",
        "issueNumber": 87,
        "variantDescription": "",
        "description": null,
        "modified": "2017-10-27T11:55:51-0400",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 36,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/7340",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/7340/avengers_1963_87?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Avengers-87/digital-comic/19362?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=19362&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/19362?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1991",
          "name": "Avengers (1963 - 1996)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1971-04-01T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2011-05-24T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-09-02T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/4/a0/586fe6e372758",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/4/a0/586fe6e372758",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7340/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/105",
              "name": "Sal Buscema",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/2909",
              "name": "Roy Thomas",
              "role": "writer"
            }
          ],
          "returned": 2
        },
        "characters": {
          "available": 11,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7340/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009165",
              "name": "Avengers"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009187",
              "name": "Black Panther"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011072",
              "name": "Edwin Jarvis"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009338",
              "name": "Hawkeye"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009368",
              "name": "Iron Man"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009390",
              "name": "Klaw"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009524",
              "name": "Quicksilver"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009562",
              "name": "Scarlet Witch"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009664",
              "name": "Thor"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009697",
              "name": "Vision"
            }
          ],
          "returned": 11
        },
        "stories": {
          "available": 2,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7340/stories",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/15243",
              "name": "Look Homeward, Avenger",
              "type": "interiorStory"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/95211",
              "name": "AVENGERS (1963) #87",
              "type": "cover"
            }
          ],
          "returned": 2
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7340/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 7514,
        "digitalId": 20527,
        "title": "Captain America (1968) #133",
        "issueNumber": 133,
        "variantDescription": "",
        "description": null,
        "modified": "2017-08-16T15:39:46-0400",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 36,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/7514",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/7514/captain_america_1968_133?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Captain-America-133/digital-comic/20527?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=20527&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/20527?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1996",
          "name": "Captain America (1968 - 1996)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1971-01-01T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2011-06-16T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-03-25T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/f0/5995ed3b1791b",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/f0/5995ed3b1791b",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7514/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/263",
              "name": "Dick Ayers",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/270",
              "name": "Gene Colan",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/30",
              "name": "Stan Lee",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/1553",
              "name": "Sam Rosen",
              "role": "letterer"
            }
          ],
          "returned": 4
        },
        "characters": {
          "available": 6,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7514/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010887",
              "name": "Bulldozer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009220",
              "name": "Captain America"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010726",
              "name": "M.O.D.O.K."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011390",
              "name": "Redwing"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009624",
              "name": "Tony Stark"
            }
          ],
          "returned": 6
        },
        "stories": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7514/stories",
          "items": [
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
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/187577",
              "name": "story from Captain America (1968) #133",
              "type": "interiorStory"
            }
          ],
          "returned": 3
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7514/events",
          "items": [],
          "returned": 0
        }
      },
      {
        "id": 7513,
        "digitalId": 20526,
        "title": "Captain America (1968) #132",
        "issueNumber": 132,
        "variantDescription": "",
        "description": null,
        "modified": "2013-08-09T17:36:46-0400",
        "isbn": "",
        "upc": "",
        "diamondCode": "",
        "ean": "",
        "issn": "",
        "format": "Comic",
        "pageCount": 36,
        "textObjects": [],
        "resourceURI": "http://gateway.marvel.com/v1/public/comics/7513",
        "urls": [
          {
            "type": "detail",
            "url": "http://marvel.com/comics/issue/7513/captain_america_1968_132?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "purchase",
            "url": "http://comicstore.marvel.com/Captain-America-132/digital-comic/20526?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "reader",
            "url": "http://marvel.com/digitalcomics/view.htm?iid=20526&utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          },
          {
            "type": "inAppLink",
            "url": "https://applink.marvel.com/issue/20526?utm_campaign=apiRef&utm_source=fa97b9ecd8f450201924f139866ffea3"
          }
        ],
        "series": {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1996",
          "name": "Captain America (1968 - 1996)"
        },
        "variants": [],
        "collections": [],
        "collectedIssues": [],
        "dates": [
          {
            "type": "onsaleDate",
            "date": "1970-12-01T00:00:00-0500"
          },
          {
            "type": "focDate",
            "date": "-0001-11-30T00:00:00-0500"
          },
          {
            "type": "unlimitedDate",
            "date": "2011-06-08T00:00:00-0400"
          },
          {
            "type": "digitalPurchaseDate",
            "date": "2014-03-25T00:00:00-0400"
          }
        ],
        "prices": [
          {
            "type": "printPrice",
            "price": 0
          },
          {
            "type": "digitalPurchasePrice",
            "price": 1.99
          }
        ],
        "thumbnail": {
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/a/c0/5995eb4df39f8",
          "extension": "jpg"
        },
        "images": [
          {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/a/c0/5995eb4df39f8",
            "extension": "jpg"
          }
        ],
        "creators": {
          "available": 4,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7513/creators",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/263",
              "name": "Dick Ayers",
              "role": "inker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/270",
              "name": "Gene Colan",
              "role": "penciler"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/30",
              "name": "Stan Lee",
              "role": "writer"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/creators/13093",
              "name": "Art Simek",
              "role": "letterer"
            }
          ],
          "returned": 4
        },
        "characters": {
          "available": 10,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7513/characters",
          "items": [
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009144",
              "name": "A.I.M."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009169",
              "name": "Baron Strucker"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009211",
              "name": "Bucky"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009220",
              "name": "Captain America"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009281",
              "name": "Doctor Doom"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009284",
              "name": "Dum Dum Dugan"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1010726",
              "name": "M.O.D.O.K."
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009471",
              "name": "Nick Fury"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011390",
              "name": "Redwing"
            },
            {
              "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009228",
              "name": "Sharon Carter"
            }
          ],
          "returned": 10
        },
        "stories": {
          "available": 3,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7513/stories",
          "items": [
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
              "resourceURI": "http://gateway.marvel.com/v1/public/stories/187576",
              "name": "story from Captain America (1968) #132",
              "type": "interiorStory"
            }
          ],
          "returned": 3
        },
        "events": {
          "available": 0,
          "collectionURI": "http://gateway.marvel.com/v1/public/comics/7513/events",
          "items": [],
          "returned": 0
        }
      }
    ]
  }
}
"""#
