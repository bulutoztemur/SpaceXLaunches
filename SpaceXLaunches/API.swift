// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LaunchListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LaunchList($offset: Int) {
      launches(offset: $offset, order: "launch_date_utc", sort: "DESC", limit: 10) {
        __typename
        mission_name
        launch_date_utc
        launch_date_local
        launch_site {
          __typename
          site_name_long
        }
        links {
          __typename
          article_link
          video_link
        }
        rocket {
          __typename
          rocket_name
          second_stage {
            __typename
            payloads {
              __typename
              payload_type
              payload_mass_kg
              payload_mass_lbs
            }
          }
        }
        ships {
          __typename
          home_port
          image
          weight_kg
        }
      }
    }
    """

  public let operationName: String = "LaunchList"

  public var offset: Int?

  public init(offset: Int? = nil) {
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launches", arguments: ["offset": GraphQLVariable("offset"), "order": "launch_date_utc", "sort": "DESC", "limit": 10], type: .list(.object(Launch.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launches: [Launch?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launches": launches.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }])
    }

    public var launches: [Launch?]? {
      get {
        return (resultMap["launches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Launch?] in value.map { (value: ResultMap?) -> Launch? in value.flatMap { (value: ResultMap) -> Launch in Launch(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Launch?]) -> [ResultMap?] in value.map { (value: Launch?) -> ResultMap? in value.flatMap { (value: Launch) -> ResultMap in value.resultMap } } }, forKey: "launches")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("launch_date_utc", type: .scalar(String.self)),
          GraphQLField("launch_date_local", type: .scalar(String.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
          GraphQLField("links", type: .object(Link.selections)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
          GraphQLField("ships", type: .list(.object(Ship.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(missionName: String? = nil, launchDateUtc: String? = nil, launchDateLocal: String? = nil, launchSite: LaunchSite? = nil, links: Link? = nil, rocket: Rocket? = nil, ships: [Ship?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "mission_name": missionName, "launch_date_utc": launchDateUtc, "launch_date_local": launchDateLocal, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "ships": ships.flatMap { (value: [Ship?]) -> [ResultMap?] in value.map { (value: Ship?) -> ResultMap? in value.flatMap { (value: Ship) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var launchDateUtc: String? {
        get {
          return resultMap["launch_date_utc"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_utc")
        }
      }

      public var launchDateLocal: String? {
        get {
          return resultMap["launch_date_local"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_local")
        }
      }

      public var launchSite: LaunchSite? {
        get {
          return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
        }
      }

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public var ships: [Ship?]? {
        get {
          return (resultMap["ships"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Ship?] in value.map { (value: ResultMap?) -> Ship? in value.flatMap { (value: ResultMap) -> Ship in Ship(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Ship?]) -> [ResultMap?] in value.map { (value: Ship?) -> ResultMap? in value.flatMap { (value: Ship) -> ResultMap in value.resultMap } } }, forKey: "ships")
        }
      }

      public struct LaunchSite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchSite"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("site_name_long", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(siteNameLong: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_name_long": siteNameLong])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var siteNameLong: String? {
          get {
            return resultMap["site_name_long"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name_long")
          }
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("article_link", type: .scalar(String.self)),
            GraphQLField("video_link", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(articleLink: String? = nil, videoLink: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "article_link": articleLink, "video_link": videoLink])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var articleLink: String? {
          get {
            return resultMap["article_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "article_link")
          }
        }

        public var videoLink: String? {
          get {
            return resultMap["video_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "video_link")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket_name", type: .scalar(String.self)),
            GraphQLField("second_stage", type: .object(SecondStage.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocketName: String? = nil, secondStage: SecondStage? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket_name": rocketName, "second_stage": secondStage.flatMap { (value: SecondStage) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rocketName: String? {
          get {
            return resultMap["rocket_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_name")
          }
        }

        public var secondStage: SecondStage? {
          get {
            return (resultMap["second_stage"] as? ResultMap).flatMap { SecondStage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "second_stage")
          }
        }

        public struct SecondStage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LaunchRocketSecondStage"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("payloads", type: .list(.object(Payload.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(payloads: [Payload?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LaunchRocketSecondStage", "payloads": payloads.flatMap { (value: [Payload?]) -> [ResultMap?] in value.map { (value: Payload?) -> ResultMap? in value.flatMap { (value: Payload) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var payloads: [Payload?]? {
            get {
              return (resultMap["payloads"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Payload?] in value.map { (value: ResultMap?) -> Payload? in value.flatMap { (value: ResultMap) -> Payload in Payload(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Payload?]) -> [ResultMap?] in value.map { (value: Payload?) -> ResultMap? in value.flatMap { (value: Payload) -> ResultMap in value.resultMap } } }, forKey: "payloads")
            }
          }

          public struct Payload: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Payload"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("payload_type", type: .scalar(String.self)),
                GraphQLField("payload_mass_kg", type: .scalar(Double.self)),
                GraphQLField("payload_mass_lbs", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(payloadType: String? = nil, payloadMassKg: Double? = nil, payloadMassLbs: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "Payload", "payload_type": payloadType, "payload_mass_kg": payloadMassKg, "payload_mass_lbs": payloadMassLbs])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var payloadType: String? {
              get {
                return resultMap["payload_type"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "payload_type")
              }
            }

            public var payloadMassKg: Double? {
              get {
                return resultMap["payload_mass_kg"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "payload_mass_kg")
              }
            }

            public var payloadMassLbs: Double? {
              get {
                return resultMap["payload_mass_lbs"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "payload_mass_lbs")
              }
            }
          }
        }
      }

      public struct Ship: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Ship"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("home_port", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("weight_kg", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(homePort: String? = nil, image: String? = nil, weightKg: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Ship", "home_port": homePort, "image": image, "weight_kg": weightKg])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var homePort: String? {
          get {
            return resultMap["home_port"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "home_port")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        public var weightKg: Int? {
          get {
            return resultMap["weight_kg"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "weight_kg")
          }
        }
      }
    }
  }
}
