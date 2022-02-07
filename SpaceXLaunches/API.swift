// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LaunchDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LaunchDetail($myId: ID!) {
      launch(id: $myId) {
        __typename
        id
        details
        mission_name
        links {
          __typename
          flickr_images
          video_link
          reddit_media
          article_link
          wikipedia
          reddit_campaign
        }
        launch_success
        launch_date_utc
        mission_id
        rocket {
          __typename
          rocket_type
          rocket {
            __typename
            name
            success_rate_pct
            type
            wikipedia
            stages
            height {
              __typename
              meters
            }
            country
            mass {
              __typename
              kg
            }
          }
        }
      }
    }
    """

  public let operationName: String = "LaunchDetail"

  public var myId: GraphQLID

  public init(myId: GraphQLID) {
    self.myId = myId
  }

  public var variables: GraphQLMap? {
    return ["myId": myId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launch", arguments: ["id": GraphQLVariable("myId")], type: .object(Launch.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launch: Launch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launch": launch.flatMap { (value: Launch) -> ResultMap in value.resultMap }])
    }

    public var launch: Launch? {
      get {
        return (resultMap["launch"] as? ResultMap).flatMap { Launch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "launch")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("links", type: .object(Link.selections)),
          GraphQLField("launch_success", type: .scalar(Bool.self)),
          GraphQLField("launch_date_utc", type: .scalar(String.self)),
          GraphQLField("mission_id", type: .list(.scalar(String.self))),
          GraphQLField("rocket", type: .object(Rocket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, details: String? = nil, missionName: String? = nil, links: Link? = nil, launchSuccess: Bool? = nil, launchDateUtc: String? = nil, missionId: [String?]? = nil, rocket: Rocket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "details": details, "mission_name": missionName, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }, "launch_success": launchSuccess, "launch_date_utc": launchDateUtc, "mission_id": missionId, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
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

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public var launchSuccess: Bool? {
        get {
          return resultMap["launch_success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_success")
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

      public var missionId: [String?]? {
        get {
          return resultMap["mission_id"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_id")
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

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("flickr_images", type: .list(.scalar(String.self))),
            GraphQLField("video_link", type: .scalar(String.self)),
            GraphQLField("reddit_media", type: .scalar(String.self)),
            GraphQLField("article_link", type: .scalar(String.self)),
            GraphQLField("wikipedia", type: .scalar(String.self)),
            GraphQLField("reddit_campaign", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(flickrImages: [String?]? = nil, videoLink: String? = nil, redditMedia: String? = nil, articleLink: String? = nil, wikipedia: String? = nil, redditCampaign: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "flickr_images": flickrImages, "video_link": videoLink, "reddit_media": redditMedia, "article_link": articleLink, "wikipedia": wikipedia, "reddit_campaign": redditCampaign])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var flickrImages: [String?]? {
          get {
            return resultMap["flickr_images"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "flickr_images")
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

        public var redditMedia: String? {
          get {
            return resultMap["reddit_media"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "reddit_media")
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

        public var wikipedia: String? {
          get {
            return resultMap["wikipedia"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "wikipedia")
          }
        }

        public var redditCampaign: String? {
          get {
            return resultMap["reddit_campaign"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "reddit_campaign")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket_type", type: .scalar(String.self)),
            GraphQLField("rocket", type: .object(Rocket.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocketType: String? = nil, rocket: Rocket? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket_type": rocketType, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rocketType: String? {
          get {
            return resultMap["rocket_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_type")
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

        public struct Rocket: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rocket"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("success_rate_pct", type: .scalar(Int.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("wikipedia", type: .scalar(String.self)),
              GraphQLField("stages", type: .scalar(Int.self)),
              GraphQLField("height", type: .object(Height.selections)),
              GraphQLField("country", type: .scalar(String.self)),
              GraphQLField("mass", type: .object(Mass.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, successRatePct: Int? = nil, type: String? = nil, wikipedia: String? = nil, stages: Int? = nil, height: Height? = nil, country: String? = nil, mass: Mass? = nil) {
            self.init(unsafeResultMap: ["__typename": "Rocket", "name": name, "success_rate_pct": successRatePct, "type": type, "wikipedia": wikipedia, "stages": stages, "height": height.flatMap { (value: Height) -> ResultMap in value.resultMap }, "country": country, "mass": mass.flatMap { (value: Mass) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var successRatePct: Int? {
            get {
              return resultMap["success_rate_pct"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "success_rate_pct")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var wikipedia: String? {
            get {
              return resultMap["wikipedia"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "wikipedia")
            }
          }

          public var stages: Int? {
            get {
              return resultMap["stages"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "stages")
            }
          }

          public var height: Height? {
            get {
              return (resultMap["height"] as? ResultMap).flatMap { Height(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "height")
            }
          }

          public var country: String? {
            get {
              return resultMap["country"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          public var mass: Mass? {
            get {
              return (resultMap["mass"] as? ResultMap).flatMap { Mass(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "mass")
            }
          }

          public struct Height: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Distance"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("meters", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(meters: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "Distance", "meters": meters])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var meters: Double? {
              get {
                return resultMap["meters"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "meters")
              }
            }
          }

          public struct Mass: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Mass"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("kg", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(kg: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "Mass", "kg": kg])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var kg: Int? {
              get {
                return resultMap["kg"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "kg")
              }
            }
          }
        }
      }
    }
  }
}

public final class LaunchListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LaunchList($offset: Int) {
      launches(offset: $offset, order: "desc", sort: "launch_date_utc", limit: 10) {
        __typename
        id
        mission_name
        launch_date_utc
        launch_site {
          __typename
          site_name_long
        }
        rocket {
          __typename
          rocket_name
        }
        links {
          __typename
          mission_patch
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
        GraphQLField("launches", arguments: ["offset": GraphQLVariable("offset"), "order": "desc", "sort": "launch_date_utc", "limit": 10], type: .list(.object(Launch.selections))),
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
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("launch_date_utc", type: .scalar(String.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
          GraphQLField("links", type: .object(Link.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, missionName: String? = nil, launchDateUtc: String? = nil, launchSite: LaunchSite? = nil, rocket: Rocket? = nil, links: Link? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "id": id, "mission_name": missionName, "launch_date_utc": launchDateUtc, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      public var launchSite: LaunchSite? {
        get {
          return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
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

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
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

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocketName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket_name": rocketName])
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
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mission_patch", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(missionPatch: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "mission_patch": missionPatch])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var missionPatch: String? {
          get {
            return resultMap["mission_patch"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mission_patch")
          }
        }
      }
    }
  }
}
