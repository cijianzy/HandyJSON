/*
 * Copyright 1999-2101 Alibaba Group.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//  Created by zhouzhuo on 9/20/16.
//

import Foundation

public class Mapper {

    private var mapping = Dictionary<Int, (String?, (String -> ())?)>()

    public func specify<T>(inout property: T, name: String) {
        let key = withUnsafePointer(&property, { return $0 }).hashValue
        self.mapping[key] = (name, nil)
    }

    public func specify<T>(inout property: T, converter: String -> T) {
        let key = withUnsafePointer(&property, { return $0 }).hashValue
        let assign = { (org: String) in
            UnsafeMutablePointer<T>(bitPattern: key).memory = converter(org)
        }
        self.mapping[key] = (nil, assign)
    }

    public func specify<T>(inout property: T, name: String, converter: String -> T) {
        let key = withUnsafePointer(&property, { return $0 }).hashValue

        let assign: (String -> ()) = { (org) in
            let value = converter(org)
            property = value
        }
        self.mapping[key] = (name, assign)
    }

    internal func getConverter(key: Int) -> (String?, (String -> ())?)? {
        return mapping[key]
    }
}