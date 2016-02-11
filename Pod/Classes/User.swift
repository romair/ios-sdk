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

import Foundation

public class User: Identified {
  
  public private(set) var states: [UserState] = []
  
  public required init(data: Dictionary<String, AnyObject>) {
    if let states = data["status"] {
      self.states = (states as! [String]).map({ s in UserState(rawValue: s)!})
    }
    
    super.init(data: data)
  }
  
  public override func unmap() -> Dictionary<String, AnyObject> {
    var result: Dictionary<String, AnyObject> = [: ]
    if !states.isEmpty {
      result["states"] = states.map({ i in i.rawValue })
    }
    
    return result
      .append(super.unmap())
  }
}