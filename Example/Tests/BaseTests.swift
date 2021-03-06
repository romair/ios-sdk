/*
* Copyright 2016 smoope GmbH
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import XCTest
import SwiftyJSON
import SmoopeSDK

class BaseTests: XCTestCase {
    
  func getResource(file: String) -> Dictionary<String, AnyObject> {
    let path = NSBundle(forClass: self.dynamicType).pathForResource(file, ofType: "json")
    let jsonData = NSData(contentsOfFile:path!)
    return JSON(data: jsonData!).dictionaryObject!
  }
  
  func testCollection<T>(collection: SPPagedList<T>) {
    XCTAssertNotNil(collection, "Mapped object shouldn't be nil")
    XCTAssert(collection.content.count == 2)
    XCTAssert(collection.size == 2)
    XCTAssert(collection.totalElements == 4)
    XCTAssert(collection.totalPages == 2)
    XCTAssert(collection.links.count == 4)
  }
}
